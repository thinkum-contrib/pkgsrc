# $NetBSD: Makefile,v 1.44 2021/12/08 16:02:25 adam Exp $

DISTNAME=	libkcompactdisc-${KAPPSVER}
PKGREVISION=	2
CATEGORIES=	multimedia

HOMEPAGE=	https://kde.org/applications/multimedia/
COMMENT=	Library for interfacing with CDs
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2

USE_TOOLS+=	msgmerge

.include "../../meta-pkgs/kde/applications.mk"

.include "options.mk"

.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../multimedia/phonon-qt5/buildlink3.mk"
.include "../../sysutils/solid/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
