# $NetBSD: Makefile,v 1.3 2022/03/07 09:14:03 bsiegert Exp $

GITHUB_PROJECT=	go-tools
GITHUB_TAG=	2021.1.2
DISTNAME=	go-tools-2021.1.2
PKGNAME=	go-staticcheck-${GITHUB_TAG}
PKGREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=dominikh/}

MAINTAINER=	bsiegert@NetBSD.org
HOMEPAGE=	https://github.com/dominikh/go-tools/
COMMENT=	Advanced Go linter
LICENSE=	mit

USE_LANGUAGES=		# Go
GO_BUILD_PATTERN=	./cmd/...
INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/.gopath/bin/* ${DESTDIR}${PREFIX}/bin

.include "go-modules.mk"

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
