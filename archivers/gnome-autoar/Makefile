# $NetBSD: Makefile,v 1.7 2021/12/08 16:01:42 adam Exp $

DISTNAME=	gnome-autoar-0.4.1
PKGREVISION=	1
CATEGORIES=	archivers gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/${PKGBASE}/${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	cirnatdan@NetBSD.org
HOMEPAGE=	https://gitlab.gnome.org/GNOME/gnome-autoar
COMMENT=	GLib wrapper around libarchive
LICENSE=	gnu-lgpl-v2.1

USE_TOOLS+=	pkg-config gmake
USE_LIBTOOL=	yes

MESON_ARGS+=	-Dintrospection=enabled

.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../lang/vala/buildlink3.mk"
.include "../../devel/glib2/schemas.mk"
.include "../../archivers/libarchive/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
