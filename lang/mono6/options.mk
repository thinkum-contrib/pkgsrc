# $Thinkum$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mono
PKG_SUPPORTED_OPTIONS=	ssl
PKG_SUGGESTED_OPTIONS=	ssl

PKG_OPTIONS_GROUP.csc=	csc-mcs csc-roslyn
PKG_SUPPORTED_OPTIONS+= ${PKG_OPTIONS_GROUP.csc}
PLIST_VARS+=		csc-mcs csc-roslyn

.include "../../mk/endian.mk"
.if  (${MACHINE_ENDIAN} == "big") || (${OPSYS} == "PowerPC")
## NB emulating csc_compiler=defualt in Mono configure.ac
## - mcs: Default when "big endian" machine | powerpc
## - roslyn: Default for other
PKG_SUGGESTED_OPTIONS+= csc-mcs
.else
PKG_SUGGESTED_OPTIONS+= csc-roslyn
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mcsc-mcs)
CONFIGURE_ARGS+=	--with-csc=mcs
.elif !empty(PKG_OPTIONS:Mcsc-roslyn)
## TODO - Needs Testing
CONFIGURE_ARGS+=	--with-csc=roslyn
.endif

PLIST_VARS+=		btls

## build and link with Mono's bundled boringssl
.if !empty(PKG_OPTIONS:Mssl)

CONFIGURE_ARGS+=	--enable-btls
CONFIGURE_ARGS+=	--enable-btls-lib
PLIST.btls=		yes
.else
CONFIGURE_ARGS+=	--disable-btls
CONFIGURE_ARGS+=	--disable-btls-lib
.endif
