--- Data/Hourglass/Internal/Unix.hs.orig	2020-04-26 13:38:06.550245884 +1000
+++ Data/Hourglass/Internal/Unix.hs	2020-04-26 13:46:28.095729835 +1000
@@ -13,6 +13,7 @@
 {-# LANGUAGE ForeignFunctionInterface #-}
 {-# LANGUAGE CPP #-}
 {-# LANGUAGE EmptyDataDecls #-}
+{-# LANGUAGE CApiFFI #-}
 module Data.Hourglass.Internal.Unix
     ( dateTimeFromUnixEpochP
     , dateTimeFromUnixEpoch
@@ -76,16 +77,16 @@
     c_clock_get :: Ptr CLong -> IO ()
 
 #if (MIN_VERSION_base(4,5,0))
-foreign import ccall unsafe "gmtime_r"
+foreign import capi unsafe "time.h gmtime_r"
     c_gmtime_r :: Ptr CTime -> Ptr CTm -> IO (Ptr CTm)
 
-foreign import ccall unsafe "localtime_r"
+foreign import capi unsafe "time.h localtime_r"
     c_localtime_r :: Ptr CTime -> Ptr CTm -> IO (Ptr CTm)
 #else
-foreign import ccall unsafe "gmtime_r"
+foreign import capi unsafe "time.h gmtime_r"
     c_gmtime_r :: Ptr CLong -> Ptr CTm -> IO (Ptr CTm)
 
-foreign import ccall unsafe "localtime_r"
+foreign import capi unsafe "time.h localtime_r"
     c_localtime_r :: Ptr CLong -> Ptr CTm -> IO (Ptr CTm)
 #endif
 
