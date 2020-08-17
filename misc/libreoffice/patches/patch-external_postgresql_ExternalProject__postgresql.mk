$NetBSD: patch-external_postgresql_ExternalProject__postgresql.mk,v 1.3 2020/08/11 16:07:39 ryoon Exp $

* Do not try to link NSPR/NSS libraries. They are not required really.

--- external/postgresql/ExternalProject_postgresql.mk.orig	2020-07-29 19:29:17.000000000 +0000
+++ external/postgresql/ExternalProject_postgresql.mk
@@ -70,7 +70,7 @@ $(call gb_ExternalProject_get_state_targ
 				$(if $(ENABLE_LDAP),,--with-ldap=no) \
 			CPPFLAGS="$(postgresql_CPPFLAGS)" \
 			LDFLAGS="$(postgresql_LDFLAGS)" \
-			$(if $(ENABLE_LDAP),EXTRA_LDAP_LIBS="-llber -lssl3 -lsmime3 -lnss3 -lnssutil3 -lplds4 -lplc4 -lnspr4") \
+			$(if $(ENABLE_LDAP),EXTRA_LDAP_LIBS="-llber") \
 		&& cd src/interfaces/libpq \
 		&& MAKEFLAGS= && $(MAKE) all-static-lib)
 	$(call gb_Trace_EndRange,postgresql,EXTERNAL)
