# $NetBSD: Makefile,v 1.52 2021/12/08 16:02:58 adam Exp $

DISTNAME=	qtbase-everywhere-src-${QTVERSION}
PKGNAME=	qt5-mysql-${QTVERSION}
PKGREVISION=	4
COMMENT=	Qt5 MySQL plugin

CFLAGS+=		-I${BUILDLINK_PREFIX.mysql-client}/include/mysql

BUILD_DIRS=		src/plugins/sqldrivers
MAKE_ENV+=		QTDIR=${QTDIR}
INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}

.include "../../x11/qt5-qtbase/Makefile.common"

do-configure:
	${RM} -f -r ${WRKSRC}/mkspecs
	cd ${WRKSRC}/${BUILD_DIRS} && \
	${QTDIR}/bin/qmake -o Makefile "QT.sql.enabled_features+=sql-mysql" "QMAKE_LIBS_MYSQL=-lmysqlclient"

post-install:
	${RM} -f ${DESTDIR}${PREFIX}/qt5/lib/cmake/Qt5Sql/Qt5Sql_QSQLiteDriverPlugin.cmake
	${RM} -f ${DESTDIR}${PREFIX}/qt5/plugins/sqldrivers/libqsqlite.*

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/mysql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
