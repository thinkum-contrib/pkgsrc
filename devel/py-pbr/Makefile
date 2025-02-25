# $NetBSD: Makefile,v 1.35 2022/01/27 11:23:16 wiz Exp $

DISTNAME=	pbr-5.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pbr/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://docs.openstack.org/pbr/
COMMENT=	Python Build Reasonableness
LICENSE=	apache-2.0

TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=4.5:../../devel/py-coverage
TEST_DEPENDS+=	${PYPKGPREFIX}-fixtures>=3.0.0:../../devel/py-fixtures
TEST_DEPENDS+=	${PYPKGPREFIX}-mock>=2.0.0:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-six>=1.10.0:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-testrepository>=0.0.18:../../devel/py-testrepository
TEST_DEPENDS+=	${PYPKGPREFIX}-testresources>=2.0.0:../../devel/py-testresources
TEST_DEPENDS+=	${PYPKGPREFIX}-testscenarios>=0.4:../../devel/py-testscenarios
TEST_DEPENDS+=	${PYPKGPREFIX}-virtualenv>=14.0.6:../../devel/py-virtualenv
#TEST_DEPENDS+=	${PYPKGPREFIX}-pre-commit-[0-9]*:../../wip/py-pre-commit
TEST_DEPENDS+=	${PYPKGPREFIX}-sphinx-[0-9]*:../../textproc/py-sphinx
TEST_DEPENDS+=	${PYPKGPREFIX}-wheel>=0.32.0:../../devel/py-wheel
# not packaged: hacking, stestr

# circular dependency - testtools depends on pbr
#PYTHON_VERSIONED_DEPENDENCIES+=	testtools:test

REPLACE_PYTHON+=	pbr/tests/testpackage/setup.py

USE_PKG_RESOURCES=	yes

post-install:
	${CHMOD} -R g-w,o-w ${DESTDIR}${PREFIX}/${PYSITELIB}/pbr/tests/testpackage
	cd ${DESTDIR}${PREFIX}/bin && ${MV} pbr pbr-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../lang/python/versioned_dependencies.mk"
.include "../../mk/bsd.pkg.mk"
