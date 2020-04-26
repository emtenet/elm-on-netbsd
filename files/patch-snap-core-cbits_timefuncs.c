--- cbits/timefuncs.c.orig	2020-04-26 13:43:56.812415000 +1000
+++ cbits/timefuncs.c	2020-04-26 13:44:27.826553056 +1000
@@ -1,6 +1,7 @@
 #define _DEFAULT_SOURCE
 #define _XOPEN_SOURCE
 #define _BSD_SOURCE
+#define _NETBSD_SOURCE
 #include <time.h>
 #include <locale.h>
 
