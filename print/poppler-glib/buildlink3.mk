# $NetBSD: buildlink3.mk,v 1.87 2021/12/08 16:02:32 adam Exp $

BUILDLINK_TREE+=	poppler-glib

.if !defined(POPPLER_GLIB_BUILDLINK3_MK)
POPPLER_GLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.poppler-glib+=	poppler-glib>=0.5.1
BUILDLINK_ABI_DEPENDS.poppler-glib+=	poppler-glib>=21.11.0
BUILDLINK_PKGSRCDIR.poppler-glib?=	../../print/poppler-glib

.include "../../devel/glib2/buildlink3.mk"
.include "../../print/poppler/buildlink3.mk"
.endif # POPPLER_GLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-poppler-glib
