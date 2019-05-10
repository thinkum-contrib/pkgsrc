# $NetBSD: buildlink3.mk,v 1.3 2019/05/07 11:29:34 jaapb Exp $

BUILDLINK_TREE+=	ocaml-dune

.if !defined(OCAML_DUNE_BUILDLINK3_MK)
OCAML_DUNE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-dune+=	ocaml-dune>=1.7.0
BUILDLINK_ABI_DEPENDS.ocaml-dune+=	ocaml-dune>=1.9.3
BUILDLINK_PKGSRCDIR.ocaml-dune?=	../../devel/ocaml-dune
.endif	# OCAML_DUNE_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-dune
