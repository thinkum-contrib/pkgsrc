# $NetBSD: Makefile,v 1.63 2020/06/02 19:12:55 adam Exp $

DISTNAME=	nghttp2-1.39.2
PKGREVISION=	2
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=tatsuhiro-t/}
EXTRACT_SUFX=	.tar.xz
GITHUB_RELEASE=	v${PKGVERSION_NOREV}

COMMENT=	Implementation of HTTP/2 in C

# Upstream documents that c++14 is required for C++ parts of the code;
# the base package does not use C++.
USE_LANGUAGES=		c
# Upstream documents that gcc>=6 or clang >= 6 is required, but this
# appears not to be true for the C parts.
# https://github.com/nghttp2/nghttp2/issues/1293

USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-lib-only
PKGCONFIG_OVERRIDE+=	lib/libnghttp2.pc.in
PKGCONFIG_OVERRIDE+=	src/libnghttp2_asio.pc.in

REPLACE_PYTHON+=	script/fetch-ocsp-response

.include "options.mk"

.include "../../lang/python/application.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
