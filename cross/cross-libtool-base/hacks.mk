## hacks.mk for cross/cross-libtool-base [thinkum]

.ifndef CROSS_LIBTOOL_BASE_HACKS_MK

CROSS_LIBTOOL_BASE_HACKS_MK=	# Defined

##
## clean/update some variables added from the build host environment
## in the libtool script build
##

_LT_EMPTY_VARS+=	predep_objects postdep_objects predeps postdeps
_LT_EMPTY_VARS+=	sys_lib_search_path_spec
_LT_EMPTY_VARS+=	sys_lib_dlsearch_path_spec

_LT_TOOLS_VARS+=	compiler_lib_search_path compiler_lib_search_dirs ${_LT_EMPTY_VARS}

_LT_PATCH_SUBST.compiler_lib_search_path=	-L$${CROSS_DESTDIR:-${CROSS_DESTDIR}}/lib -L$${CROSS_DESTDIR:-${CROSS_DESTDIR}}/usr/lib

_LT_PATCH_SUBST.compiler_lib_search_dirs=	$${CROSS_DESTDIR:-${CROSS_DESTDIR}}/lib $${CROSS_DESTDIR:-${CROSS_DESTDIR}}/usr/lib

.for .V. in ${_LT_EMPTY_VARS}
_LT_PATCH_SUBST.${.V.}=
.endfor

.-include "../../devel/libtool-base/hacks.mk"

.endif
