# $NetBSD: Makefile,v 1.49 2021/12/08 16:04:37 adam Exp $

DISTNAME=	lskat-${KAPPSVER}
PKGREVISION=	4
CATEGORIES=	games

HOMEPAGE=	https://kde.org/applications/games/lskat/
COMMENT=	Lieutenant Skat card game for two players
LICENSE=	gnu-gpl-v2 AND gnu-fdl-v1.2

.include "../../meta-pkgs/kde/applications.mk"

BUILD_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

USE_TOOLS+=	msgmerge

.include "../../games/libkdegames/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
