# $NetBSD: Makefile,v 1.23 2020/04/13 19:11:31 joerg Exp $
#

DISTNAME=	ilisp-20021222
PKGNAME=	${EMACS_PKGNAME_PREFIX}emacs-${DISTNAME}
PKGREVISION=	8
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ilisp/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://sourceforge.net/projects/ilisp/
COMMENT=	Emacs interface to embedded Lisp process
#LICENSE=	# ILISP License, see COPYING file.

EMACS_VERSIONS_ACCEPTED= emacs20 emacs21 emacs21nox

MAKE_ENV+=	EMACS=${EMACS_BIN:Q}
BUILD_TARGET=	compile

SITELISP=	${EMACS_LISPPREFIX}/ilisp

SUBST_CLASSES+=			string-to-int
SUBST_STAGE.string-to-int=	pre-configure
SUBST_MESSAGE.string-to-int=	obsolete function (as of 22.1); use string-to-number instead
SUBST_FILES.string-to-int+=	ilisp-acl.el
SUBST_SED.string-to-int=	-e 's/string-to-int/string-to-number/'

.include "../../mk/bsd.prefs.mk"
.include "../../${EMACS_BASE:Ueditors/emacs}/modules.mk"

.if empty(EMACS_TYPE:Mxemacs*) && \
	( ${EMACS_VERSION_MAJOR} != 20 ) && \
	( ${EMACS_VERSION_MAJOR} != 19 )
## NB: For ilisp in any GNU Emacs of any major version using 21 or
## later, fsf-21 will be used as +ilisp-emacs-version-id+
##
## Subsequently, the ilisp source file ilfsf21.el should be byte
## compiled during the main do-build, in those Emacs,
##
## In other Emacs, ilfsf21.el will still be installed as an Emacs Lisp
## source file, but with no byte compiled representation.
##
## +ilisp-emacs-version-id+ is set in ilcompat.el and applied in
## ilisp-mak.el such as for purposes of runtime portability when byte
## compiling the ilisp source files
PLIST_SUBST+=FOR_emacs21=""
.endif

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/share/doc/emacs-ilisp
	${INSTALL_DATA} ${WRKSRC}/INSTALLATION \
		${DESTDIR}${PREFIX}/share/doc/emacs-ilisp
	${INSTALL_DATA} ${WRKSRC}/README \
		${DESTDIR}${PREFIX}/share/doc/emacs-ilisp
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/share/examples/emacs-ilisp
	${INSTALL_DATA} ${WRKSRC}/ilisp.emacs \
		${DESTDIR}${PREFIX}/share/examples/emacs-ilisp
	${INSTALL_DATA_DIR} ${DESTDIR}${SITELISP}
	${INSTALL_DATA} ${WRKSRC}/*.el ${DESTDIR}${SITELISP}
	${INSTALL_DATA} ${WRKSRC}/*.elc ${DESTDIR}${SITELISP}
	${INSTALL_DATA} ${WRKSRC}/*.lisp ${DESTDIR}${SITELISP}
	${INSTALL_DATA} ${WRKSRC}/*.scm ${DESTDIR}${SITELISP}
	${INSTALL_DATA_DIR} ${DESTDIR}${SITELISP}/extra
	${INSTALL_DATA} ${WRKSRC}/extra/*.el ${DESTDIR}${SITELISP}/extra
	${INSTALL_DATA} ${WRKSRC}/extra/*.elc ${DESTDIR}${SITELISP}/extra

.include "../../mk/bsd.pkg.mk"
