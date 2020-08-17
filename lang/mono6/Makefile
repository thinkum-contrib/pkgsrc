# $NetBSD: Makefile,v 1.9 2020/01/09 15:26:36 ryoon Exp $

DISTNAME=	mono-6.4.0.198
CATEGORIES=	lang
MASTER_SITES=	https://download.mono-project.com/sources/mono/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.mono-project.com/
COMMENT=	Open source implementation of the .NET Development Framework
LICENSE=	mit AND gnu-gpl-v2 AND gnu-lgpl-v2 AND apache-2.0

WRKSRC=		${WRKDIR}/${DISTNAME}

TOOL_DEPENDS+=	p5-XML-Parser-[0-9]*:../../textproc/p5-XML-Parser
CONFLICTS=	pnet-[0-9]* mcsim-[0-9]* lc-[0-9]*
ALL_ENV+=	MONO_SHARED_DIR=${WRKDIR} PLATFORM=
ALL_ENV+=	PAXCTL=${PAXCTL}

USE_TOOLS+=	bash:run cmake gmake gtar msgfmt perl:run pkg-config
USE_TOOLS+=	bison autoconf automake
USE_LIBTOOL=	yes
USE_LANGUAGES+=	c c99 c++
EXTRACT_USING=	gtar

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
MONO_CFG_MONO=		${PKG_SYSCONFDIR}/mono

# Requires a cwrappers change: http://mail-index.netbsd.org/tech-pkg/2019/08/16/msg021791.html
USE_CWRAPPERS=		no

MAKE_FLAGS+=		PERL=${PERL5:Q} mandir=${PREFIX}/${PKGMANDIR}
UNLIMIT_RESOURCES=	datasize stacksize memorysize

PKGCONFIG_OVERRIDE+=	mono-uninstalled.pc.in data/cecil.pc.in
PKGCONFIG_OVERRIDE+=	data/dotnet.pc.in data/dotnet35.pc.in data/mint.pc.in
PKGCONFIG_OVERRIDE+=	data/monodoc.pc.in
PKGCONFIG_OVERRIDE+=	data/mono-cairo.pc.in data/mono-lineeditor.pc.in
PKGCONFIG_OVERRIDE+=	data/mono-nunit.pc.in data/mono-options.pc.in
PKGCONFIG_OVERRIDE+=	data/mono.pc.in
PKGCONFIG_OVERRIDE+=	data/reactive.pc.in
PKGCONFIG_OVERRIDE+=	data/system.web.extensions_1.0.pc.in
PKGCONFIG_OVERRIDE+=	data/system.web.extensions.design_1.0.pc.in
PKGCONFIG_OVERRIDE+=	data/system.web.mvc.pc.in data/wcf.pc.in

REPLACE_PERL+=	mono/benchmark/test-driver
REPLACE_PERL+=	mono/cil/make-opcodes-def.pl
REPLACE_PERL+=	mono/tests/stress-runner.pl

REPLACE_PYTHON+=	scripts/mono-heapviz

REPLACE_BASH+=	mono/arch/arm/dpiops.sh
REPLACE_BASH+=	mono/arch/arm/vfpops.sh
REPLACE_BASH+=	scripts/mono-package-runtime
REPLACE_BASH+=	scripts/mono-find-provides.in scripts/mono-find-requires.in
REPLACE_BASH+=	scripts/mono-test-install
REPLACE_BASH+=	mcs/class/Mono.Cairo/Samples/gtk/compile.sh
REPLACE_BASH+=	mcs/class/Mono.Cairo/Samples/png/compile.sh
REPLACE_BASH+=	mcs/class/Mono.Cairo/Samples/win32/compile.sh
REPLACE_BASH+=	mcs/class/Mono.Cairo/Samples/x11/compile.sh
REPLACE_BASH+=	libgc/mkinstalldirs
REPLACE_BASH+=	mcs/mkinstalldirs mkinstalldirs

EGDIR=		${PREFIX}/share/examples/mono

