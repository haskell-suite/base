{-# LANGUAGE Unsafe #-}
{-# LANGUAGE NoImplicitPrelude, MagicHash, UnboxedTuples #-}
{-# OPTIONS_GHC -funbox-strict-fields #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.MVar
-- Copyright   :  (c) The University of Glasgow 2008
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- The MVar type
--
-----------------------------------------------------------------------------

module GHC.MVar (
        -- * MVars
          MVar(..)
        , newMVar
        , newEmptyMVar
        , takeMVar
        , putMVar
        , tryTakeMVar
        , tryPutMVar
        , isEmptyMVar
        , addMVarFinalizer
    ) where

import GHC.Base
import Data.Maybe
