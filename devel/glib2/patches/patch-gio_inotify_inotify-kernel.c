$NetBSD: patch-gio_inotify_inotify-kernel.c,v 1.4 2019/06/04 10:24:21 maya Exp $

Use _XOPEN_NAME_MAX in lieu of NAME_MAX for SunOS.

Include <sys/filio.h> for FIONREAD on SunOS.
https://gitlab.gnome.org/GNOME/glib/merge_requests/889

--- gio/inotify/inotify-kernel.c.orig	2019-09-05 16:56:48.000000000 +0000
+++ gio/inotify/inotify-kernel.c
@@ -38,6 +38,9 @@
 #include "glib-private.h"
 
 /* From inotify(7) */
+#if !defined(NAME_MAX) && defined(_XOPEN_NAME_MAX)
+#define NAME_MAX             _XOPEN_NAME_MAX
+#endif
 #define MAX_EVENT_SIZE       (sizeof(struct inotify_event) + NAME_MAX + 1)
 
 /* Amount of time to sleep on receipt of uninteresting events */
