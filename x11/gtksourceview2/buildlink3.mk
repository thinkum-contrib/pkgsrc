# $NetBSD: buildlink3.mk,v 1.44 2021/12/08 16:02:51 adam Exp $

BUILDLINK_TREE+=	gtksourceview2

.if !defined(GTKSOURCEVIEW2_BUILDLINK3_MK)
GTKSOURCEVIEW2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtksourceview2+=	gtksourceview2>=2.0.2<3
BUILDLINK_ABI_DEPENDS.gtksourceview2+=	gtksourceview2>=2.10.5nb43
BUILDLINK_PKGSRCDIR.gtksourceview2?=	../../x11/gtksourceview2

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GTKSOURCEVIEW2_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtksourceview2
