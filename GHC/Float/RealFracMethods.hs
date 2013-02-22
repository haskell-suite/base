{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP, MagicHash, UnboxedTuples, ForeignFunctionInterface,
    NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Float.RealFracMethods
-- Copyright   :  (c) Daniel Fischer 2010
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- Methods for the RealFrac instances for 'Float' and 'Double',
-- with specialised versions for 'Int'.
--
-- Moved to their own module to not bloat GHC.Float further.
--
-----------------------------------------------------------------------------

#include "MachDeps.h"

-- #hide
module GHC.Float.RealFracMethods
    ( -- * Double methods
      -- ** Integer results
      properFractionDoubleInteger
    , truncateDoubleInteger
    , floorDoubleInteger
    , ceilingDoubleInteger
    , roundDoubleInteger
      -- ** Int results
    , properFractionDoubleInt
    , floorDoubleInt
    , ceilingDoubleInt
    , roundDoubleInt
      -- * Double/Int conversions, wrapped primops
    , double2Int
    , int2Double
      -- * Float methods
      -- ** Integer results
    , properFractionFloatInteger
    , truncateFloatInteger
    , floorFloatInteger
    , ceilingFloatInteger
    , roundFloatInteger
      -- ** Int results
    , properFractionFloatInt
    , floorFloatInt
    , ceilingFloatInt
    , roundFloatInt
      -- * Float/Int conversions, wrapped primops
    , float2Int
    , int2Float
    ) where

import GHC.Integer

import GHC.Base
import GHC.Num ()

#if WORD_SIZE_IN_BITS < 64

import GHC.IntWord64

#define TO64 integerToInt64
#define FROM64 int64ToInteger
#define MINUS64 minusInt64#
#define NEGATE64 negateInt64#

#else

#define TO64 integerToInt
#define FROM64 smallInteger
#define MINUS64 ( -# )
#define NEGATE64 negateInt#

uncheckedIShiftRA64# :: Int# -> Int# -> Int#
uncheckedIShiftRA64# = uncheckedIShiftRA#

uncheckedIShiftL64# :: Int# -> Int# -> Int#
uncheckedIShiftL64# = uncheckedIShiftL#

#endif
