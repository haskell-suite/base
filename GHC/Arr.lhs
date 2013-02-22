\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE NoImplicitPrelude, NoBangPatterns, MagicHash, UnboxedTuples #-}
{-# OPTIONS_GHC -funbox-strict-fields #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Arr
-- Copyright   :  (c) The University of Glasgow, 1994-2000
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC extensions)
--
-- GHC\'s array implementation.
-- 
-----------------------------------------------------------------------------

-- #hide
module GHC.Arr (
        Ix(..), Array(..), STArray(..),

        indexError, hopelessIndexError,
        arrEleBottom, array, listArray,
        (!), safeRangeSize, negRange, safeIndex, badSafeIndex,
        bounds, numElements, numElementsSTArray, indices, elems,
        assocs, accumArray, adjust, (//), accum,
        amap, ixmap,
        eqArray, cmpArray, cmpIntArray,
        newSTArray, boundsSTArray,
        readSTArray, writeSTArray,
        freezeSTArray, thawSTArray,

        -- * Unsafe operations
        fill, done,
        unsafeArray, unsafeArray',
        lessSafeIndex, unsafeAt, unsafeReplace,
        unsafeAccumArray, unsafeAccumArray', unsafeAccum,
        unsafeReadSTArray, unsafeWriteSTArray,
        unsafeFreezeSTArray, unsafeThawSTArray,
    ) where

import GHC.Enum
import GHC.Num
import GHC.ST
import GHC.Base
import GHC.List
import GHC.Real
import GHC.Show

infixl 9  !, //

default ()
\end{code}

