# $NetBSD: Makefile,v 1.3 2022/01/06 12:55:21 fcambus Exp $

DISTNAME=	swirc-3.3.3
CATEGORIES=	chat
MASTER_SITES=	https://www.nifty-networks.net/swirc/releases/
EXTRACT_SUFX=	.tgz

MAINTAINER=	fcambus@NetBSD.org
HOMEPAGE=	https://www.nifty-networks.net/swirc/
COMMENT=	Console based ICB and IRC client
LICENSE=	modified-bsd

HAS_CONFIGURE=		yes
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

MAKE_FLAGS+=	Q= CC="${CC}" CXX="${CXX}"
MAKE_FLAGS+=	DEST_MANUAL=${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
MAKE_FLAGS+=	DEST_CONFMAN=${DESTDIR}${PREFIX}/${PKGMANDIR}/man5

.include "../../devel/libidn/buildlink3.mk"
.include "../../devel/ncursesw/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
