$NetBSD: patch-retr.c,v 1.4 2019/05/09 09:37:36 hauke Exp $

Remove stale extern declaration

Move to openssl 1.1 api

--- retr.c.orig	2010-12-13 03:42:49.000000000 +0000
+++ retr.c
@@ -31,6 +31,7 @@
 
 #include <snet.h>
 
+#include "openssl_compat.h"
 #include "applefile.h"
 #include "connect.h"
 #include "cksum.h"
@@ -47,7 +48,6 @@ extern int		verbose;
 extern int		showprogress;
 extern int		dodots;
 extern int		cksum;
-extern int		errno;
 extern int		create_prefix;
 extern SSL_CTX  	*ctx;
 
@@ -74,7 +74,7 @@ retr( SNET *sn, char *pathdesc, char *pa
     char		buf[ 8192 ]; 
     ssize_t		rr;
     extern EVP_MD	*md;
-    EVP_MD_CTX		mdctx;
+    EVP_MD_CTX		*mdctx = EVP_MD_CTX_new();
     unsigned char	md_value[ EVP_MAX_MD_SIZE ];
     char		cksum_b64[ SZ_BASE64_E( EVP_MAX_MD_SIZE ) ];
 
@@ -84,7 +84,7 @@ retr( SNET *sn, char *pathdesc, char *pa
 	    fprintf( stderr, "%s\n", pathdesc );
 	    return( 1 );
 	}
-	EVP_DigestInit( &mdctx, md );
+	EVP_DigestInit( mdctx, md );
     }
 
     if ( verbose ) printf( ">>> RETR %s\n", pathdesc );
@@ -165,7 +165,7 @@ retr( SNET *sn, char *pathdesc, char *pa
 	    goto error2;
 	}
 	if ( cksum ) {
-	    EVP_DigestUpdate( &mdctx, buf, (unsigned int)rr );
+	    EVP_DigestUpdate( mdctx, buf, (unsigned int)rr );
 	}
 	if ( dodots ) { putc( '.', stdout ); fflush( stdout ); }
 	size -= rr;
@@ -197,8 +197,9 @@ retr( SNET *sn, char *pathdesc, char *pa
 
     /* cksum file */
     if ( cksum ) {
-	EVP_DigestFinal( &mdctx, md_value, &md_len );
+	EVP_DigestFinal( mdctx, md_value, &md_len );
 	base64_e( md_value, md_len, cksum_b64 );
+	EVP_MD_CTX_free(mdctx);
 	if ( strcmp( trancksum, cksum_b64 ) != 0 ) {
 	    fprintf( stderr, "line %d: checksum in transcript does not match "
 		"checksum from server\n", linenum );
@@ -246,7 +247,7 @@ retr_applefile( SNET *sn, char *pathdesc
     struct as_entry		ae_ents[ 3 ]; 
     struct timeval		tv;
     extern EVP_MD       	*md;
-    EVP_MD_CTX   	       	mdctx;
+    EVP_MD_CTX   	       	*mdctx;
     unsigned char       	md_value[ EVP_MAX_MD_SIZE ];
     char		       	cksum_b64[ SZ_BASE64_E( EVP_MAX_MD_SIZE ) ];
 
@@ -256,7 +257,7 @@ retr_applefile( SNET *sn, char *pathdesc
 	    fprintf( stderr, "%s\n", pathdesc );
             return( 1 );
         }
-        EVP_DigestInit( &mdctx, md );
+        EVP_DigestInit( mdctx, md );
     }
 
     if ( verbose ) printf( ">>> RETR %s\n", pathdesc );
@@ -316,7 +317,7 @@ retr_applefile( SNET *sn, char *pathdesc
 	return( -1 );
     }
     if ( cksum ) {
-	EVP_DigestUpdate( &mdctx, (char *)&ah, (unsigned int)rc );
+	EVP_DigestUpdate( mdctx, (char *)&ah, (unsigned int)rc );
     }
 
     /* name temp file */
@@ -373,7 +374,7 @@ retr_applefile( SNET *sn, char *pathdesc
     /* Should we check for valid ae_ents here? YES! */
 
     if ( cksum ) {
-	EVP_DigestUpdate( &mdctx, (char *)&ae_ents, (unsigned int)rc );
+	EVP_DigestUpdate( mdctx, (char *)&ae_ents, (unsigned int)rc );
     }
     if ( dodots ) { putc( '.', stdout ); fflush( stdout ); }
 
@@ -398,7 +399,7 @@ retr_applefile( SNET *sn, char *pathdesc
 	goto error2;
     }
     if ( cksum ) {
-	EVP_DigestUpdate( &mdctx, finfo, (unsigned int)rc );
+	EVP_DigestUpdate( mdctx, finfo, (unsigned int)rc );
     }
     if ( dodots ) { putc( '.', stdout ); fflush( stdout ); }
     size -= rc;
@@ -448,7 +449,7 @@ retr_applefile( SNET *sn, char *pathdesc
 		goto error3;
 	    }
 	    if ( cksum ) {
-		EVP_DigestUpdate( &mdctx, buf, (unsigned int)rc );
+		EVP_DigestUpdate( mdctx, buf, (unsigned int)rc );
 	    }
 	    if ( dodots ) { putc( '.', stdout ); fflush( stdout ); }
 	    if ( showprogress ) {
@@ -482,7 +483,7 @@ retr_applefile( SNET *sn, char *pathdesc
 	}
 
 	if ( cksum ) {
-	    EVP_DigestUpdate( &mdctx, buf, (unsigned int)rc );
+	    EVP_DigestUpdate( mdctx, buf, (unsigned int)rc );
 	}
 	if ( dodots ) { putc( '.', stdout ); fflush( stdout); }
 	if ( showprogress ) {
@@ -523,8 +524,9 @@ retr_applefile( SNET *sn, char *pathdesc
     if ( verbose ) printf( "<<< .\n" );
 
     if ( cksum ) {
-	EVP_DigestFinal( &mdctx, md_value, &md_len );
+	EVP_DigestFinal( mdctx, md_value, &md_len );
 	base64_e(( char*)&md_value, md_len, cksum_b64 );
+        EVP_MD_CTX_free(mdctx);
         if ( strcmp( trancksum, cksum_b64 ) != 0 ) {
 	    fprintf( stderr, "line %d: checksum in transcript does not match "
 		"checksum from server\n", linenum );
