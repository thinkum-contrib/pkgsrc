# $NetBSD: buildlink3.mk,v 1.9 2021/12/08 16:01:44 adam Exp $

BUILDLINK_TREE+=	lilv

.if !defined(LILV_BUILDLINK3_MK)
LILV_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.lilv+=	lilv>=0.20.0
BUILDLINK_ABI_DEPENDS.lilv+=	lilv>=0.24.12nb3
BUILDLINK_PKGSRCDIR.lilv?=	../../audio/lilv

.include "../../audio/lv2/buildlink3.mk"
.include "../../converters/sratom/buildlink3.mk"
.include "../../textproc/sord/buildlink3.mk"
.include "../../textproc/serd/buildlink3.mk"
.endif	# LILV_BUILDLINK3_MK

BUILDLINK_TREE+=	-lilv
