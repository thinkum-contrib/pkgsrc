# $NetBSD: Makefile,v 1.27 2021/12/08 16:03:07 adam Exp $

DISTNAME=	cantata-2.4.2
PKGREVISION=	9
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=CDrummond/}
GITHUB_RELEASE=	v${PKGVERSION_NOREV}
EXTRACT_SUFX=	.tar.bz2
DIST_SUBDIR=	cantata-2.4.2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/CDrummond/cantata
COMMENT=	Qt5 Graphical MPD Client
LICENSE=	gnu-gpl-v3

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

USE_CMAKE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	bash:run perl:run

REPLACE_PERL+=	playlists/cantata-dynamic
REPLACE_BASH+=	cantata-remote.cmake

.include "../../mk/bsd.prefs.mk"

PLIST_VARS+=	notdarwin
.if ${OPSYS} == "Darwin"
.include "../../x11/qt5-qtmacextras/buildlink3.mk"
.else
PLIST.notdarwin=	yes
.endif

.include "../../audio/libebur128/buildlink3.mk"
.include "../../audio/mpg123/buildlink3.mk"
.include "../../audio/taglib/buildlink3.mk"
.include "../../devel/libmtp/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../multimedia/ffmpeg4/buildlink3.mk"
.include "../../net/avahi/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
BUILDLINK_API_DEPENDS.qt5-qtbase+=	qt5-qtbase>=5.11
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
