# $NetBSD: Makefile,v 1.24 2021/12/02 18:15:26 nia Exp $

DISTNAME=	xf86-video-ast-1.1.5
PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_XORG:=driver/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	joerg@NetBSD.org
HOMEPAGE=	https://xorg.freedesktop.org/
COMMENT=	Modular Xorg AST2000 video driver

USE_LIBTOOL=	yes
GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

RELRO_SUPPORTED=	partial

CONFIGURE_ENV.SunOS+=	DRIVER_MAN_SUFFIX=4

X11_BUILTIN_NAME=	xf86-video-ast
.include "../../meta-pkgs/modular-xorg/avoid-duplicate.mk"
.include "../../x11/modular-xorg-server/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
