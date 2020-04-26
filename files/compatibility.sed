# = Single line example
# ld: /home/met/.cabal/store/ghc-8.8.1/memory-0.15.0-ff8b24d439d2dd0f4a5a0db6fd5a7d8bc7dc009d945b1dba5ed2647f0de5c028/lib/libHSmemory-0.15.0-ff8b24d439d2dd0f4a5a0db6fd5a7d8bc7dc009d945b1dba5ed2647f0de5c028-ghc8.8.1.so: warning: warning: reference to compatibility msync(); include <sys/mman.h> for correct reference
/^ld: .*reference to compatibility/{
    s/^.*cabal\/store\/ghc-[0-9.]*\/\([a-z-]*\)-\([0-9.]*\)-.*reference to compatibility \([a-zA-Z_]*\)(); include <\(.*\)>.*$/\1-\2:\
  foreign import capi unsafe "\4 \3"/
    p
}
# = Two line example
# ld: /home/met/.cabal/store/ghc-8.8.1/network-2.6.3.6-afe4b9cd24dc5718435236e50ede2dcd1a255e4305b6a2ebf35d1ad835c6600a/lib/libHSnetwork-2.6.3.6-afe4b9cd24dc5718435236e50ede2dcd1a255e4305b6a2ebf35d1ad835c6600a.a(Socket.o): in function `networkzm2zi6zi3zi6zmafe4b9cd24dc5718435236e50ede2dcd1a255e4305b6a2ebf35d1ad835c6600a_NetworkziSocket_socket2_info':
# (.text+0x14168): warning: warning: reference to compatibility socket(); include <sys/socket.h> for correct reference
/^ld: .*: in function .*:$/{
    N
    s/^.*cabal\/store\/ghc-[0-9.]*\/\([a-z-]*\)-\([0-9.]*\)-.* in function `\(.*\)':\n.*reference to compatibility \([a-zA-Z_]*\)(); include <\(.*\)>.*$/\1-\2:\
  in function \3\
  foreign import capi unsafe "\5 \4"/
    t found
    D
    b
    :found
    p
}
