# $NetBSD: buildlink3.mk,v 1.15 2021/12/08 16:02:55 adam Exp $

BUILDLINK_TREE+=	libqtxdg

.if !defined(LIBQTXDG_BUILDLINK3_MK)
LIBQTXDG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libqtxdg+=	libqtxdg>=3.8.0
BUILDLINK_ABI_DEPENDS.libqtxdg?=		libqtxdg>=3.8.0
BUILDLINK_PKGSRCDIR.libqtxdg?=		../../x11/libqtxdg

.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.endif	# LIBQTXDG_BUILDLINK3_MK

BUILDLINK_TREE+=	-libqtxdg
