# $NetBSD: Makefile,v 1.2 2022/03/19 23:20:27 osa Exp $

DISTNAME=	njs-0.7.2
CATEGORIES=	lang www
MASTER_SITES=	${MASTER_SITE_GITHUB:=nginx/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	osa@NetBSD.org
HOMEPAGE=	https://nginx.org/en/docs/njs
COMMENT=	NGINX JavaScript command line utility
LICENSE=	2-clause-bsd

USE_LANGUAGES=	c

HAS_CONFIGURE=	yes

INSTALLATION_DIRS+=	bin

do-build:
	${RUN} cd ${WRKSRC} && ${BUILD_MAKE_CMD} njs

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/build/njs ${DESTDIR}${PREFIX}/bin/njs

.include "options.mk"
.include "../../mk/bsd.pkg.mk"
