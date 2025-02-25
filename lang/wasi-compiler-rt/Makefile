# $NetBSD: Makefile,v 1.11 2022/02/04 12:12:12 wiz Exp $

.include "../../lang/llvm/version.mk"

DISTNAME=	compiler-rt-${LLVM_VERSION}.src
PKGNAME=	${DISTNAME:S/.src//:S/compiler-rt-/wasi-compiler-rt-/}
PKGREVISION=	2
CATEGORIES=	lang devel

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://compiler-rt.llvm.org/
COMMENT=	LLVM runtime libraries for WASI/WebAssembly
LICENSE=	apache-2.0

PATCHDIR=	${.CURDIR}/../../lang/compiler-rt/patches
DISTINFO_FILE=	${.CURDIR}/../../lang/compiler-rt/distinfo

NOT_FOR_PLATFORM=	NetBSD-[0-7].*-*

USE_CMAKE=	yes
USE_LANGUAGES=	c99 c++11
USE_TOOLS+=	ggrep

SSP_SUPPORTED=		no
PKGSRC_USE_STACK_CHECK=	no

CONFIGURE_DIRS=	../build
CMAKE_ARG_PATH=	${WRKSRC}/lib/builtins

BUILDLINK_TRANSFORM+=	rm:-I/usr/include
BUILDLINK_TRANSFORM+=	rm:-I${PREFIX}/include

CMAKE_ARGS+=	-DCMAKE_VERBOSE_MAKEFILE=1

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX:Q}
CMAKE_ARGS+=	-DCOMPILER_RT_TEST_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCOMPILER_RT_OS_DIR:STRING=wasi
CMAKE_ARGS+=	-DLLVM_CONFIG_PATH=${LLVM_CONFIG_PATH:Q}
CMAKE_ARGS+=	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=wasm32-wasi
CMAKE_ARGS+=	-DCOMPILER_RT_BAREMETAL_BUILD=TRUE
CMAKE_ARGS+=	-DCMAKE_SYSROOT=${BUILDLINK_DIR}/wasi
CMAKE_ARGS+=	-DCOMPILER_RT_BAREMETAL_BUILD=TRUE
CMAKE_ARGS+=	-DCOMPILER_RT_EXCLUDE_ATOMIC_BUILTIN=TRUE
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_FPIC_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_FPIE_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_FNO_BUILTIN_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_STD_C11_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_VISIBILITY_HIDDEN_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_FREESTANDING_FLAG:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_XRAY_COMPILER_FLAG:BOOL=OFF
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_ATOMIC_KEYWORD:BOOL=ON
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_FLOAT16:BOOL=OFF
CMAKE_ARGS+=	-DCOMPILER_RT_HAS_ASM_LSE:BOOL=OFF
CMAKE_ARGS+=	-DCMAKE_C_COMPILER_WORKS=1 # Do not test clang compile
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER_WORKS=1 # Do not test clang++ compile

CMAKE_INSTALL_PREFIX=	${PREFIX}/lib/clang/${PKGVERSION_NOREV}

post-extract:
	${MKDIR} ${WRKDIR}/build

# Run llvm-ranlib again on the archive. Fixes mystery build failure
# in Firefox due to missing index (see PR pkg/56590). Might be a MAKE_JOBS
# problem in this package?
post-install:
	${PREFIX}/bin/llvm-ranlib \
	  ${DESTDIR}${PREFIX}/lib/clang/${PKGVERSION_NOREV}/lib/wasi/libclang_rt.builtins-wasm32.a

.include "../../mk/bsd.prefs.mk"

ABI=			# 32
CFLAGS=			-O2
CXXFLAGS=		-O2
PKGSRC_COMPILER=	clang
CLANGBASE=		${PREFIX}
BUILDLINK_DEPMETHOD.clang=	build
.include "../../lang/clang/buildlink3.mk"
.include "../../lang/llvm/buildlink3.mk"
.include "../../lang/wasi-libc/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
