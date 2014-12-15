To compile with haskell-names do

    cabal install --haskell-suite -w hs-gen-iface --gcc-option=-I/usr/lib/ghc/include --extra-include-dirs=/usr/lib/ghc/include --solver=topdown -f include-ghc-prim
