# $NetBSD: buildlink3.mk,v 1.38 2019/08/22 12:23:21 ryoon Exp $

BUILDLINK_TREE+=	openimageio

.if !defined(OPENIMAGEIO_BUILDLINK3_MK)
OPENIMAGEIO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.openimageio+=	openimageio>=1.8.15
BUILDLINK_ABI_DEPENDS.openimageio?=	openimageio>=1.8.15nb7
BUILDLINK_PKGSRCDIR.openimageio?=	../../graphics/openimageio

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/hdf5/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/glew/buildlink3.mk"
.include "../../graphics/ilmbase/buildlink3.mk"
.include "../../graphics/libwebp/buildlink3.mk"
.include "../../graphics/opencv/buildlink3.mk"
.include "../../graphics/openjpeg15/buildlink3.mk"
.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# OPENIMAGEIO_BUILDLINK3_MK

BUILDLINK_TREE+=	-openimageio
