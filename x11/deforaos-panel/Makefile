# $NetBSD: Makefile,v 1.41 2021/12/08 16:02:49 adam Exp $
#

DISTNAME=	Panel-0.4.1
PKGNAME=	deforaos-panel-0.4.1
PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	https://ftp.defora.org/pub/DeforaOS/Apps/Desktop/src/Panel/

MAINTAINER=	khorben@defora.org
HOMEPAGE=	https://www.defora.org/
COMMENT=	DeforaOS desktop panel

LICENSE=	gnu-gpl-v3

USE_TOOLS+=	pkg-config
USE_TOOLS+=	xgettext

BUILD_DEPENDS+=	libxslt-[0-9]*:../../textproc/libxslt
BUILD_DEPENDS+=	docbook-xsl-[0-9]*:../../textproc/docbook-xsl

MAKE_FLAGS+=	DESTDIR=${DESTDIR}
MAKE_FLAGS+=	PREFIX=${PREFIX}
MAKE_FLAGS+=	CFLAGS=${CFLAGS:Q}
MAKE_FLAGS+=	LDFLAGS=${LDFLAGS:Q}
AUTO_MKDIRS=	yes

LDFLAGS.SunOS+=	-lsocket

.include "../../mk/bsd.prefs.mk"

.if ${PKGMANDIR} != "share/man"
post-install:
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/panel-embed.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/panel-embed.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/panel-message.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/panel-message.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/panel-notify.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/panel-notify.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/panel.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/panel.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/panelctl.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/panelctl.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/settings.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/settings.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/wifibrowser.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/wifibrowser.html
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/panel-embed.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/panel-embed.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/panel-message.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/panel-message.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/panel-notify.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/panel-notify.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/panel.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/panel.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/panelctl.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/panelctl.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/settings.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/settings.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/wifibrowser.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/wifibrowser.1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/html1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/man1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man
.endif

.include "options.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/deforaos-libdesktop/buildlink3.mk"
.include "../../x11/libxkbfile/buildlink3.mk"
.include "../../sysutils/deforaos-browser/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
