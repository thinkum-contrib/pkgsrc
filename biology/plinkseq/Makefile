# $NetBSD: Makefile,v 1.10 2021/11/11 12:02:47 kim Exp $

DISTNAME=	plinkseq-0.08
PKGREVISION=	5
CATEGORIES=	biology
MASTER_SITES=	https://atgu.mgh.harvard.edu/plinkseq/dist/version-0.08/

MAINTAINER=	bacon@NetBSD.org
HOMEPAGE=	https://atgu.mgh.harvard.edu/plinkseq/
COMMENT=	C/C++ library for working with human genetic variation data
LICENSE=	gnu-gpl-v2	# Assuming same as plink.  No info on web.

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_LANGUAGES=	c c++11
USE_TOOLS=	bash:run
REPLACE_BASH=	browser/pbrowse.in index/index.in

LDFLAGS.SunOS+=	-lsocket -lnsl

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} != "Linux"
BUILDLINK_TRANSFORM=	rm:-ldl
.endif

# Put missing protocol description files in place:
post-extract:
	${CP} ${FILESDIR}/pp.proto ${WRKSRC}/lib/
	${CP} ${FILESDIR}/variant.proto ${WRKSRC}/lib/

# Regenerate:
pre-build:
	cd ${WRKSRC}/lib && protoc --cpp_out=. pp.proto && mv pp.pb.cc pp.pb.cpp
	cd ${WRKSRC}/lib && protoc --cpp_out=. variant.proto && mv variant.pb.cc variant.pb.cpp

.include "../../devel/protobuf/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
