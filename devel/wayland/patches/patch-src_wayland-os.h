$NetBSD: patch-src_wayland-os.h,v 1.1 2019/08/18 16:05:12 nia Exp $

BSD support from FreeBSD

https://lists.freedesktop.org/archives/wayland-devel/2019-February/040024.html

--- src/wayland-os.h.orig	2019-03-21 00:55:25.000000000 +0000
+++ src/wayland-os.h
@@ -26,17 +26,23 @@
 #ifndef WAYLAND_OS_H
 #define WAYLAND_OS_H
 
+#include "../config.h"
+
 int
 wl_os_socket_cloexec(int domain, int type, int protocol);
 
 int
+wl_os_socketpair_cloexec(int domain, int type, int protocol, int sv[2]);
+
+int
 wl_os_dupfd_cloexec(int fd, long minfd);
 
 ssize_t
 wl_os_recvmsg_cloexec(int sockfd, struct msghdr *msg, int flags);
 
+
 int
-wl_os_epoll_create_cloexec(void);
+wl_os_queue_create_cloexec(void);
 
 int
 wl_os_accept_cloexec(int sockfd, struct sockaddr *addr, socklen_t *addrlen);
