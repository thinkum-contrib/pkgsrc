# $NetBSD: Makefile,v 1.90 2021/12/08 16:02:32 adam Exp $

DISTNAME=	mupdf-1.19.0-source
PKGNAME=	${DISTNAME:S/-source//}
PKGREVISION=	1
CATEGORIES=	print
MASTER_SITES=	https://mupdf.com/downloads/archive/

MAINTAINER=	leot@NetBSD.org
HOMEPAGE=	https://mupdf.com/
COMMENT=	Lightweight PDF, XPS and E-book viewer and toolkit
LICENSE=	gnu-agpl-v3

USE_LANGUAGES=	c99 c++
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake

INSTALLATION_DIRS+=	bin include lib/pkgconfig
INSTALL_MAKE_FLAGS+=	prefix=${PREFIX}
INSTALL_MAKE_FLAGS+=	mandir=${PREFIX}/${PKGMANDIR}
LDFLAGS+=		${COMPILER_RPATH_FLAG}${X11BASE}/lib
MAKE_FLAGS+=		LDFLAGS=${LDFLAGS:Q}
MAKE_FLAGS+=		XCFLAGS=${CFLAGS:Q}
MAKE_FLAGS+=		build=release
MAKE_ENV+=		USE_SYSTEM_LIBS=yes

CFLAGS.SunOS+=	-D_XOPEN_SOURCE=600

.include "options.mk"

# Remove thirdparty directory in order to use the libraries provided by pkgsrc
# mujs directory is an exception and should not be removed (MuJS is the
# default Javascript interpreter for mupdf).
post-extract:
	${RM} -fr \
	    ${WRKSRC}/thirdparty/curl \
	    ${WRKSRC}/thirdparty/freeglut \
	    ${WRKSRC}/thirdparty/freetype \
	    ${WRKSRC}/thirdparty/gumbo-parser \
	    ${WRKSRC}/thirdparty/harfbuzz \
	    ${WRKSRC}/thirdparty/jbig2dec \
	    ${WRKSRC}/thirdparty/leptonica \
	    ${WRKSRC}/thirdparty/lcms2 \
	    ${WRKSRC}/thirdparty/libjpeg \
	    ${WRKSRC}/thirdparty/openjpeg \
	    ${WRKSRC}/thirdparty/tesseract \
	    ${WRKSRC}/thirdparty/zlib

post-build:
	sed -e "s,@PREFIX@,${PREFIX}," -e "s,@VERSION@,${PKGVERSION_NOREV}," \
	     ${FILESDIR}/mupdf.pc > ${WRKSRC}/mupdf.pc

post-install:
	${INSTALL_DATA} ${WRKSRC}/mupdf.pc ${DESTDIR}${PREFIX}/lib/pkgconfig

BUILDLINK_API_DEPENDS.zlib+=	zlib>=1.2.7
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/harfbuzz/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/jbig2dec/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
# XXX: mupdf needs lcms2-art fork
#BUILDLINK_API_DEPENDS.lcms2+= lcms2>=2.9
#.include "../../graphics/lcms2/buildlink3.mk"
.include "../../graphics/openjpeg/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../www/gumbo-parser/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
