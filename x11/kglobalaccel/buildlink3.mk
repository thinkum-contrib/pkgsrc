# $NetBSD: buildlink3.mk,v 1.22 2021/12/08 16:02:53 adam Exp $

BUILDLINK_TREE+=	kglobalaccel

.if !defined(KGLOBALACCEL_BUILDLINK3_MK)
KGLOBALACCEL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kglobalaccel+=	kglobalaccel>=5.18.0
BUILDLINK_ABI_DEPENDS.kglobalaccel?=	kglobalaccel>=5.80.0nb3
BUILDLINK_PKGSRCDIR.kglobalaccel?=	../../x11/kglobalaccel

.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/kcrash/buildlink3.mk"
.include "../../sysutils/kdbusaddons/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KGLOBALACCEL_BUILDLINK3_MK

BUILDLINK_TREE+=	-kglobalaccel
