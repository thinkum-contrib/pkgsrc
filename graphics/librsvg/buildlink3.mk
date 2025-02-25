# $NetBSD: buildlink3.mk,v 1.64 2022/02/23 20:48:56 wiz Exp $

BUILDLINK_TREE+=	librsvg

.if !defined(LIBRSVG_BUILDLINK3_MK)
LIBRSVG_BUILDLINK3_MK:=

.include "../../mk/bsd.fast.prefs.mk"

.include "../../graphics/librsvg/available.mk"

.if ${LIBRSVG_TYPE} == "rust"
BUILDLINK_PKGSRCDIR.librsvg?=	../../graphics/librsvg
BUILDLINK_ABI_DEPENDS.librsvg?=	librsvg>=2.50.7
BUILDLINK_API_DEPENDS.librsvg+=	librsvg>=2.41
.elif ${LIBRSVG_TYPE} == "c"
BUILDLINK_PKGSRCDIR.librsvg?=	../../graphics/librsvg-c
BUILDLINK_ABI_DEPENDS.librsvg+=	librsvg>=2.40.20nb4<2.41
BUILDLINK_API_DEPENDS.librsvg+=	librsvg>=2.12.6nb1<2.41

.include "../../textproc/libcroco/buildlink3.mk"
.else
PKG_FAIL_REASON+=		"[graphics/librsvg/buildlink3.mk] Invalid value ${LIBRSVG_TYPE} for LIBRSVG_TYPE."
.endif

.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/cairo-gobject/buildlink3.mk"
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
.endif # LIBRSVG_BUILDLINK3_MK

BUILDLINK_TREE+=	-librsvg
