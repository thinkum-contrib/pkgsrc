$NetBSD: patch-dom_webauthn_u2f-hid-rs_src_netbsd_mod.rs,v 1.1 2020/07/15 19:52:23 riastradh Exp $

Add NetBSD support for U2F.

--- dom/webauthn/u2f-hid-rs/src/netbsd/mod.rs.orig	2020-07-15 16:19:08.143016295 +0000
+++ dom/webauthn/u2f-hid-rs/src/netbsd/mod.rs
@@ -0,0 +1,10 @@
+/* This Source Code Form is subject to the terms of the Mozilla Public
+ * License, v. 2.0. If a copy of the MPL was not distributed with this
+ * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
+
+pub mod device;
+pub mod transaction;
+
+mod fd;
+mod monitor;
+mod uhid;
