# $NetBSD: version.mk,v 1.3 2019/07/14 10:59:35 wiz Exp $

VERSION=	5.0.2

PYTHON_VERSIONS_INCOMPATIBLE=	36 37 # 5.0 has "beta" support for python 3
# see https://www.mercurial-scm.org/wiki/Python3
# set HGPYTHON3=1 in the environment during install
