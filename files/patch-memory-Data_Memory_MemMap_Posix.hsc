--- Data/Memory/MemMap/Posix.hsc.orig	2020-04-26 13:40:31.313015198 +1000
+++ Data/Memory/MemMap/Posix.hsc	2020-04-26 13:41:30.697214379 +1000
@@ -22,6 +22,7 @@
 
 {-# LANGUAGE ForeignFunctionInterface #-}
 {-# LANGUAGE CPP #-}
+{-# LANGUAGE CApiFFI #-}
 module Data.Memory.MemMap.Posix
     ( memoryMap
     , memoryUnmap
@@ -59,7 +60,7 @@
     c_madvise :: Ptr a -> CSize -> CInt -> IO CInt
 #endif
 
-foreign import ccall unsafe "msync"
+foreign import capi unsafe "sys/mman.h msync"
     c_msync :: Ptr a -> CSize -> CInt -> IO CInt
 
 foreign import ccall unsafe "mprotect"
