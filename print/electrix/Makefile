# $NetBSD: Makefile,v 1.86 2021/12/08 16:06:12 adam Exp $

DISTNAME=	electrix-0.2.0
PKGREVISION=	81
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=electrix/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	http://electrix.sourceforge.net/
COMMENT=	Application to view PDF files
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	intltool pkg-config
PYTHON_VERSIONS_ACCEPTED=	27

WAF_HAS_LIBDIR=	no
WAF_HAS_MANDIR=	no

.include "../../devel/waf/waf.mk"
.include "../../print/poppler-glib/buildlink3.mk"
.include "../../print/libspectre/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
