\begin{code}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , MagicHash
           , UnboxedTuples
           , ForeignFunctionInterface
  #-}
-- We believe we could deorphan this module, by moving lots of things
-- around, but we haven't got there yet:
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Float
-- Copyright   :  (c) The University of Glasgow 1994-2002
--                Portions obtained from hbc (c) Lennart Augusstson
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- The types 'Float' and 'Double', and the classes 'Floating' and 'RealFloat'.
--
-----------------------------------------------------------------------------

#include "ieee-flpt.h"

-- #hide
module GHC.Float( module GHC.Float, Float(..), Double(..), Float#, Double#
                , double2Int, int2Double, float2Int, int2Float )
    where

import Data.Maybe

import Data.Bits
import GHC.Base
import GHC.List
import GHC.Enum
import GHC.Show
import GHC.Num
import GHC.Real
import GHC.Arr
import GHC.Float.RealFracMethods
import GHC.Float.ConversionUtils
import GHC.Integer.Logarithms ( integerLogBase# )
import GHC.Integer.Logarithms.Internals

infixr 8  **
\end{code}
