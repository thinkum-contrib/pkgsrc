# $NetBSD: Makefile,v 1.69 2021/12/08 16:03:17 adam Exp $
#

DISTNAME=	MuSE-0.9
PKGNAME=	${DISTNAME:S/MuSE/muse/}
PKGREVISION=	44
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.dyne.org/muse/releases/
MASTER_SITES+=	http://www.ljudmila.org/~jaromil/mirror/muse/releases/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://muse.dyne.org/
COMMENT=	Multiple Streaming Engine
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++03
USE_TOOLS+=		gmake pkg-config msgfmt
USE_PKGLOCALEDIR=	yes

CONFIGURE_ARGS+=	--disable-ncurses
CONFIGURE_ARGS+=	--disable-lubrify
CONFIGURE_ARGS+=	--enable-gtk2
LIBS+=			${LIBOSSAUDIO}
MAKE_ENV+=		PKGLOCALEDIR=${PKGLOCALEDIR:Q}
MAKE_FLAGS+=		docsdir=${PREFIX:Q}/share/doc/MuSE

LIBS.SunOS+=		-lsocket -lnsl

SUBST_CLASSES+=		dsp
SUBST_STAGE.dsp=	pre-configure
SUBST_FILES.dsp=	src/jmixer.cpp src/libmpeg/fileplayer.cc
SUBST_SED.dsp=		-e "s,/dev/dsp,${DEVOSSAUDIO},g"
SUBST_MESSAGE.dsp=	Fixing hardcoded audio device.

.include "../../audio/lame/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
