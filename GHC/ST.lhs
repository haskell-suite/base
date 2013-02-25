\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE NoImplicitPrelude, MagicHash, UnboxedTuples, RankNTypes #-}
{-# OPTIONS_HADDOCK hide #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.ST
-- Copyright   :  (c) The University of Glasgow, 1992-2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- The 'ST' Monad.
--
-----------------------------------------------------------------------------

-- #hide
module GHC.ST (
        ST(..), STret(..), STRep,
        fixST, runST, runSTRep,

        -- * Unsafe functions
        liftST, unsafeInterleaveST
    ) where

import GHC.Base
import GHC.Show

default ()
\end{code}
