# $NetBSD: Makefile,v 1.13 2021/12/08 16:04:56 adam Exp $

PKGNAME=	${DISTNAME:S/plugins/plugins1/:S/-good/-cairo/}
PKGREVISION=	1
CATEGORIES=	graphics gnome

COMMENT=	Open source multimedia framework - Cairo plugin

GST_PLUGINS+=	cairo

.include "../../multimedia/gst-plugins1-good/Makefile.common"
.include "../../graphics/cairo-gobject/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
