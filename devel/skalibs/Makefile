# $NetBSD: Makefile,v 1.7 2020/07/07 10:31:03 schmonz Exp $

DISTNAME=		skalibs-2.9.2.1
CATEGORIES=		devel
MASTER_SITES=		${HOMEPAGE}

MAINTAINER=		cfkoch@edgebsd.org
HOMEPAGE=		https://skarnet.org/software/skalibs/
COMMENT=		The skarnet.org C system programming library
LICENSE=		isc

USE_LANGUAGES=		c
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake
USE_LIBTOOL=		yes

CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}

INSTALLATION_DIRS=	include/skalibs lib/skalibs/sysdeps

post-install:
	${LN} -s ../libskarnet.a ${DESTDIR}${PREFIX}/lib/skalibs/libskarnet.a

.include "../../mk/bsd.pkg.mk"
