# $NetBSD: Makefile,v 1.21 2022/02/13 08:53:44 wiz Exp $

DISTNAME=	jsonschema-3.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_PYPI:=j/jsonschema/}

MAINTAINER=	bsiegert@NetBSD.org
HOMEPAGE=	https://github.com/Julian/jsonschema
COMMENT=	Implementation of JSON Schema for Python
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-attrs>=17.4.0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-pyrsistent>=0.14.0:../../devel/py-pyrsistent
DEPENDS+=	${PYPKGPREFIX}-six>=1.11.0:../../lang/py-six

.include "../../lang/python/pyversion.mk"
.if ${_PYTHON_VERSION} == 27
DEPENDS+=	${PYPKGPREFIX}-functools32-[0-9]*:../../devel/py-functools32
.elif ${_PYTHON_VERSION} < 38
PYTHON_VERSIONED_DEPENDENCIES+=	importlib-metadata
.endif

USE_PKG_RESOURCES=	yes

PYTHON_VERSIONED_DEPENDENCIES+=	setuptools_scm:build
PYTHON_VERSIONED_DEPENDENCIES+=	twisted:test

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} jsonschema jsonschema-${PYVERSSUFFIX} || ${TRUE}

do-test:
	cd ${WRKSRC}/jsonschema && ${PYTHONBIN} -m unittest discover -v

.include "../../lang/python/egg.mk"
.include "../../lang/python/versioned_dependencies.mk"
.include "../../mk/bsd.pkg.mk"
