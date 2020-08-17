# $NetBSD: options.mk,v 1.19 2019/11/02 22:37:54 rillig Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.cairo
PKG_SUPPORTED_OPTIONS=	x11 xcb opengl
.if exists(/System/Library/Frameworks/Quartz.framework)
PKG_SUPPORTED_OPTIONS+=	quartz
.endif
PKG_SUGGESTED_OPTIONS=	x11 xcb

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		x11 xcb quartz opengl opengl-egl opengl-glx

##
## OpenGL Support
##
## This would be needed for building webkit-gtk for Accelerated 2D Canvas
##
.if !empty(PKG_OPTIONS:Mopengl)
PLIST.opengl=		yes
.include "../../graphics/MesaLib/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-gl
## see also: MesaLib options.mk, buildlink3.mk
##
## TBD conflics between --enable-glesv[23] and --enable-gl

. if empty(MESALIB_SUPPORTS_EGL:Mno)
PLIST.opengl-egl=		yes
CONFIGURE_ARGS+=	--enable-egl
. else
CONFIGURE_ARGS+=	--disable-egl
. endif ## EGL

. if exists(${LOCALBASE}/include/GL/glx.h)
PLIST.opengl-glx=		yes
## In lieu of any MESALIB_SUPPORTS_GLX (undefined) test for a file
## that should be installed only if glx support is available,
## as per the MesaLib PLIST
CONFIGURE_ARGS+=	--enable-glx
. else
CONFIGURE_ARGS+=	--disble-glx
. endif ## GLX

.else
CONFIGURE_ARGS+=	--disable-gl
.endif


###
### X11 and XCB support (XCB implies X11)
###
.if !empty(PKG_OPTIONS:Mx11) || !empty(PKG_OPTIONS:Mxcb)
CONFIGURE_ARGS+=	--enable-xlib
CONFIGURE_ARGS+=	--enable-xlib-xrender
PLIST.x11=		yes
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"

.  if !empty(PKG_OPTIONS:Mxcb)
CONFIGURE_ARGS+=	--enable-xcb
PLIST.xcb=		yes
.    include "../../x11/libxcb/buildlink3.mk"
.  else
CONFIGURE_ARGS+=	--disable-xcb
.  endif

.else
CONFIGURE_ARGS+=	--disable-xlib
CONFIGURE_ARGS+=	--disable-xlib-xrender
CONFIGURE_ARGS+=	--disable-xcb
.endif

###
### Quartz backend
###
# Quartz backend interacts badly with our library stack. The most
# notable issue is that when quartz-font is enabled, cairo will never
# use fontconfig but instead uses CoreGraphics API to find fonts in
# system-default font paths; as a result, any fonts installed with
# pkgsrc will never be found. OTOH fontconfig by default searches for
# fonts in MacOS X system-default paths too so sticking with it will
# not be a problem.
.if !empty(PKG_OPTIONS:Mquartz)
CONFIGURE_ARGS+=	--enable-quartz
CONFIGURE_ARGS+=	--enable-quartz-font
CONFIGURE_ARGS+=	--enable-quartz-image
PLIST.quartz=		yes
WARNINGS+=		"You have enabled Quartz backend. No fonts installed with pkgsrc will be found."
.else
CONFIGURE_ARGS+=	--disable-quartz
CONFIGURE_ARGS+=	--disable-quartz-font
CONFIGURE_ARGS+=	--disable-quartz-image
.endif
