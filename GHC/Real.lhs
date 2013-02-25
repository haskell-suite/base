\begin{code}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP, NoImplicitPrelude, MagicHash, UnboxedTuples, BangPatterns #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_HADDOCK hide #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Real
-- Copyright   :  (c) The University of Glasgow, 1994-2002
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- The types 'Ratio' and 'Rational', and the classes 'Real', 'Fractional',
-- 'Integral', and 'RealFrac'.
--
-----------------------------------------------------------------------------

-- #hide
module GHC.Real where

import GHC.Base
import GHC.Num
import GHC.List
import GHC.Enum
import GHC.Show
import GHC.Err

#ifdef OPTIMISE_INTEGER_GCD_LCM
import GHC.Integer.GMP.Internals
#endif

infixr 8  ^, ^^
infixl 7  /, `quot`, `rem`, `div`, `mod`
infixl 7  %

default ()              -- Double isn't available yet,
                        -- and we shouldn't be using defaults anyway
\end{code}
