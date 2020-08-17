$NetBSD: patch-mcs_class_corlib_Test_Mono_MonoNativePlatformType.cs,v 1.3 2020/01/09 15:26:36 ryoon Exp $

Add netbsd support
https://github.com/mono/mono/pull/15938

--- mcs/class/corlib/Test/Mono/MonoNativePlatformType.cs.orig	2019-09-19 07:46:06.000000000 +0000
+++ mcs/class/corlib/Test/Mono/MonoNativePlatformType.cs
@@ -38,6 +38,7 @@
 		MONO_NATIVE_PLATFORM_TYPE_AIX		= 4,
 		MONO_NATIVE_PLATFORM_TYPE_ANDROID	= 5,
 		MONO_NATIVE_PLATFORM_TYPE_FREEBSD	= 6,
+		MONO_NATIVE_PLATFORM_TYPE_NETBSD	= 8,
 
 		MONO_NATIVE_PLATFORM_TYPE_IPHONE	= 0x100,
 		MONO_NATIVE_PLATFORM_TYPE_TV		= 0x200,
