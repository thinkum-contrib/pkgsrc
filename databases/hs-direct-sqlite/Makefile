# $NetBSD: Makefile,v 1.2 2022/02/26 03:57:45 pho Exp $

DISTNAME=	direct-sqlite-2.3.26
PKGREVISION=	1
CATEGORIES=	databases

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Low-level binding to SQLite3 including UTF8 and BLOB support
LICENSE=	modified-bsd

CONFIGURE_ARGS+=	-f systemlib

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../math/hs-semigroups/buildlink3.mk"
.include "../../mk/haskell.mk"
.include "../../mk/bsd.pkg.mk"
