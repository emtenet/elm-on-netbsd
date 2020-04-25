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
