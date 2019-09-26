# $Thinkum$

PKG_OPTIONS_VAR=		PKG_OPTIONS.apr
PKG_SUPPORTED_OPTIONS=		inet6 jlibtool
PKG_SUGGESTED_OPTIONS=		inet6

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !empty(PKG_OPTIONS:Mjlibtool)

SUBST_CLASSES+= 	jlibtool
## Assumption: This will be run after patches are applied
SUBST_STAGE.jlibtool=	pre-configure
SUBST_FILES.jlibtool=	build/jlibtool.c
SUBST_SED.jlibtool=	-e 's,@SH@,${SHELL},;s,@AR@,${AR},;s,@RANLIB@,${RANLIB},'
SUBST_MESSAGE.jlibtool= Set tool paths in jlibtool

## NB: The apr configure script, itself, will build jlibtool
## during configure, if configured with --enable-experimental-libtool
##
## This option will prevent the built jlibtool from being overwritten
## with a shell script
LIBTOOL_OVERRIDE= 	# Defined
pre-build: 
	${CC} ${CFLAGS} -o ${WRKSRC}/libtool ${WRKSRC}/build/jlibtool.c 

.else
post-install:
	${RM} ${DESTDIR}${PREFIX}/libexec/apr/libtool
	${INSTALL_SCRIPT} ${PKG_LIBTOOL} ${DESTDIR}${PREFIX}/libexec/apr/libtool
.endif
