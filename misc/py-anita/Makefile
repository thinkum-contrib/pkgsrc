# $NetBSD: Makefile,v 1.73 2022/01/09 11:58:15 wiz Exp $

DISTNAME=	anita-2.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	misc
MASTER_SITES=	http://www.gson.org/netbsd/anita/download/

MAINTAINER=	gson@NetBSD.org
HOMEPAGE=	https://www.gson.org/netbsd/anita/
COMMENT=	Automated NetBSD Installation and Test Application
LICENSE=	isc

DEPENDS+=	cdrtools>=2.00.00.00:../../sysutils/cdrtools
DEPENDS+=	${PYPKGPREFIX}-pexpect>=2.1:../../devel/py-pexpect

USE_LANGUAGES=	#none

.include "../../mk/bsd.prefs.mk"

.if ${PKGMANDIR} != man
SUBST_CLASSES+=		manpath
SUBST_STAGE.manpath=	pre-configure
SUBST_FILES.manpath=	setup.py
SUBST_SED.manpath=	-e 's,man/,${PKGMANDIR}/,g'
.endif

do-test:
	${TRUE}		# Tests not integrated into pkgsrc

.include "options.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
