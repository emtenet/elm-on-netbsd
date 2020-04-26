--- System/Clock.hsc.orig	2020-04-26 12:26:17.724317673 +1000
+++ System/Clock.hsc	2020-04-26 12:54:40.364839682 +1000
@@ -7,6 +7,7 @@
 -- To allow importing Data.Int and Data.Word indiscriminately on all platforms,
 -- since we can't systematically predict what typedef's expand to.
 {-# OPTIONS_GHC -fno-warn-unused-imports #-}
+{-# LANGUAGE CApiFFI #-}
 
 module System.Clock
   ( Clock(..)
@@ -127,6 +128,9 @@
 #elif defined(__MACH__) && defined(__APPLE__)
 foreign import ccall hs_clock_darwin_gettime :: #{type clock_id_t} -> Ptr TimeSpec -> IO ()
 foreign import ccall hs_clock_darwin_getres  :: #{type clock_id_t} -> Ptr TimeSpec -> IO ()
+#elif defined(_NETBSD_SOURCE)
+foreign import capi unsafe clock_gettime :: #{type clockid_t} -> Ptr TimeSpec -> IO ()
+foreign import capi unsafe clock_getres  :: #{type clockid_t} -> Ptr TimeSpec -> IO ()
 #else
 foreign import ccall unsafe clock_gettime :: #{type clockid_t} -> Ptr TimeSpec -> IO ()
 foreign import ccall unsafe clock_getres  :: #{type clockid_t} -> Ptr TimeSpec -> IO ()
