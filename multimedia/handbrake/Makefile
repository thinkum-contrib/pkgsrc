# $NetBSD: Makefile,v 1.74 2022/03/12 08:01:50 nia Exp $
#

DISTNAME=	HandBrake-1.3.3-source
PKGNAME=	${DISTNAME:tl:S/-source//}
PKGREVISION=	4
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GITHUB:=HandBrake/}
EXTRACT_SUFX=	.tar.bz2
GITHUB_PROJECT=	HandBrake
GITHUB_RELEASE=	1.3.3

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://handbrake.fr/
COMMENT=	Multiplatform, multithreaded video transcoder
LICENSE=	gnu-gpl-v2

DIST_SUBDIR=	handbrake
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
CDISTFILES=	ffmpeg-4.2.3.tar.bz2 \
		libbluray-1.1.2.tar.bz2 \
		libdvdnav-6.0.1.tar.bz2 \
		libdvdread-6.0.2.tar.bz2 \
		x265_3.2.1.tar.gz \
		dav1d-0.5.1.tar.bz2

MESON_DISTFILE=	meson-0.55.0.tar.gz
DISTFILES+=	${CDISTFILES}
DISTFILES+=	${MESON_DISTFILE}

.for f in ${CDISTFILES}
SITES.${f}=	https://download.handbrake.fr/handbrake/contrib/
.endfor
# handbrake.fr does not have ffmpeg-4.2.3.tar.bz2 as of 2021-01-10.
SITES.ffmpeg-4.2.3.tar.bz2=	http://www.ffmpeg.org/releases/

SITES.${MESON_DISTFILE}=	${MASTER_SITE_PYPI:=m/meson/}

RESTRICTED=		Unresolved patent issues
NO_BIN_ON_CDROM=	${RESTRICTED}
NO_BIN_ON_FTP=		${RESTRICTED}
NO_SRC_ON_CDROM=	${RESTRICTED}
NO_SRC_ON_FTP=		${RESTRICTED}

WRKSRC=		${WRKDIR}/${DISTNAME:S/-source//}

HAS_CONFIGURE=	yes
USE_TOOLS+=	gmake perl intltool msgfmt pkg-config bash
USE_TOOLS+=	autoconf automake aclocal autoreconf m4
USE_LIBTOOL=	yes
USE_LANGUAGES=	c c++

BUILDLINK_TRANSFORM.NetBSD+=	rm:-ldl

CONFIGURE_ARGS+=	--prefix=${PREFIX}
BUILD_DIRS=		build
MAKE_FILE=		GNUmakefile
BUILD_TARGET=		# empty
BUILD_FLAGS+=		BUILDLINK_DIR=${BUILDLINK_DIR}

BUILD_DEPENDS+=		cmake-[0-9]*:../../devel/cmake
BUILD_DEPENDS+=		nasm>=2.05.01:../../devel/nasm
BUILD_DEPENDS+=		meson-[0-9]*:../../devel/meson
#BUILD_DEPENDS+=	gettext-m4-[0-9]*:../../devel/gettext-m4

.include "../../mk/compiler.mk"

.if !empty(PKGSRC_COMPILER:Mclang)
CFLAGS+=	-fheinous-gnu-extensions
.endif

post-extract:
	${MKDIR} ${WRKSRC}/download
.for distfile in ${CDISTFILES}
	cp ${DISTDIR}/${DIST_SUBDIR}/${distfile} \
		${WRKSRC}/download/
.endfor
	cp ${DISTDIR}/${DIST_SUBDIR}/${MESON_DISTFILE} ${WRKSRC}/download/
	(cd ${WRKSRC}/contrib; tar zxf ${WRKSRC}/download/${MESON_DISTFILE})

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../audio/lame/buildlink3.mk"
.include "../../audio/libopus/buildlink3.mk"
.include "../../audio/libsamplerate/buildlink3.mk"
.include "../../audio/speex/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/gettext-tools/msgfmt-desktop.mk"
.include "../../multimedia/gstreamer1/buildlink3.mk"
.include "../../multimedia/libass/buildlink3.mk"
.include "../../multimedia/libtheora/buildlink3.mk"
.include "../../multimedia/libvpx/buildlink3.mk"
.include "../../multimedia/x264-devel/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../textproc/jansson/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
