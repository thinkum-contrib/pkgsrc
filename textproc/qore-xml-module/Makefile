# $NetBSD: Makefile,v 1.14 2022/01/27 19:18:12 nros Exp $

DISTNAME=	qore-xml-module-1.5.1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=qorelanguage/}
EXTRACT_SUFX=	.tar.bz2
GITHUB_PROJECT=	module-xml
GITHUB_RELEASE=	v${PKGVERSION_NOREV}


MAINTAINER=	nros@NetBSD.org
COMMENT=	XML module for Qore
HOMEPAGE=	http://www.qore.org/
LICENSE=	gnu-lgpl-v2.1 OR mit

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_LANGUAGES=	c c++11
USE_TOOLS+=	gmake pax
PTHREAD_OPTS+=	native

CONFIGURE_ARGS+=	--with-libsuffix=""

REPLACE_QORE=	bin/soaputil bin/webdav-server

#This is needed in order to comply the with MIT license and binary distribution
#Install docs
INSTALLATION_DIRS+=     share/doc/${PKGBASE}
post-install:
	${INSTALL_DATA} ${WRKSRC}/COPYING.LGPL \
		${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
	${INSTALL_DATA} ${WRKSRC}/COPYING.MIT \
		${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
	cd ${WRKSRC}/docs && ${PAX} -wr * \
		${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} \
		${DESTDIR}${PREFIX}/share/doc/${PKGBASE}


.include "../../lang/qore/application.mk"
.include "../../lang/qore/module.mk"
.include "options.mk"

.include "../../mk/pthread.buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../lang/qore/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
