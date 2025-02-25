# $NetBSD: Makefile,v 1.10 2022/03/08 14:04:57 fcambus Exp $

DISTNAME=	mold-1.1.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=rui314/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	fcambus@NetBSD.org
HOMEPAGE=	https://github.com/rui314/mold/
COMMENT=	High performance drop-in replacement for existing Unix linkers
LICENSE=	gnu-agpl-v3

USE_TOOLS+=	gmake
USE_LANGUAGES=	c c++20

MAKE_FLAGS+=	CFLAGS="${CFLAGS}"
MAKE_FLAGS+=	CXXFLAGS="${CXXFLAGS}"
MAKE_FLAGS+=	PREFIX="${PREFIX}"
MAKE_FLAGS+=	MANDIR="${PREFIX}/${PKGMANDIR}"
MAKE_FLAGS+=	SYSTEM_MIMALLOC=1 SYSTEM_TBB=1

# This package uses a lot of C++20 features. GCC 10 is the oldest GCC that can
# build it.
GCC_REQD+=	10

# Handle linker flags for dlopen and pthread automatically.
DL_AUTO_VARS=		yes
PTHREAD_AUTO_VARS=	yes

.include "../../devel/mimalloc/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../parallel/threadingbuildingblocks/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
