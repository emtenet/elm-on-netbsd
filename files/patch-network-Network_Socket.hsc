--- Network/Socket.hsc.orig	2020-04-26 13:42:41.728518268 +1000
+++ Network/Socket.hsc	2020-04-26 13:43:23.525047051 +1000
@@ -1,5 +1,6 @@
 {-# LANGUAGE CPP, ScopedTypeVariables, RecordWildCards #-}
 {-# OPTIONS_GHC -fno-warn-orphans #-}
+{-# LANGUAGE CApiFFI #-}
 -----------------------------------------------------------------------------
 -- |
 -- Module      :  Network.Socket
@@ -1691,7 +1692,7 @@
   c_close :: CInt -> IO CInt
 #endif
 
-foreign import CALLCONV unsafe "socket"
+foreign import capi unsafe "sys/socket.h socket"
   c_socket :: CInt -> CInt -> CInt -> IO CInt
 foreign import CALLCONV unsafe "bind"
   c_bind :: CInt -> Ptr SockAddr -> CInt{-CSockLen???-} -> IO CInt
