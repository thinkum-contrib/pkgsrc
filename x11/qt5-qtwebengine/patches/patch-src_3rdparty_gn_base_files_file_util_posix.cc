$NetBSD: patch-src_3rdparty_gn_base_files_file_util_posix.cc,v 1.1 2021/08/03 21:04:36 markd Exp $

Index: src/3rdparty/gn/base/files/file_util_posix.cc
--- src/3rdparty/gn/base/files/file_util_posix.cc.orig
+++ src/3rdparty/gn/base/files/file_util_posix.cc
@@ -254,7 +254,7 @@ bool ReplaceFile(const FilePath& from_path,
 #endif  // !defined(OS_NACL_NONSFI)
 
 bool CreateLocalNonBlockingPipe(int fds[2]) {
-#if defined(OS_LINUX)
+#if defined(OS_LINUX) || defined(OS_BSD)
   return pipe2(fds, O_CLOEXEC | O_NONBLOCK) == 0;
 #else
   int raw_fds[2];
