# $NetBSD: Makefile,v 1.53 2022/03/17 00:15:21 taca Exp $

DISTNAME=	bind-${BIND_VERSION}
PKGNAME=	${DISTNAME:S/-P/pl/}
CATEGORIES=	net
MASTER_SITES=	https://downloads.isc.org/isc/bind9/${BIND_VERSION}/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.isc.org/software/bind/
COMMENT=	Berkeley Internet Name Daemon implementation of DNS, version 9.11
LICENSE=	mpl-2.0

CONFLICTS+=	host-[0-9]*

MAKE_JOBS_SAFE=	no

BIND_VERSION=	9.11.37

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	BIND_DIR VARBASE

.include "options.mk"

USE_TOOLS+=		pax perl pkg-config tar
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
MAKE_ENV+=		WRKDIR=${WRKDIR} PREFIX=${PREFIX}

CONFIGURE_ARGS+=		--with-libtool
CONFIGURE_ARGS+=		--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=		--localstatedir=${VARBASE}
CONFIGURE_ARGS+=		--with-openssl=${SSLBASE:Q}
CONFIGURE_ARGS+=		--with-python=no
CONFIGURE_ARGS+=		--with-lmdb=no
.if !empty(MACHINE_PLATFORM:MNetBSD-*-m68k) || \
    !empty(MACHINE_PLATFORM:MNetBSD-*-mipsel) || \
    !empty(MACHINE_PLATFORM:MNetBSD-*-vax) || \
    !empty(MACHINE_PLATFORM:MNetBSD-*-i386)
CONFIGURE_ARGS+=		--disable-atomic
.endif
.if ${MACHINE_PLATFORM:MNetBSD-*-powerpc} != ""
CONFIGURE_ARGS+=		--disable-threads
.endif
CONFIGURE_ARGS.DragonFly+=	--disable-kqueue
CONFIGURE_ARGS+=		--without-gssapi

PKG_GROUPS_VARS+=	BIND_GROUP
PKG_USERS_VARS=		BIND_USER

PKG_GROUPS=		${BIND_GROUP}
PKG_USERS=		${BIND_USER}:${BIND_GROUP}

PKG_GECOS.${BIND_USER}=	Named pseudo-user
PKG_HOME.${BIND_USER}=	${BIND_DIR}

DOCS=			CHANGES HISTORY OPTIONS README

FILES_SUBST+=		BIND_GROUP=${BIND_GROUP} \
			BIND_USER=${BIND_USER} PAX=${PAX:Q} \
			SSLBASE=${SSLBASE}
MESSAGE_SUBST+=		BIND_DIR=${BIND_DIR} BIND_USER=${BIND_USER}

DOCDIR=			share/doc/bind9

RCD_SCRIPTS=		lwresd named9
SMF_METHODS=		named

INSTALL_MAKE_FLAGS+=	sysconfdir=${PREFIX}/share/examples/bind9
CONF_FILES+=		share/examples/bind9/bind.keys \
			${PKG_SYSCONFDIR}/bind.keys

INSTALLATION_DIRS+=	${DOCDIR} ${DOCDIR}/arm

post-install:
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/${DOCDIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/doc/arm/*.html ${DESTDIR}${PREFIX}/${DOCDIR}/arm

.include "../../mk/atomic64.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
