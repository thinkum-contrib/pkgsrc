# $NetBSD: Makefile,v 1.9 2021/11/11 12:02:46 kim Exp $

DISTNAME=	protobuf-c-1.3.3
PKGREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=protobuf-c/}
GITHUB_RELEASE=	v${PKGVERSION_NOREV}

MAINTAINER=	wiedi@frubar.net
HOMEPAGE=	https://github.com/protobuf-c/protobuf-c
COMMENT=	Protocol Buffers implementation in C
LICENSE=	modified-bsd

USE_LANGUAGES=		c99 c++11
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	protobuf-c/libprotobuf-c.pc.in
TEST_TARGET=		check

.include "../../devel/protobuf/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