CONF_FILES+=	${EGDIR}/2.0/Browsers/Compat.browser \
		${MONO_CFG_MONO}/2.0/Browsers/Compat.browser
CONF_FILES+=	${EGDIR}/2.0/DefaultWsdlHelpGenerator.aspx \
		${MONO_CFG_MONO}/2.0/DefaultWsdlHelpGenerator.aspx
CONF_FILES+=	${EGDIR}/2.0/machine.config \
		${MONO_CFG_MONO}/2.0/machine.config
CONF_FILES+=	${EGDIR}/2.0/settings.map \
		${MONO_CFG_MONO}/2.0/settings.map
CONF_FILES+=	${EGDIR}/2.0/web.config \
		${MONO_CFG_MONO}/2.0/web.config
CONF_FILES+=	${EGDIR}/4.0/Browsers/Compat.browser \
		${MONO_CFG_MONO}/4.0/Browsers/Compat.browser
CONF_FILES+=	${EGDIR}/4.0/DefaultWsdlHelpGenerator.aspx \
		${MONO_CFG_MONO}/4.0/DefaultWsdlHelpGenerator.aspx
CONF_FILES+=	${EGDIR}/4.0/machine.config \
		${MONO_CFG_MONO}/4.0/machine.config
CONF_FILES+=	${EGDIR}/4.0/settings.map \
		${MONO_CFG_MONO}/4.0/settings.map
CONF_FILES+=	${EGDIR}/4.0/web.config \
		${MONO_CFG_MONO}/4.0/web.config
CONF_FILES+=	${EGDIR}/4.5/Browsers/Compat.browser \
		${MONO_CFG_MONO}/4.5/Browsers/Compat.browser
CONF_FILES+=	${EGDIR}/4.5/DefaultWsdlHelpGenerator.aspx \
		${MONO_CFG_MONO}/4.5/DefaultWsdlHelpGenerator.aspx
CONF_FILES+=	${EGDIR}/4.5/machine.config \
		${MONO_CFG_MONO}/4.5/machine.config
CONF_FILES+=	${EGDIR}/4.5/settings.map \
		${MONO_CFG_MONO}/4.5/settings.map
CONF_FILES+=	${EGDIR}/4.5/web.config \
		${MONO_CFG_MONO}/4.5/web.config
CONF_FILES+=	${EGDIR}/browscap.ini \
		${MONO_CFG_MONO}/browscap.ini
CONF_FILES+=	${EGDIR}/config \
		${MONO_CFG_MONO}/config

MAKE_DIRS+=	${MONO_CFG_MONO}/2.0
MAKE_DIRS+=	${MONO_CFG_MONO}/2.0/Browsers
MAKE_DIRS+=	${MONO_CFG_MONO}/4.0
MAKE_DIRS+=	${MONO_CFG_MONO}/4.0/Browsers
MAKE_DIRS+=	${MONO_CFG_MONO}/4.5
MAKE_DIRS+=	${MONO_CFG_MONO}/4.5/Browsers
MAKE_DIRS+=	${MONO_CFG_MONO}/mconfig

TEST_TARGET=	check

SUBST_CLASSES+=			fix-prefix
SUBST_STAGE.fix-prefix=		pre-configure
SUBST_MESSAGE.fix-prefix=	Fixing relative prefix
SUBST_FILES.fix-prefix=		${PKGCONFIG_OVERRIDE}
SUBST_SED.fix-prefix=		-e 's,$${pcfiledir}/../..,\@prefix\@,g'
SUBST_NOOP_OK.fix-prefix=	yes

SUBST_CLASSES+=			fix-cfgdir
SUBST_STAGE.fix-cfgdir=		pre-configure
SUBST_MESSAGE.fix-cfgdir=	Fixing configuration files install dir
SUBST_FILES.fix-cfgdir=		mcs/tools/mconfig/Makefile
SUBST_SED.fix-cfgdir=		-e 's,$$(sysconfdir)/mono,${EGDIR},g'

