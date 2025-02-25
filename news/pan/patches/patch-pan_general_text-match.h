$NetBSD: patch-pan_general_text-match.h,v 1.3 2021/09/19 18:02:37 rhialto Exp $
Avoid clash with host defined ERR (on SunOS)
--- pan/general/text-match.h.orig	2012-06-29 22:24:54.000000000 +0000
+++ pan/general/text-match.h
@@ -108,7 +108,7 @@ private:
       class PcreInfo;
       mutable PcreInfo * _pcre_info;
 
-      enum PcreState { NEED_COMPILE, COMPILED, ERR };
+      enum PcreState { NEED_COMPILE, COMPILED, PCRE_ERR };
       mutable PcreState _pcre_state;
 
 public:
