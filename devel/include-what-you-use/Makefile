# $NetBSD: Makefile,v 1.28 2021/12/08 16:03:58 adam Exp $

DISTNAME=	include-what-you-use-0.17
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=include-what-you-use/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://include-what-you-use.org/
COMMENT=	Analyze \#includes in C and C++ source files
LICENSE=	modified-bsd

USE_CMAKE=	yes
USE_LANGUAGES=	c c++14

GCC_REQD+=	5

CMAKE_ARGS=	-DIWYU_LLVM_ROOT_PATH:PATH=${BUILDLINK_PREFIX.clang}

REPLACE_PYTHON=	*.py

.include "../../lang/clang/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
