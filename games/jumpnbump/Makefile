# $NetBSD: Makefile,v 1.5 2021/12/08 16:04:32 adam Exp $

DISTNAME=	jumpnbump-1.61
PKGREVISION=	4
CATEGORIES=	games
MASTER_SITES=	https://gitlab.com/LibreGames/jumpnbump/uploads/95acdae2a232513f068e260977371dcf/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://libregames.gitlab.io/jumpnbump/
COMMENT=	Multiplayer platform game with bunnies
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	gmake

CHECK_PORTABILITY_SKIP+=	build-mingw.sh

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../audio/SDL2_mixer/buildlink3.mk"
.include "../../devel/SDL2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../net/SDL2_net/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
