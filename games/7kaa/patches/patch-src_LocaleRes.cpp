$NetBSD: patch-src_LocaleRes.cpp,v 1.2 2019/07/19 09:13:51 nia Exp $

Support NetBSD and SunOS iconv being special.

--- src/LocaleRes.cpp.orig	2019-06-22 22:22:26.000000000 +0000
+++ src/LocaleRes.cpp
@@ -169,7 +169,11 @@ const char *LocaleRes::conv_str(iconv_t 
 	size_t c;
 	while( in_left>0 )
 	{
+#if defined(__NetBSD__) || defined(__sun)
+		c = iconv(cd, (const char **)&p1, &in_left, &p2, &out_left);
+#else
 		c = iconv(cd, &p1, &in_left, &p2, &out_left);
+#endif
 		if( c == (size_t)-1 )
 			return s;
 		if( in_left )
