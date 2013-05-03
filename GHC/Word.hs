{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP, NoImplicitPrelude, BangPatterns, MagicHash, UnboxedTuples #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Word
-- Copyright   :  (c) The University of Glasgow, 1997-2002
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- Sized unsigned integral types: 'Word', 'Word8', 'Word16', 'Word32', and
-- 'Word64'.
--
-----------------------------------------------------------------------------

#include "MachDeps.h"

-- #hide
module GHC.Word (
    Word(..), Word8(..), Word16(..), Word32(..), Word64(..),
    uncheckedShiftL64#,
    uncheckedShiftRL64#
    ) where

import Data.Bits
import Data.Maybe

#if WORD_SIZE_IN_BITS < 64
import GHC.IntWord64
#endif

import GHC.Base
import GHC.Enum
import GHC.Num
import GHC.Real
import GHC.Read
import GHC.Arr
import GHC.Show
import GHC.Err
import GHC.Float ()     -- for RealFrac methods

------------------------------------------------------------------------
-- type Word8
------------------------------------------------------------------------

-- Word8 is represented in the same way as Word. Operations may assume
-- and must ensure that it holds only values from its logical range.

data {-# CTYPE "HsWord8" #-} Word8 = W8# Word# deriving (Eq, Ord)
-- ^ 8-bit unsigned integer type

