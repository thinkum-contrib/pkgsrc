# $NetBSD: Makefile,v 1.3 2021/08/02 15:39:35 pin Exp $

DISTNAME=	suckit-0.1.2
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=Skallwar/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://github.com/Skallwar/suckit/
COMMENT=	Suck the InTernet
LICENSE=	apache-2.0 OR mit

.include "cargo-depends.mk"

USE_TOOLS+=	pkg-config

INSTALLATION_DIRS=	bin

MAKE_ENV+=	OPENSSL_DIR=${BUILDLINK_PREFIX.openssl:Q}
RUSTFLAGS+=	-C link-arg=${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.openssl}/lib

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/suckit ${DESTDIR}${PREFIX}/bin

.include "../../lang/rust/cargo.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
