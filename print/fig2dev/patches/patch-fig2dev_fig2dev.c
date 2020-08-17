$NetBSD: patch-fig2dev_fig2dev.c,v 1.2 2017/10/04 12:01:43 wiz Exp $

NetBSD defines _setmode, but is not Windows.
https://sourceforge.net/p/mcj/tickets/17/

--- fig2dev/fig2dev.c.orig	2019-09-17 20:57:04.000000000 +0000
+++ fig2dev/fig2dev.c
@@ -30,6 +30,9 @@
 #include <stdarg.h>
 #include <string.h>
 #include <locale.h>
+#ifdef __NetBSD__
+#undef HAVE__SETMODE
+#endif
 /* In Windows, _setmode() is declared in <io.h>, O_BINARY in <fcntl.h>. It
  * accepts two arguments and sets file mode to text or binary. */
 #ifdef HAVE__SETMODE
