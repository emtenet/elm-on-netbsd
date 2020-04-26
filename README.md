# elm-on-netbsd

This repository describes how I built the [Elm compiler] on NetBSD/amd64

[Elm compiler]: https://github.com/elm/compiler

Versions at the time of this writing:
* **Elm** 0.19.1
* **NetBSD** 9.0
* **GHC** 8.8

## Build it yourself

To build the Elm compiler:
* clone this repository,
* install the package dependancies,
* run `bin/build` inside this repository.

## Packages dependancies

* `lang/ghc88` (currently 8.8.1)
* `misc/cabal-install` (currently 3.0.0.0)
* `devel/autoconf` (currently 2.69nb9)
* `devel/git-base` (currently 2.26.2)

## Hackage versions have changed?

If the build changes what hackage versions it wants to use
try running `bin/build --no-patch` to find a fresh set of errors.

## Why does NetBSD need to patch hackages?

NetBSD uses C macros (see: `/usr/include/sys/featuretest.h`)
to allow applications to request which standard they wish to use.
For example (ANSI, POSIX, X/Open, and NetBSD).

These macros use symbol renaming to select the appropriate implementation.

The problem is many hackages bypass this renaming by directly referring to
API symbols. This causes link warnings like:

```
warning: reference to compatibility socket();
  include <sys/socket.h> for correct reference
```

That was caused by the following line (adjusted for narrative):

```
foreign import ccall unsafe "socket"
```

and needs to be changed to:

```
foreign import capi unsafe "sys/socket.h socket"
```

> NOTE: Use of `capi` requires the `CApiFFI` language extension turned on with:
> 
> ```
> {-# LANGUAGE CApiFFI #-}
> ```

## Can we build a statically linked binary?

The Elm installer for linux distributed by npm is statically linked so it
can work on as many platforms as possible.

Similar configure/build commands could be used:

```
cabal new-configure --disable-executable-dynamic --ghc-option=-optl=-static --ghc-option=-optl=-pthread
cabal new-build elm
```

but I have not got it work yet.
The hackage `terminfo` needs to link with `-lterminfo` but does not!

---

The dynamically linked binary only depends on:

* devel/gmp
* devel/libffi

Refer to output from `objdump -p output/elm` (snipped):

```
Dynamic Section:
  NEEDED               libm.so.0
  NEEDED               libz.so.1
  NEEDED               libcurses.so.8
  NEEDED               librt.so.1
  NEEDED               libutil.so.7
  NEEDED               libgmp.so.10
  NEEDED               libffi.so.7
  NEEDED               libpthread.so.1
  NEEDED               libgcc_s.so.1
  NEEDED               libc.so.12
  NEEDED               libterminfo.so.1
  RPATH                /usr/lib:/usr/pkg/lib
```

