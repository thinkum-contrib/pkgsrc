# $NetBSD: Makefile,v 1.11 2022/01/04 20:55:25 wiz Exp $

DISTNAME=	Flask-Babel-1.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
PKGREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=F/Flask-Babel/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/mitsuhiko/flask-babel
COMMENT=	Adds i18n/l10n support to Flask applications
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-babel>=2.3:../../devel/py-babel
DEPENDS+=	${PYPKGPREFIX}-flask-[0-9]*:../../www/py-flask
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.5:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-pytz-[0-9]*:../../time/py-pytz

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
