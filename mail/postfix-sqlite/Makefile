# $NetBSD: Makefile,v 1.29 2021/12/08 16:05:30 adam Exp $
#

COMMENT=		Postfix SMTP server SQLite backend module
PKGREVISION=		1

POSTFIX_LIB=		sqlite
POSTFIX_LIBDIR=		src/global
POSTFIX_LIB_DICT=	yes
POSTFIX_LIB_MKMAP=	no

.include "../../mail/postfix/Makefile.module"

CCARGS+=		-I${BUILDLINK_PREFIX.sqlite3}/include
AUXLIBS_MODULE=		-L${BUILDLINK_PREFIX.sqlite3}/lib -lsqlite3		\
			${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.sqlite3}/lib

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