SUBST_CLASSES+=			fix-python
SUBST_STAGE.fix-python=		pre-configure
SUBST_MESSAGE.fix-python=	Fixing python binary name
SUBST_FILES.fix-python+=	mono/mini/Makefile.am.in
SUBST_FILES.fix-python+=	mono/tests/Makefile.am
SUBST_SED.fix-python=		-e 's,python,${PYTHONBIN},'

## FIXME Print these paths in MESSAGE
MONO_SHARE_TEMPLATES?=		${PREFIX}/share/mono/templates
MONO_SHARE_APPLICATION?=	${PREFIX}/share/mono/application
## FIXME also for MESSAGE
## ${PREFIX}/share/mono/application/certs (when btls)
## ${PREFIX}/share/mono/application/new-certs (when btls)
## cert-sync(1)
## ${PREFIX}/share/mono/application/keypairs (TBD usage)

SUBST_CLASSES+= 		fix-share
SUBST_STAGE.fix-share=		post-patch
SUBST_MESSAGE.fix-share=	Fixing SpecialFolder paths
SUBST_FILES.fix-share+= 	external/corefx/src/System.Runtime.Extensions/src/System/Environment.Unix.cs
SUBST_FILES.fix-share+= 	mcs/class/corlib/System/Environment.cs
SUBST_SED.fix-share=		 -e 's|@SHARE_TEMPLATES@|${MONO_SHARE_TEMPLATES}|g; s|@SHARE_APP@|${MONO_SHARE_APPLICATION}|g'

SUBST_CLASSES+=			fix-paths-man
SUBST_STAGE.fix-paths-man=	post-patch
SUBST_MESSAGE.fix-paths-man=	Fixing system paths in manual pages
SUBST_FILES.fix-paths-man+= 	man/mono.1 man/mono-config.5 man/mono-configuration-crypto.1
SUBST_SED.fix-paths-man=	-e 's|@CONFDIR@|${PKG_SYSCONFDIR}|g; s|@SHARE_APP@|${MONO_SHARE_APPLICATION}|g'

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

.include "../../mk/terminfo.buildlink3.mk"
.if ( ${TERMINFO_TYPE} == "ncurses" )
PKG_TERMINFO?=	yes
.else
PKG_TERMINFO?=	no
.endif

SUBST_CLASSES+=			fix-terminfo
SUBST_STAGE.fix-terminfo=	post-patch
SUBST_MESSAGE.fix-terminfo=	Updating terminfo path
SUBST_FILES.fix-terminfo+= 	external/corefx/src/System.Console/src/System/TermInfo.cs
SUBST_FILES.fix-terminfo+=	mcs/class/corlib/System/TermInfoDriver.cs

.if !empty(PKG_TERMINFO:M[Yy][Ee][Ss])
## NB Semantics similar to ../../devel/ncurses/Makefile.common
## albeit using absolute pathnames here.
##
## This value will be added as the first element in
## a sequence, in the patched source code. Files
## including /etc/terminfo and /usr/share/terminfo
## may be checked, alternately and at a lower
## precedence, in some function calls.
. if ( ${OPSYS} == "SunOS" )
TERMINFODIR?=	${PREFIX}/share/lib/terminfo
. else
TERMINFODIR?=	${PREFIX}/share/terminfo
. endif
SUBST_SED.fix-terminfo= 	-e 's|@TERMINFO@|"${TERMINFODIR}",|g;'
.else
## Else, do not add anything to the default paths
SUBST_SED.fix-terminfo= 	-e 's|@TERMINFO@||g'
.endif


SUBST_CLASSES+=			fix-paths-man
SUBST_STAGE.fix-paths-man=	post-patch
SUBST_MESSAGE.fix-paths-man=	Fixing system paths in manual pages
SUBST_FILES.fix-paths-man+= 	man/mono.1 man/mono-config.5 man/mono-configuration-crypto.1 man/gacutil.1
SUBST_SED.fix-paths-man=	-e 's|@CONFDIR@|${PKG_SYSCONFDIR}|g; s|@SHARE_APP@|${MONO_SHARE_APPLICATION}|g'

