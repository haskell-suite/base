\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , BangPatterns
           , MagicHash
           , UnboxedTuples
           , DeriveDataTypeable
           , StandaloneDeriving
  #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Weak
-- Copyright   :  (c) The University of Glasgow, 1998-2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- Weak pointers.
--
-----------------------------------------------------------------------------

-- #hide
module GHC.Weak (
        Weak(..),
        mkWeak,
        deRefWeak,
        finalize,
        runFinalizerBatch
    ) where
