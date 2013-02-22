\begin{code}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE NoImplicitPrelude, BangPatterns, MagicHash #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Enum
-- Copyright   :  (c) The University of Glasgow, 1992-2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC extensions)
--
-- The 'Enum' and 'Bounded' classes.
-- 
-----------------------------------------------------------------------------

-- #hide
module GHC.Enum(
        Bounded(..), Enum(..),
        boundedEnumFrom, boundedEnumFromThen,
        toEnumError, fromEnumError, succError, predError,

        -- Instances for Bounded and Enum: (), Char, Int

   ) where

import GHC.Base
import GHC.Char
import GHC.Integer
import GHC.Num
import GHC.Show
default ()              -- Double isn't available yet
\end{code}
