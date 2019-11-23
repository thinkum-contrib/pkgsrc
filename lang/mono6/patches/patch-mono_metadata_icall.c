$NetBSD: patch-mono_metadata_icall.c,v 1.1 2019/08/25 16:37:01 maya Exp $

NetBSD will side-load <stdbool.h> which must have #define bool _Bool.
This causes some problems with the C preprocessor usage here. undef it.

--- mono/metadata/icall.c.orig	2019-09-19 07:46:07.000000000 +0000
+++ mono/metadata/icall.c
@@ -120,6 +120,10 @@
 #include "mono/utils/mono-threads-coop.h"
 #include "mono/metadata/icall-signatures.h"
 
+#if defined (__NetBSD__)
+#undef bool
+#endif
+
 //#define MONO_DEBUG_ICALLARRAY
 
 #ifdef MONO_DEBUG_ICALLARRAY
