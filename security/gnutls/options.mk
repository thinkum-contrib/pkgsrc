# $NetBSD: options.mk,v 1.3 2020/05/14 14:30:02 nikita Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.gnutls
PKG_SUPPORTED_OPTIONS=	dane nls
PKG_SUGGESTED_OPTIONS=		# blank
PKG_SUGGESTED_OPTIONS.NetBSD+=	nls

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdane)
.include "../../net/unbound/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-libdane
PLIST_SRC+=		PLIST.dane
.else
CONFIGURE_ARGS+=	--disable-libdane
.endif

.if !empty(PKG_OPTIONS:Mnls)
USE_PKGLOCALEDIR=	yes
PLIST_SRC+=		${PKGDIR}/PLIST.locale
.  include "../../devel/gettext-lib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-nls
.endif
