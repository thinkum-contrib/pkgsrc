# $NetBSD: Makefile,v 1.14 2021/12/06 21:42:26 pin Exp $

DISTNAME=	please-0.5.1
PKGNAME=	pleaser-0.5.1
CATEGORIES=	security
MASTER_SITES=	https://gitlab.com/edneville/please/-/archive/v${PKGVERSION_NOREV}/

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://gitlab.com/edneville/please/
COMMENT=	Sudo like program with regex support
LICENSE=	gnu-gpl-v3

.include "cargo-depends.mk"

WRKSRC=			${WRKDIR}/please-v0.5.1-ce9627c714e46d9ea1d157ee43c78a7523f45d80

SUBST_CLASSES+=		prefix
SUBST_MESSAGE.prefix=	Fixing paths.
SUBST_STAGE.prefix=	pre-configure
SUBST_FILES.prefix+=	man/please.1
SUBST_FILES.prefix+=	man/please.ini.5
SUBST_FILES.prefix+=	src/bin/please.rs
SUBST_FILES.prefix+=	src/bin/pleaseedit.rs
SUBST_FILES.prefix+=	src/lib.rs
SUBST_SED.prefix+=	-e 's,/etc/please.ini,${PREFIX}/etc/please.ini,g'
SUBST_SED.prefix+=	-e 's,/usr/local,${PREFIX},g'
SUBST_SED.prefix+=	-e 's,/usr/bin/please,${PREFIX}/bin/please,g'

SPECIAL_PERMS+=		bin/please ${SETUID_ROOT_PERMS}
SPECIAL_PERMS+=		bin/pleaseedit ${SETUID_ROOT_PERMS}

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${PKGMANDIR}/man5

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/please ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/pleaseedit ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/please.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/please.1
	${INSTALL_MAN} ${WRKSRC}/man/please.ini.5 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man5/please.ini.5

.include "../../lang/rust/cargo.mk"
.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
