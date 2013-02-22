{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP, MagicHash, UnboxedTuples, NoImplicitPrelude #-}
{-# OPTIONS_GHC -O2 #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Float.ConversionUtils
-- Copyright   :  (c) Daniel Fischer 2010
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- Utilities for conversion between Double/Float and Rational
--
-----------------------------------------------------------------------------

#include "MachDeps.h"

-- #hide
module GHC.Float.ConversionUtils ( elimZerosInteger, elimZerosInt# ) where

import GHC.Base
import GHC.Integer
#if WORD_SIZE_IN_BITS < 64
import GHC.IntWord64
#endif
