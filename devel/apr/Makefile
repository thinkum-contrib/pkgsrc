# $NetBSD: Makefile,v 1.81 2020/01/18 23:30:22 rillig Exp $
#
# Take care, changelogs often include "PR 12345" strings
# which cause GNATS indigestion.

DISTNAME=	apr-1.7.0
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_APACHE:=apr/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://apr.apache.org/
COMMENT=	Apache Portable Runtime
LICENSE=	apache-2.0

USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config
PKGCONFIG_OVERRIDE+=	apr.pc.in
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-devrandom=/dev/urandom
CONFIGURE_ARGS+=	--with-installbuilddir=${PREFIX}/libexec/apr
CONFIGURE_ENV+=		LIBS=${LIBS:M*:Q}
LIBS.SunOS+=		-lnsl

TEST_TARGET=		check

SUBST_CLASSES+= 	jlibtool
SUBST_STAGE.jlibtool=	post-configure
SUBST_FILES.jlibtool=	build/jlibtool.c
SUBST_SED.jlibtool=	-e 's,@AR@,${AR},;s,@RANLIB@,${RANLIB},'
SUBST_MESSAGE.jlibtool= Set tool paths in jlibtool

post-install:
	${RM} ${DESTDIR}${PREFIX}/libexec/apr/libtool
	${INSTALL_SCRIPT} ${PKG_LIBTOOL} ${DESTDIR}${PREFIX}/libexec/apr/libtool

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "Linux" || ${OPSYS} == "SunOS"
.include "../../devel/libuuid/buildlink3.mk"
.endif

.include "options.mk"

PTHREADS_OPTS?= 	optional
.for V in CFLAGS CPPFLAGS LDFLAGS LIBS
PTHREAD_AUTO_VARS+=	${V}
.endfor

.include "../../mk/pthread.buildlink3.mk"

.if empty(PTHREAD_TYPE:Mnone)
CONFIGURE_ARGS+=	--enable-threads
. for V in CFLAGS CPPFLAGS LDFLAGS # LIBS
${V}+=			${PTHREAD_${V}}
CONFIGURE_ENV+= 	${V}=${${V}:Q}
. endfor
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

post-install:
	${RM} ${DESTDIR}${PREFIX}/libexec/apr/libtool
	${INSTALL_SCRIPT} ${PKG_LIBTOOL} ${DESTDIR}${PREFIX}/libexec/apr/libtool

.include "../../mk/bsd.pkg.mk"
