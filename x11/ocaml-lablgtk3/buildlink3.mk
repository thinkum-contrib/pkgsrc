# $NetBSD: buildlink3.mk,v 1.10 2022/02/28 13:16:24 jaapb Exp $

BUILDLINK_TREE+=	ocaml-lablgtk3

.if !defined(OCAML_LABLGTK3_BUILDLINK3_MK)
OCAML_LABLGTK3_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-lablgtk3+=	ocaml-lablgtk3>=3.0beta8
BUILDLINK_ABI_DEPENDS.ocaml-lablgtk3+=	ocaml-lablgtk3>=3.1.2
BUILDLINK_PKGSRCDIR.ocaml-lablgtk3?=	../../x11/ocaml-lablgtk3

# options must be exposed if and only if we built with them
pkgbase := ocaml-lablgtk3
.include "../../mk/pkg-build-options.mk"

.if ${PKG_BUILD_OPTIONS.ocaml-lablgtk3:Mgtkspell}
.  include "../../textproc/gtkspell3/buildlink3.mk"
.endif

.if ${PKG_BUILD_OPTIONS.ocaml-lablgtk3:Mgtksourceview3}
.  include "../../x11/gtksourceview3/buildlink3.mk"
.endif

.endif	# OCAML_LABLGTK3_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-lablgtk3
