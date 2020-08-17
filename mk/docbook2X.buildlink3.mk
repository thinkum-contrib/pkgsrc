# $NetBSD$
#
# This Makefile fragment is meant to be included by ports that require
# a docbook2X implementation during build, as set via DOCBOOK_TO_MAN
#
# === Variables set by this file ===
#
# DOCBOOK2X_TYPE
#	The name of the selected docbook2X implementation.
#       One of: docbook2X, docbook2x, xmlto

.include "bsd.fast.prefs.mk"

DOCBOOK2X_TYPE?=			xmlto

## distpatch on DOCBOOK2X_TYPE to set 'configure' environment variable DOCBOOK_TO_MAN

.if !empty(DOCBOOK2X_TYPE:Mxmlto)
CONFIGURE_ENV+= DOCBOOK_TO_MAN="xmlto man --skip-validation"
BUILD_DEPENDS+= xmlto:../../textproc/xmlto

.elif !empty(DOCBOOK2X_TYPE:Mdocbook2[Xx])
CONFIGURE_ENV+= DOCBOOK_TO_MAN="docbook2man"
BUILD_DEPENDS+= docbook2X:../../wip/docbook2X

.else
PKG_FAIL_REASON		+="Unrecognized DOCBOOK2X_TYPE ${DOCBOOK2X_TYPE}"
.endif
