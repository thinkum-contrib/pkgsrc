# $NetBSD: options.mk,v 1.1 2019/07/11 10:24:14 nia Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.rust
PKG_SUPPORTED_OPTIONS+=		rust-llvm

.include "../../mk/bsd.fast.prefs.mk"

# The bundled LLVM current has issues building on SunOS.
.if ${OPSYS} != "SunOS" && ${OPSYS} != "Darwin"
PKG_SUGGESTED_OPTIONS+=		rust-llvm
.endif

.include "../../mk/bsd.options.mk"

#
# Use the internal copy of LLVM.
# This contains some extra optimizations.
#
.if !empty(PKG_OPTIONS:Mrust-llvm)
# LLVM uses -std=c++11
GCC_REQD+=	4.8
BUILD_DEPENDS+=	cmake-[0-9]*:../../devel/cmake
.include "../../devel/cmake/buildlink3.mk"
.else
.include "../../lang/llvm/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-llvm-link-shared
CONFIGURE_ARGS+=	--llvm-root=${BUILDLINK_PREFIX.llvm}
.endif
