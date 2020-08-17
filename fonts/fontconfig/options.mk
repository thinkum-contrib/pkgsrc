# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.fontconfig
PKG_SUPPORTED_OPTIONS=		nls
PKG_SUGGESTED_OPTIONS=		# blank
PKG_SUGGESTED_OPTIONS.NetBSD+=	nls

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mnls)
USE_PKGLOCALEDIR=	yes
PLIST_SRC+=		${PKGDIR}/PLIST.locale
.  include "../../devel/gettext-lib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-nls
.endif