.include "../../mk/bsd.prefs.mk"

# We patched makefiles, regen
pre-configure:
	${RUN} cd ${WRKSRC} && ${SETENV} NOCONFIGURE=1 ${CONFIGURE_ENV} ${SH} ./autogen.sh

.if ${OPSYS} == "SunOS"
CFLAGS+=		-D_XOPEN_SOURCE=600
# Conflicts with the above settings
CONFIGURE_ENV+=		ac_cv_func_madvise=no
CONFIGURE_ARGS+=	--with-mcs-docs=no
CONFIGURE_ARGS+=	--enable-dtrace=no
CONFIGURE_ARGS+=	--with-sigaltstack=no
CONFIGURE_ENV+=		ac_cv_func_getdomainname=no
CONFIGURE_ENV+=		ac_cv_func_setdomainname=no
ULIMIT_CMD_datasize=	ulimit -d 524288
ULIMIT_CMD_stacksize=	ulimit -s 10240
.elif ${OPSYS} == "NetBSD"
# Available as a libc symbol, but no declaration.
# XXX learn about getvfsstat
CONFIGURE_ENV+=		ac_cv_func_getfsstat=no
.endif

.if ${MACHINE_ARCH:M*i[34]86*}
# for gcc byte atomic builtins
GNU_ARCH.i386=		i586
CFLAGS+=		-march=i586
.endif

.if ( ${OPSYS} != SunOS) && ( ${OPSYS} != Linux )
.include "../../devel/libinotify/buildlink3.mk"
.endif

## FIXME update to build with --enable-ninja

## NB Preventing dtrace usage, on all platforms
##
## This may serve as a workaround for some build failures in sgen
## w/ Mono dtrace support on some BSD.
##
## sgen might be safe to build on NetBSD, with this option enabled in
## the build -- cf. has_dtrace in configure.ac
## 
## It works OK for a build on FreeBSD 11.2 w/ Mono 6.4, to disable
## dtrace support in the build.
##
## NB Wiki/Documentation
## - https://www.mono-project.com/docs/advanced/garbage-collector/sgen/working-with-sgen/
CONFIGURE_ARGS+=	--enable-dtrace=no

# Unsafe JIT, possibly problematic boehm-gc
NOT_PAX_MPROTECT_SAFE+=	bin/mono-sgen

post-install:
	${INSTALL_DATA} ${WRKSRC}/data/net_4_5/DefaultWsdlHelpGenerator.aspx \
		${DESTDIR}${EGDIR}/4.5/DefaultWsdlHelpGenerator.aspx
	${INSTALL_DATA} ${WRKSRC}/data/net_4_5/machine.config \
		${DESTDIR}${EGDIR}/4.5/machine.config
	${INSTALL_DATA} ${WRKSRC}/data/net_4_5/settings.map \
		${DESTDIR}${EGDIR}/4.5/settings.map
	${INSTALL_DATA} ${WRKSRC}/data/net_4_5/web.config \
		${DESTDIR}${EGDIR}/4.5/web.config
.if ${OPSYS} == "Darwin"
	for lib in mcs.exe.dylib mscorlib.dll.dylib; do \
		install_name_tool -id ${PREFIX}/lib/mono/4.5/$$lib \
		    ${DESTDIR}${PREFIX}/lib/mono/4.5/$$lib; \
	done
.endif


PLIST_VARS+=	aotso
## PLIST annotation for AOT bytecode files produced by Mono during
## install, for some files, on some platforms.
##
## FIXME/TBD - Verified so far: Under pkgsrc builds, between a Debian 10
## system and a FreeBSD 11.2 system, files annotated with this PLIST
## variable are not built -- or not built, by default -- with the Mono 6
## build on the FreeBSD system.
##
.if (${OPSYS} != FreeBSD)
PLIST.aotso=	yes
.endif

.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/tool.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
