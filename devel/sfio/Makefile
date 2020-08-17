# $NetBSD: Makefile,v 1.26 2017/09/04 18:00:54 wiz Exp $
#

# pkgsrc/mail/sendmail (as of 8.11.0) specifically wants 1999, not 2000.
# if you upgrade it, please check if sendmail works right.
#
# the original distribution requires us to put name onto web form, however,
# the license term permits redistribution.  a copy of the distribution kit
# is put into ${MASTER_SITE_LOCAL}.
#
DISTNAME=	sfio_1999.src.unix
PKGNAME=	sfio-1999
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_LOCAL}
EXTRACT_SUFX=	.cpio ## ech.
EXTRACT_DIR=	${WRKDIR}/${PKGNAME_NOREV}
WRKSRC=		${EXTRACT_DIR}

MAINTAINER=	pkgsrc-users@NetBSD.org
#HOMEPAGE=	http://akpublic.research.att.com/sw/tools/sfio/
#HOMEPAGE?=	https://github.com/att/ast/tree/master/src/lib/libast/sfio

COMMENT=	Safe and Fast IO library

MAKE_JOBS_SAFE=	no
MAKE_FLAGS+=	MKPROFILE=yes

AUTO_MKDIRS=			yes

.include "../../mk/compiler.mk"
.if !empty(PKGSRC_COMPILER:Mclang)
CFLAGS+=	-Wno-error=parentheses
.endif

.if ( "${OPSYS}" == "FreeBSD")
SUBST_CLASSES+= 	sfio
SUBST_FILES.sfio=	src/lib/sfio/sfclrlock.c src/lib/sfio/sfio.h
SUBST_FILES.sfio+=	src/lib/sfio/sfio_t.h src/lib/sfio/sfnew.c
SUBST_FILES.sfio+=	src/lib/sfio/sfopen.c src/lib/sfio/sfset.c
SUBST_STAGE.sfio=	post-patch
SUBST_SED.sfio=		-e 's,SF_FLAGS,SFIO_FLAGS,g'
SUBST_MESSAGE.sfio=	FreeBSD - update sfio to use SFIO_FLAGS
.endif

post-patch:
	${MV} ${WRKSRC}/man/man3/sfio.3 ${WRKSRC}/man/man3/sfio.3.in
	${SED} -e 's|@prefix@|${PREFIX}|g' ${WRKSRC}/man/man3/sfio.3.in \
			> ${WRKSRC}/man/man3/sfio.3

.include "../../mk/bsd.pkg.mk"
