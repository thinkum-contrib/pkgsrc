$NetBSD: patch-src_3rdparty_gn_base_files_file_util.h,v 1.1 2021/08/03 21:04:36 markd Exp $

Index: src/3rdparty/gn/base/files/file_util.h
--- src/3rdparty/gn/base/files/file_util.h.orig
+++ src/3rdparty/gn/base/files/file_util.h
@@ -361,7 +361,7 @@ bool VerifyPathControlledByAdmin(const base::FilePath&
 // the directory |path|, in the number of FilePath::CharType, or -1 on failure.
 int GetMaximumPathComponentLength(const base::FilePath& path);
 
-#if defined(OS_LINUX) || defined(OS_AIX)
+#if defined(OS_LINUX) || defined(OS_AIX) || defined(OS_BSD)
 // Broad categories of file systems as returned by statfs() on Linux.
 enum FileSystemType {
   FILE_SYSTEM_UNKNOWN,   // statfs failed.
