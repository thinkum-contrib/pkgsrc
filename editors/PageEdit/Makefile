# $NetBSD: Makefile,v 1.1 2022/03/06 12:38:34 wiz Exp $

DISTNAME=	PageEdit-1.7.0
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_GITHUB:=Sigil-Ebook/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Sigil-Ebook/PageEdit/
COMMENT=	XHTML Visual Editor for ePubs
LICENSE=	gnu-gpl-v3

Qt5_DIR=	${BUILDLINK_PREFIX.qt5-qtbase}/qt5
ALL_ENV+=	Qt5_DIR=${Qt5_DIR}

BUILDLINK_TRANSFORM+=	opt:-O2:-O0

USE_LANGUAGES=	c c++0x
USE_CMAKE=	yes
USE_TOOLS+=	pkg-config

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qttools/buildlink3.mk"
.include "../../x11/qt5-qtwebengine/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
