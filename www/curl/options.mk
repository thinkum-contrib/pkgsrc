# $NetBSD: options.mk,v 1.18 2019/09/18 07:21:08 adam Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.curl
PKG_SUPPORTED_OPTIONS=		inet6 libssh2 gssapi ldap rtmp idn http2
PKG_SUGGESTED_OPTIONS=		inet6 idn
PKG_OPTIONS_LEGACY_OPTS=	libidn:idn

# Kerberos is built in - no additional dependency
PKG_SUGGESTED_OPTIONS.NetBSD+=	gssapi

.if exists(${LOCALBASE}/lib/pkgconfig/libnghttp2.pc) || \
	empty(PKG_OPTIONS.nghttp2:Mnghttp2-tools)
##
## Try to prevent a circular dependency during initial curl builds, e.g
## [curl-7.66.0nb1 cmake-3.15.3 libcares-1.15.0nb1 nghttp2-1.39.2nb2 curl-7.66.0nb1] 
## listed from latest to earliest, in that dependency loop.
## 
## This loop may occur when PKG_OPTIONS.nghttp2 += nghttp2-tools such that 
## may introduce the libcares dependency during the nghttp2 build,
## furthermore when PKG_OPTIONS.curl += http2
##
PKG_SUGGESTED_OPTIONS+=		http2 
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !empty(PKG_OPTIONS:Mlibssh2)
CONFIGURE_ARGS+=	--with-libssh2=${BUILDLINK_PREFIX.libssh2}
.  include "../../security/libssh2/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-libssh2
.endif

.if !empty(PKG_OPTIONS:Mgssapi)
.include "../../mk/krb5.buildlink3.mk"
CONFIGURE_ARGS+=	--with-gssapi=${KRB5BASE}
CONFIGURE_ARGS+=	--with-gssapi-includes=${KRB5BASE}/include/gssapi
.else
CONFIGURE_ARGS+=	--without-gssapi
.endif

.if !empty(PKG_OPTIONS:Mldap)
.include "../../databases/openldap-client/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-ldap
CONFIGURE_ARGS+=	--enable-ldaps
.else
CONFIGURE_ARGS+=	--disable-ldap
.endif

.if !empty(PKG_OPTIONS:Mrtmp)
.include "../../net/rtmpdump/buildlink3.mk"
CONFIGURE_ARGS+=	--with-librtmp
.else
CONFIGURE_ARGS+=	--without-librtmp
.endif

.if !empty(PKG_OPTIONS:Midn)
.include "../../devel/libidn2/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libidn2
.else
CONFIGURE_ARGS+=	--without-libidn2
.endif

.if !empty(PKG_OPTIONS:Mhttp2)
USE_TOOLS+=		pkg-config
CONFIGURE_ARGS+=	--with-nghttp2=${BUILDLINK_PREFIX.nghttp2}
.include "../../www/nghttp2/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-nghttp2
.endif
