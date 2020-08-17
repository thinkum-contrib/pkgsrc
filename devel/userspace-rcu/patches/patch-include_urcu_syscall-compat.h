$NetBSD$

Add support for FreeBSD, OpenBSD, and NetBSD
* FreeBSD - __BSD_VISIBLE - header file /usr/include/stdio.h (FreeBSD 11.2)
* OpenBSD - __BSD_VISIBLE - source file sys/sys/cdefs.h (file version 1.43)
* NetBSD - _NETBSD_SOURCE - source file sys/sys/featuretest.h (file version 1.10)

Furthermore referencing NetBSD syscall(2)

--- include/urcu/syscall-compat.h.orig	2019-05-27 15:51:53.000000000 +0000
+++ include/urcu/syscall-compat.h
@@ -27,7 +27,7 @@
  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
-#if defined(__ANDROID__) || defined(__sun__) || defined(__GNU__)
+#if defined(__ANDROID__) || defined(__sun__) || defined(__GNU__) || defined(__BSD_VISIBLE) || defined(_NETBSD_SOURCE)
 #include <sys/syscall.h>
 #elif defined(__linux__) || defined(__GLIBC__)
 #include <syscall.h>
