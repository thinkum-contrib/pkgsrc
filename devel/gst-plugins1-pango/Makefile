# $NetBSD: Makefile,v 1.27 2021/12/08 16:03:58 adam Exp $

PKGNAME=	${DISTNAME:S/plugins/plugins1/:S/-base/-pango/}
PKGREVISION=	1
CATEGORIES=	devel gnome

COMMENT=	Open source multimedia framework - pango plugin

GST_EXT_BUILD=          # defined

GST_PLUGINS+=		pango

.include "../../multimedia/gst-plugins1-base/Makefile.common"
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
