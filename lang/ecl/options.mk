# $NetBSD: options.mk,v 1.12 2019/11/03 19:03:57 rillig Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.ecl
PKG_SUPPORTED_OPTIONS+=		debug threads unicode ffi
PKG_SUGGESTED_OPTIONS+=		unicode ffi
# Unicode support proved to break Axioms.
# Threads are off, since threaded ECL requires threads support
# in Boehm GC (off by default).

.include "../../mk/bsd.options.mk"

PLIST_SRC=	PLIST	# default value

.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if !empty(PKG_OPTIONS:Mthreads)
CONFIGURE_ARGS+=	--enable-threads
CONFIGURE_ENV+=		THREAD_CFLAGS=${PTHREAD_CFLAGS:Q}
CONFIGURE_ENV+=		THREAD_LDFLAGS=${BUILDLINK_LDFLAGS.pthread:Q}
CONFIGURE_ENV+=		THREAD_LIBS=${BUILDLINK_LIBS.pthread:Q}
# XXX Although NetBSD-6+ supports TLS, ECL oddly crashes on startup
# on NetBSD-6 when it's used here.  Untested yet with NetBSD-7.
.  if ${OPSYS} == "FreeBSD" || ${OPSYS} == "Linux" || ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--with-__thread=yes
.  else
CONFIGURE_ARGS+=	--with-__thread=no
.  endif
.include "../../mk/pthread.buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if !empty(PKG_OPTIONS:Municode)
CONFIGURE_ARGS+=	--enable-unicode
.else
CONFIGURE_ARGS+=	--disable-unicode
.endif

.if !empty(PKG_OPTIONS:Mffi)
.include "../../devel/libffi/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--with-dffi=no
.endif

PLIST_VARS+=		unicode

.if !empty(PKG_OPTIONS:Municode)
PLIST.unicode=	yes
.endif

# Help generating PLIST:
.if !empty(PKG_OPTIONS:Municode)
PRINT_PLIST_AWK+=	{if ($$0 ~ /lib\/.*\/encodings\//) {$$0 = "$${PLIST.unicode}" $$0;}}
.endif

PLIST_VARS+=		doc_html doc_pdf

## Common features of documentation builds
.if !empty(PKG_OPTIONS:Mdoc) || \
	!empty(PKG_OPTIONS:Mdoc-html) || !empty(PKG_OPTIONS:Mdoc-pdf)
.include "../../textproc/libxslt/buildlink3.mk"
BUILDLINK_DEPMETHOD.libxslt=build
.endif

## HTML documentation build
.if !empty(PKG_OPTIONS:Mdoc) || !empty(PKG_OPTIONS:Mdoc-html)
PLIST.doc_html=		yes
BUILD_DEPENDS+=		xmlto-[0-9]*:../../textproc/xmlto
#
DOC_BUILD_TARGETS+=	do-doc-html-build
do-doc-html-build: .PHONY
	${MAKE_ENV} ${GMAKE} -C ${WRKSRC}/doc html/index.html html/ecl.css
DOC_INSTALL_TARGETS+=	do-doc-html-install
do-doc-html-install: do-doc-html-build .PHONY
	${INSTALL} -d -o ${DOCOWN} -g ${DOCGRP} -m ${PKGDIRMODE} \
		${DESTDIR}${PREFIX}/share/doc/ecl/html
	${INSTALL} ${COPY} -o ${DOCOWN} -g ${DOCGRP} -m ${PKGDIRMODE} \
		${WRKSRC}/doc/html/*.html ${WRKSRC}/doc/html/*.css \
		${DESTDIR}${PREFIX}/share/doc/ecl/html
.endif

## PDF documentation build
.if !empty(PKG_OPTIONS:Mdoc) || !empty(PKG_OPTIONS:Mdoc-pdf)
PLIST.doc_pdf=		yes
BUILD_DEPENDS+=		dblatex-[0-9]*:../../textproc/dblatex
#
DOC_BUILD_TARGETS+=	do-doc-pdf-build
do-doc-pdf-build: .PHONY
	${MAKE_ENV} ${GMAKE} -C ${WRKSRC}/doc ecl.pdf
DOC_INSTALL_TARGETS+=	do-doc-pdf-install
do-doc-pdf-install: do-doc-pdf-build .PHONY
	${INSTALL} -d -o ${DOCOWN} -g ${DOCGRP} -m ${PKGDIRMODE} \
		${DESTDIR}${PREFIX}/share/doc/ecl
	${INSTALL} ${COPY} -o ${DOCOWN} -g ${DOCGRP} -m ${DOCMODE} \
		${WRKSRC}/doc/ecl.pdf ${DESTDIR}${PREFIX}/share/doc/ecl
.endif

## GC options (needs testing w/ newer ECL src - wip)
# .if !empty(PKG_OPTIONS:Mgengc) || !empty(PKG_OPTIONS:Mprecisegc)
# CONFIGURE_ARGS+=	--enable-gengc
# .endif
#
# .if !empty(PKG_OPTIONS:Mprecisegc)
# CONFIGURE_ARGS+=	--enable-precisegc
# .endif

## Extended Debug options (TBD)
# .if !empty(PKG_OPTIONS:Mdebug)
# CONFIGURE_ARGS+=	--enable-debug
# CONFIGURE_ARGS+=	--with-debug-cflags
# .else
## NB not a default configure setting
# CONFIGURE_ARGS+=	--without-debug-cflags
# .endif

