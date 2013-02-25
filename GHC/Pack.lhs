\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE NoImplicitPrelude, MagicHash, UnboxedTuples #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Pack
-- Copyright   :  (c) The University of Glasgow 1997-2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- This module provides a small set of low-level functions for packing
-- and unpacking a chunk of bytes. Used by code emitted by the compiler
-- plus the prelude libraries.
-- 
-- The programmer level view of packed strings is provided by a GHC
-- system library PackedString.
--
-----------------------------------------------------------------------------

-- #hide
module GHC.Pack
       (
        -- (**) - emitted by compiler.

        packCString#,
        unpackCString,
        unpackCString#,
        unpackNBytes#,
        unpackFoldrCString#,  -- (**)
        unpackAppendCString#,  -- (**)
       ) 
        where

import GHC.Base
import GHC.List ( length )
import GHC.ST
import GHC.Ptr
\end{code}
