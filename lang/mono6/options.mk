# $Thinkum$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mono
PKG_SUPPORTED_OPTIONS=	ssl
PKG_SUGGESTED_OPTIONS=	ssl

PKG_OPTIONS_OPTIONAL_GROUPS+=	csc

PKG_OPTIONS_GROUP.csc=		csc-mcs csc-roslyn

##
## Default Mono csc
##

## FIXME - Add MESSAGE_SRC about the default csc option in the build
# MESSAGE_SRC+=		MESSAGE.opt.csc

.if empty(PKG_OPTIONS.mono:Mcsc-*)
.include "../../mk/endian.mk"
. if (${MACHINE_ENDIAN} == "big") || (${OPSYS} == "PowerPC")
## Overview (unofficial)
##
## mcs
## - the Mono Turbo C# Compiler
## - default for big-endian machine architectures & powerpc
##   per Mono configure.ac, csc_compiler=default
##
## roslyn
## - essentially the .NET csc
## - default for other platforms
## - may not be supported on MACHINE_ENDIAN=="big"
##
PKG_SUGGESTED_OPTIONS+=	csc-mcs
. else
PKG_SUGGESTED_OPTIONS+=	csc-roslyn
. endif
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS.mono:Mcsc-mcs) && !empty(PKG_OPTIONS.mono:Mcsc-roslyn)
PKG_FAIL_REASON+=	"PKG_OPTIONS.mono: csc-mcs and csc-roslyn are mutually exclusive options"
.endif

.if !empty(PKG_OPTIONS:Mcsc-mcs)
## FIXME LLVM support probably entails csc-mcs
CONFIGURE_ARGS+=	--with-csc=mcs
PLIST_SUBST+=		DBG_EXE=exe.mdb
PLIST_SUBST+=		DBG_DLL=dll.mdb
#MESSAGE_SUBST+=		CSC="mcs, the Mono Turbo Csharp Compiler"
.elif !empty(PKG_OPTIONS:Mcsc-roslyn)
CONFIGURE_ARGS+=	--with-csc=roslyn
PLIST_SUBST+=		DBG_EXE=pdb
PLIST_SUBST+=		DBG_DLL=pdb
#MESSAGE_SUBST+=		CSC="Roslyn, the Microsoft Visual Csharp Compiler"
.endif

##
## boringssl
##

PLIST_VARS+=		btls

.if !empty(PKG_OPTIONS:Mssl)
## Build with Mono's bundled boringssl - needed for HTTPS support
#
## FIXME - Add MESSAGE_SUBST, MESSAGE_SRC for boringssl w/ Mono.
##
## In at least, the message text may introduce Mono's cert-sync(1) tool,
## as with regards to applciations for local trust for SSL certificates.
CONFIGURE_ARGS+=	--enable-btls
CONFIGURE_ARGS+=	--enable-btls-lib
PLIST.btls=		yes
.else
CONFIGURE_ARGS+=	--disable-btls
CONFIGURE_ARGS+=	--disable-btls-lib
.endif
