$NetBSD: patch-src_3rdparty_chromium_media_audio_audio__manager.cc,v 1.1 2021/08/03 21:04:35 markd Exp $

--- src/3rdparty/chromium/media/audio/audio_manager.cc.orig	2020-07-08 21:40:45.000000000 +0000
+++ src/3rdparty/chromium/media/audio/audio_manager.cc
@@ -48,7 +48,7 @@ class AudioManagerHelper {
   }
 #endif
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
   void set_app_name(const std::string& app_name) { app_name_ = app_name; }
   const std::string& app_name() const { return app_name_; }
 #endif
@@ -59,7 +59,7 @@ class AudioManagerHelper {
   std::unique_ptr<base::win::ScopedCOMInitializer> com_initializer_for_testing_;
 #endif
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
   std::string app_name_;
 #endif
 
@@ -128,7 +128,7 @@ std::unique_ptr<AudioManager> AudioManag
   return Create(std::move(audio_thread), GetHelper()->fake_log_factory());
 }
 
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
 // static
 void AudioManager::SetGlobalAppName(const std::string& app_name) {
   GetHelper()->set_app_name(app_name);
