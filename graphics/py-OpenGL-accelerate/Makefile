# $NetBSD: Makefile,v 1.7 2022/01/27 08:35:28 wiz Exp $

DISTNAME=	PyOpenGL-accelerate-3.1.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/^Py//}
PKGREVISION=	2
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=P/PyOpenGL-accelerate/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://pyopengl.sourceforge.net/
COMMENT=	Acceleration code for PyOpenGL
# There are many similar licenses, see license.txt
LICENSE=	modified-bsd AND mit

PYTHON_VERSIONS_INCOMPATIBLE=	27 # py-numpy

pre-build:
	cd ${WRKSRC}/src && for i in *.pyx; do cython-${PYVERSSUFFIX} $$i; done

.include "../../lang/python/egg.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
