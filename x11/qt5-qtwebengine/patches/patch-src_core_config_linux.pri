$NetBSD: patch-src_core_config_linux.pri,v 1.1 2021/08/03 21:04:36 markd Exp $

Index: src/core/config/linux.pri
--- src/core/config/linux.pri.orig
+++ src/core/config/linux.pri
@@ -31,7 +31,6 @@ qtConfig(webengine-embedded-build) {
 
     qtConfig(webengine-webrtc): qtConfig(webengine-webrtc-pipewire): gn_args += rtc_use_pipewire=true
 
-    qtConfig(webengine-system-libevent): gn_args += use_system_libevent=true
     qtConfig(webengine-system-libwebp):  gn_args += use_system_libwebp=true
     qtConfig(webengine-system-libxml2):  gn_args += use_system_libxml=true use_system_libxslt=true
     qtConfig(webengine-system-opus):     gn_args += use_system_opus=true
@@ -43,6 +42,7 @@ qtConfig(webengine-embedded-build) {
     qtConfig(webengine-system-lcms2):    gn_args += use_system_lcms2=true
 
     # FIXME:
+    #qtConfig(webengine-system-libevent): gn_args += use_system_libevent=true
     #qtConfig(webengine-system-protobuf): gn_args += use_system_protobuf=true
     #qtConfig(webengine-system-jsoncpp): gn_args += use_system_jsoncpp=true
     #qtConfig(webengine-system-libsrtp: gn_args += use_system_libsrtp=true
