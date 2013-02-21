{-# LANGUAGE Unsafe #-}
{-# LANGUAGE CPP, MagicHash, UnboxedTuples, RankNTypes #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Monad.ST.Lazy.Imp
-- Copyright   :  (c) The University of Glasgow 2001
-- License     :  BSD-style (see the file libraries/base/LICENSE)
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  provisional
-- Portability :  non-portable (requires universal quantification for runST)
--
-- This module presents an identical interface to "Control.Monad.ST",
-- except that the monad delays evaluation of state operations until
-- a value depending on them is required.
--
-----------------------------------------------------------------------------

-- #hide
module Control.Monad.ST.Lazy.Imp (
        -- * The 'ST' monad
        ST,
        runST,
        fixST,

        -- * Converting between strict and lazy 'ST'
        strictToLazyST, lazyToStrictST,

        -- * Converting 'ST' To 'IO'
        RealWorld,
        stToIO,

        -- * Unsafe operations
        unsafeInterleaveST,
        unsafeIOToST
    ) where

import Prelude

import Control.Monad.Fix

import qualified Control.Monad.ST.Safe as ST
import qualified Control.Monad.ST.Unsafe as ST

#ifdef __GLASGOW_HASKELL__
import qualified GHC.ST as GHC.ST
import GHC.Base
#endif

#ifdef __HUGS__
import Hugs.LazyST
#endif
