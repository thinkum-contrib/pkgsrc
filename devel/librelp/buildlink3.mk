# $NetBSD: buildlink3.mk,v 1.5 2020/05/22 10:55:44 adam Exp $

BUILDLINK_TREE+=	librelp

.if !defined(LIBRELP_BUILDLINK3_MK)
LIBRELP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.librelp+=	librelp>=1.2.12
BUILDLINK_ABI_DEPENDS.librelp?=	librelp>=1.2.16nb3
BUILDLINK_PKGSRCDIR.librelp?=	../../devel/librelp

.include "../../security/gnutls/buildlink3.mk"
.endif	# LIBRELP_BUILDLINK3_MK

BUILDLINK_TREE+=	-librelp
