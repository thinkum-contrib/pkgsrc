## libtool hacks.mk [thinkum]
##
## also used in cross/cross-libtool-base/hacks.mk
##

.ifndef LIBTOOL_BASE_HACKS_MK

LIBTOOL_BASE_HACKS_MK=	# Defined

## mk.conf is too early to define a target on ${WRKDIR}
## so handle all of this here
##
## Goals
## - in the libtool script, ensure environment variables
##   are preferred for some known variables
## - apply a conditional patch using awk, for libtool CC
##   under tagged libtool sections (CC, CXX, F77, ...)
##   using an environment variable by that tag name as
##   the libtool CC in that section

## TBD for cross-build tools use only GCC here, or it may leave
## global_symbol_pipe unset in the libtool script (??) which would
## result in errors.
##
## so FIXME check to ensure global_symbol_pipe is not empty


## FIXME there are probably more variables in libtool to process
## - sys_lib_search_path_spec
## - sys_lib_dlsearch_path_spec
##
## TBD for cross-build x linuxulator on FreeBSD
## - libtool runpath_var, env LD_RUN_PATH
## - libtool shlibpath_var, env LD_LIBRARY_PATH
## - libtool version_type mainly for cross/cross-libtool-base
##   or devel/libtool installed under the tgt host

## --------------------

## _LT_COMPILER_VARS - these will not have a default,
## other than as computed by libtool at time of build
##
## note that CC is handled separately, under an awk script below,
## for using environment CC, CXX, F77, etc
_LT_COMPILER_VARS+=	AS OBJDUMP NM LD AR RANLIB

## _LT_TOOLS_VARS - these will each have a default
## from TOOLS_PATH.name in the pkgsrc build environment,
## though preferring the same variable in the build environment
## when defined
_LT_TOOLS_VARS+=	SHELL SED GREP EGREP FGREP LN_S STRIP LTCC LTCFLAGS

##
## assign some defaults before processing under sed subst
##

## TBD for cross compiling
## - for LTCC, use host CC? and host CFLGS for LTCFLAGS
## - TBD taget CC, tgt CFLAGS for rest ...
_LT_DEFAULT.LTCC=	$${CC}
_LT_DEFAULT.LTCFLAGS=	$${CFLAGS:-}

_LT_PATCH_MATCH.FGREP?=	.* -F
_LT_DEFAULT.FGREP?=	$${GREP} -F

_LT_PATCH_MATCH.LN_S?=	.* -s
_LT_PATCH_SUBST.LN_S?=	$${LN:-${LN}} -s

_LT_DEFAULT.SHELL?=	${TOOLS_SHELL}

. for .V. in ${_LT_COMPILER_VARS}
_LT_DEFAULT.${.V.}?=	${${.V.}}
. endfor

. for .V. in ${_LT_TOOLS_VARS}
_LT_DEFAULT.${.V.}?=	${TOOLS_PATH.${.V.:tl}}
. endfor

## NB libtool MAGIC_CMD=file (no tools var in pkgsrc)

. for .V. in ${_LT_COMPILER_VARS} ${_LT_TOOLS_VARS}
_LT_PATCH_MATCH.${.V.}?=	.*
_LT_PATCH_SUBST.${.V.}?=	$${${.V.}:-${_LT_DEFAULT.${.V.}}}

SUBST_SED.lt_patch+=	-e 's@^${.V.}="${_LT_PATCH_MATCH.${.V.}}"@${.V.}="${_LT_PATCH_SUBST.${.V.}}"@'
. endfor

SUBST_CLASSES+=		lt_patch
SUBST_STAGE.lt_patch?=	post-build
SUBST_MESSAGE.lt_patch?=Patching libtool script variables
SUBST_FILES.lt_patch?=	libtool

## using awk for contextual subst
## in a style after pkgsrc subst.mk

_SUBST_COOKIE.lt_awk_patch=	${WRKDIR}/.subst.lt_awk_patch_done

post-build:	${_SUBST_COOKIE.lt_awk_patch}

${_SUBST_COOKIE.lt_awk_patch}:
	${RUN} ${ECHO} '=> Substituting libtool tagged compilers'
	${RUN} ${AWK} 'BEGIN { FS="\(: \|=\)"; TAG="CC" } \
	  $$1 ~ "BEGIN LIBTOOL TAG CONFIG" { TAG=$$2; print $$0; next } \
	  $$1 == "CC" { gsub("\"","",$$2); print "CC=\"$${" TAG ":-" $$2 "}\""; next } \
	  // { print $$0 }' ${WRKSRC}/libtool > ${WRKSRC}/libtool.patched-2
	${RUN} ${MV} ${WRKSRC}/libtool ${WRKSRC}/libtool.patched-1
	${RUN} ${MV} ${WRKSRC}/libtool.patched-2 ${WRKSRC}/libtool
	${RUN} ${TOUCH} ${TOUCH_FLAGS} ${.TARGET}.tmp
	${RUN} ${MV} ${.TARGET}.tmp ${.TARGET}

PKG_HACKS+=	lt_patch

.endif ## LIBTOOL_BASE_HACKS_MK
