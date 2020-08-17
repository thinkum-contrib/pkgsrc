# $NetBSD: buildlink3.mk,v 1.6 2020/07/08 14:46:14 jperkin Exp $

#
# DO NOT include this directly! Use rust.mk instead.
#
BUILDLINK_TREE+=	rust

.if !defined(RUST_BUILDLINK3_MK)
RUST_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.rust+=	rust>=1.20.0
BUILDLINK_PKGSRCDIR.rust?=	../../lang/rust
BUILDLINK_PASSTHRU_DIRS+=	${PREFIX}/lib/rustlib
.endif

BUILDLINK_TREE+=	-rust
