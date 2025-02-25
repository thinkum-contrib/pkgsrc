$NetBSD: patch-src_3rdparty_chromium_content_renderer_renderer__blink__platform__impl.cc,v 1.1 2021/08/03 21:04:35 markd Exp $

--- src/3rdparty/chromium/content/renderer/renderer_blink_platform_impl.cc.orig	2020-11-07 01:22:36.000000000 +0000
+++ src/3rdparty/chromium/content/renderer/renderer_blink_platform_impl.cc
@@ -98,7 +98,7 @@
 
 #if defined(OS_MACOSX)
 #include "content/child/child_process_sandbox_support_impl_mac.h"
-#elif defined(OS_LINUX)
+#elif defined(OS_LINUX) || defined(OS_BSD)
 #include "content/child/child_process_sandbox_support_impl_linux.h"
 #endif
 
@@ -173,7 +173,7 @@ RendererBlinkPlatformImpl::RendererBlink
   if (RenderThreadImpl::current()) {
     io_runner_ = RenderThreadImpl::current()->GetIOTaskRunner();
     thread_safe_sender_ = RenderThreadImpl::current()->thread_safe_sender();
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
     mojo::PendingRemote<font_service::mojom::FontService> font_service;
     RenderThreadImpl::current()->BindHostReceiver(
         font_service.InitWithNewPipeAndPassReceiver());
@@ -183,7 +183,7 @@ RendererBlinkPlatformImpl::RendererBlink
 #endif
   }
 
-#if defined(OS_LINUX) || defined(OS_MACOSX)
+#if defined(OS_LINUX) || defined(OS_MACOSX) || defined(OS_BSD)
   if (sandboxEnabled()) {
 #if defined(OS_MACOSX)
     sandbox_support_ = std::make_unique<WebSandboxSupportMac>();
@@ -265,7 +265,7 @@ RendererBlinkPlatformImpl::CreateNetwork
 
 void RendererBlinkPlatformImpl::SetDisplayThreadPriority(
     base::PlatformThreadId thread_id) {
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
   if (RenderThreadImpl* render_thread = RenderThreadImpl::current()) {
     render_thread->render_message_filter()->SetThreadPriority(
         thread_id, base::ThreadPriority::DISPLAY);
@@ -278,7 +278,7 @@ blink::BlameContext* RendererBlinkPlatfo
 }
 
 blink::WebSandboxSupport* RendererBlinkPlatformImpl::GetSandboxSupport() {
-#if defined(OS_LINUX) || defined(OS_MACOSX)
+#if defined(OS_LINUX) || defined(OS_MACOSX) || defined(OS_BSD)
   return sandbox_support_.get();
 #else
   // These platforms do not require sandbox support.
