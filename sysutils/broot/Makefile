# $NetBSD: Makefile,v 1.43 2022/03/15 09:07:10 pin Exp $

# broot >= 1.9.4 requires Rust-1.59
DISTNAME=	broot-1.9.3
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=Canop/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://dystroy.org/broot/
COMMENT=	New way to see and navigate directory trees
LICENSE=	mit

.include "cargo-depends.mk"

USE_TOOLS+=			pkg-config
PYTHON_VERSIONS_INCOMPATIBLE=	27
PYTHON_FOR_BUILD_ONLY=		tool
BUILD_DEPENDS+=			${PYPKGPREFIX}-expat-[0-9]*:../../textproc/py-expat

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

RUSTFLAGS+=	-C link-arg=${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.libxcb}/lib
RUSTFLAGS+=	-C link-arg=-L${BUILDLINK_PREFIX.libxcb}/lib

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/broot \
		${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/page \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/broot.1

.include "../../lang/rust/cargo.mk"
.include "../../lang/python/tool.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
