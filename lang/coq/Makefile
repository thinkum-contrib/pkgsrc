# $NetBSD: Makefile,v 1.141 2021/12/08 16:05:20 adam Exp $
#

DISTNAME=	coq-8.12.2
PKGREVISION=	3
CATEGORIES=	lang math
MASTER_SITES=	${MASTER_SITE_GITHUB:=coq/}
GITHUB_TAG=	V${PKGVERSION_NOREV:S/_/+/}

MAINTAINER=	dholland@NetBSD.org
HOMEPAGE=	https://coq.inria.fr/
COMMENT=	Theorem prover which extracts programs from proofs
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/${GITHUB_PROJECT}-${PKGVERSION_NOREV:S/+/-/}

USE_TOOLS+=		bash
USE_TOOLS+=		gmake
HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	-prefix ${PREFIX}
#CONFIGURE_ARGS+=	-emacslib ${PREFIX}/share/emacs/site-lisp
CONFIGURE_ARGS+=	-mandir ${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=	-configdir ${PKG_SYSCONFDIR}/xdg/coq
CONFIGURE_ARGS+=	-docdir ${PREFIX}/share/doc/coq
CONFIGURE_ARGS+=	-coqdocdir ${PREFIX}/share/texmf-dist/tex/latex/coq
CONFIGURE_ARGS+=	-flambda-opts '-O3 -unbox-closures'

BUILDLINK_API_DEPENDS.ocaml+=	ocaml>=3.10

# datestamp for reproducible builds (this ends up in compiled proofs)
# Use the upstream release date plus (arbitrarily) 11 days, the latter
# being a venture to hopefully avoid accepting compiled proof files from
# elsewhere that likely are not in fact compatible.
MAKE_ENV+=		SOURCE_DATE_EPOCH=20201222

.include "../../mk/bsd.prefs.mk"
.include "../../mk/ocaml.mk"

PLIST_VARS+=		native
.if ${OCAML_USE_OPT_COMPILER} == "yes"
COQIDE_TYPE=		opt
PLIST.native=		yes
CONFIGURE_ARGS+=	-native-compiler yes
UNLIMIT_RESOURCES+=	stacksize # compilation of some files needs this
BUILD_TARGET=		world
.else
COQIDE_TYPE=		byte
CONFIGURE_ARGS+=	-native-compiler no
BUILD_TARGET=		byte
INSTALL_TARGET=		install-byte
.endif
PLIST_SUBST+=		COQIDE_TYPE=${COQIDE_TYPE}

.if (${MACHINE_ARCH} == "i386") || (${MACHINE_ARCH} == "x86_64")
.  if !empty(MACHINE_PLATFORM:MLinux-*-*) || \
      !empty(MACHINE_PLATFORM:MDragonFly-*-*) || \
      !empty(MACHINE_PLATFORM:MFreeBSD-*-*) || \
      !empty(MACHINE_PLATFORM:MDarwin-*-*) || \
      !empty(MACHINE_PLATFORM:MNetBSD-*-*)
PLIST.natdynlink=	yes
.  endif
.endif

.include "../../lang/python/pyversion.mk"

REPLACE_SH=		configure install.sh
REPLACE_INTERPRETER=	python
REPLACE.python.old=	python3
REPLACE.python.new=	${PYTHONBIN}
REPLACE_FILES.python=	tools/TimeFileMaker.py \
			tools/make-both-single-timing-files.py \
			tools/make-both-time-files.py \
			tools/make-one-time-file.py

INSTALL_ENV+=	COQINSTALLPREFIX=${DESTDIR}

PLIST_VARS+=		coqide natdynlink doc

.include "options.mk"

EGDIR=		${PREFIX}/share/coq/examples
#CONF_FILES=	{EGDIR}/coqide-gtk2rc ${PKG_SYSCONFDIR}/xdg/coq/coqide-gtk2rc

.include "../../math/ocaml-num/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
