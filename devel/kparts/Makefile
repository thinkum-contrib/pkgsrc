# $NetBSD: Makefile,v 1.47 2021/12/08 16:01:55 adam Exp $

DISTNAME=	kparts-${KF5VER}
PKGREVISION=	4
CATEGORIES=	devel

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Document centric plugin system
LICENSE=	gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf5.mk"

USE_TOOLS+=	gmake msgmerge

.include "../../devel/kio/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
