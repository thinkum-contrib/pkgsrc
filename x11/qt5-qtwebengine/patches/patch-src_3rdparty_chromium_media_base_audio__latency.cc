$NetBSD: patch-src_3rdparty_chromium_media_base_audio__latency.cc,v 1.1 2021/08/03 21:04:35 markd Exp $

--- src/3rdparty/chromium/media/base/audio_latency.cc.orig	2020-07-08 21:40:45.000000000 +0000
+++ src/3rdparty/chromium/media/base/audio_latency.cc
@@ -113,7 +113,7 @@ int AudioLatency::GetRtcBufferSize(int s
     return frames_per_buffer;
   }
 
-#if defined(OS_LINUX) || defined(OS_MACOSX) || defined(OS_FUCHSIA)
+#if defined(OS_LINUX) || defined(OS_MACOSX) || defined(OS_FUCHSIA) || defined(OS_BSD)
   // On Linux, MacOS and Fuchsia, the low level IO implementations on the
   // browser side supports all buffer size the clients want. We use the native
   // peer connection buffer size (10ms) to achieve best possible performance.
