$NetBSD: patch-browser_app_profile_firefox.js,v 1.2 2019/09/21 10:55:17 ryoon Exp $

--- browser/app/profile/firefox.js.orig	2019-09-09 23:43:23.000000000 +0000
+++ browser/app/profile/firefox.js
@@ -1862,6 +1862,15 @@ pref("prio.publicKeyB", "26E6674E65425B8
 pref("toolkit.coverage.enabled", false);
 pref("toolkit.coverage.endpoint.base", "https://coverage.mozilla.org");
 
+// Select UI locale from LANG/LC_MESSAGE environmental variables
+pref("intl.locale.requested", "");
+
+// Enable system addons, for example langpacks from www/firefox-l10n
+pref("extensions.autoDisableScopes", 11);
+
+// Disable multiprocess window support. Workaround for PR 53273.
+pref("browser.tabs.remote.autostart", false);
+
 // Discovery prefs
 pref("browser.discovery.enabled", true);
 pref("browser.discovery.containers.enabled", true);
