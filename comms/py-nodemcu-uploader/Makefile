# $NetBSD: Makefile,v 1.5 2022/01/05 15:40:58 wiz Exp $

DISTNAME=	nodemcu-uploader-0.4.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	comms
MASTER_SITES=	${MASTER_SITE_PYPI:=n/nodemcu-uploader/}

MAINTAINER=	gdt@NetBSD.org
HOMEPAGE=	https://github.com/kmpm/nodemcu-uploader/
COMMENT=	Tool to upload files to a nodemcu/ESP8266 device
LICENSE=	mit

USE_LANGUAGES=	# none

DEPENDS+=	${PYPKGPREFIX}-serial>=2.7:../../comms/py-serial
DEPENDS+=	${PYPKGPREFIX}-wrapt>=1.10.10:../../devel/py-wrapt

USE_PKG_RESOURCES=	yes

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
