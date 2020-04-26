--- markdown/Cheapskate/ParserCombinators.hs.orig	2020-04-26 15:37:39.408583892 +1000
+++ markdown/Cheapskate/ParserCombinators.hs	2020-04-26 15:28:59.457427446 +1000
@@ -109,7 +109,6 @@
 
 instance Monad Parser where
   return x = Parser $ \st -> Right (st, x)
-  fail e = Parser $ \st -> Left $ ParseError (position st) e
   p >>= g = Parser $ \st ->
     case evalParser p st of
          Left e        -> Left e
@@ -117,6 +116,9 @@
   {-# INLINE return #-}
   {-# INLINE (>>=) #-}
 
+instance MonadFail Parser where
+  fail e = Parser $ \st -> Left $ ParseError (position st) e
+
 instance MonadPlus Parser where
   mzero = Parser $ \st -> Left $ ParseError (position st) "(mzero)"
   mplus p1 p2 = Parser $ \st ->
