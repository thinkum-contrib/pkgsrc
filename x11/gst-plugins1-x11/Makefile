# $NetBSD: Makefile,v 1.5 2021/12/08 16:07:05 adam Exp $

PKGNAME=	${DISTNAME:S/plugins/plugins1/:S/-base/-x11/}
PKGREVISION=	1
CATEGORIES=	x11 gnome

COMMENT=	Open source multimedia framework - X11 plugin

GST_EXT_BUILD=		# defined
GST_EXT_BASEDIR=	sys

GST_PLUGINS+=		xshm
GST_PLUGINS+=		xvideo
GST_PLUGINS+=		x11

GST_PLUGIN_DIRS+=	ximage
GST_PLUGIN_DIRS+=	xvimage

.include "../../multimedia/gst-plugins1-base/Makefile.common"
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXv/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
