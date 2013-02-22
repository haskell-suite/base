\section[GHC.Base]{Module @GHC.Base@}

The overall structure of the GHC Prelude is a bit tricky.

  a) We want to avoid "orphan modules", i.e. ones with instance
        decls that don't belong either to a tycon or a class
        defined in the same module

  b) We want to avoid giant modules

So the rough structure is as follows, in (linearised) dependency order


GHC.Prim                Has no implementation.  It defines built-in things, and
                by importing it you bring them into scope.
                The source file is GHC.Prim.hi-boot, which is just
                copied to make GHC.Prim.hi

GHC.Base        Classes: Eq, Ord, Functor, Monad
                Types:   list, (), Int, Bool, Ordering, Char, String

Data.Tuple      Types: tuples, plus instances for GHC.Base classes

GHC.Show        Class: Show, plus instances for GHC.Base/GHC.Tup types

GHC.Enum        Class: Enum,  plus instances for GHC.Base/GHC.Tup types

Data.Maybe      Type: Maybe, plus instances for GHC.Base classes

GHC.List        List functions

GHC.Num         Class: Num, plus instances for Int
                Type:  Integer, plus instances for all classes so far (Eq, Ord, Num, Show)

                Integer is needed here because it is mentioned in the signature
                of 'fromInteger' in class Num

GHC.Real        Classes: Real, Integral, Fractional, RealFrac
                         plus instances for Int, Integer
                Types:  Ratio, Rational
                        plus intances for classes so far

                Rational is needed here because it is mentioned in the signature
                of 'toRational' in class Real

GHC.ST  The ST monad, instances and a few helper functions

Ix              Classes: Ix, plus instances for Int, Bool, Char, Integer, Ordering, tuples

GHC.Arr         Types: Array, MutableArray, MutableVar

                Arrays are used by a function in GHC.Float

GHC.Float       Classes: Floating, RealFloat
                Types:   Float, Double, plus instances of all classes so far

                This module contains everything to do with floating point.
                It is a big module (900 lines)
                With a bit of luck, many modules can be compiled without ever reading GHC.Float.hi


Other Prelude modules are much easier with fewer complex dependencies.

\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , BangPatterns
           , ExplicitForAll
           , MagicHash
           , UnboxedTuples
           , ExistentialQuantification
           , RankNTypes
  #-}
-- -fno-warn-orphans is needed for things like:
-- Orphan rule: "x# -# x#" ALWAYS forall x# :: Int# -# x# x# = 0
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_HADDOCK hide #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Base
-- Copyright   :  (c) The University of Glasgow, 1992-2002
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC extensions)
--
-- Basic data types and classes.
--
-----------------------------------------------------------------------------

#include "MachDeps.h"

-- #hide
module GHC.Base
        (
        module GHC.Base,
        module GHC.Classes,
        module GHC.CString,
        module GHC.Magic,
        module GHC.Types,
        module GHC.Prim,        -- Re-export GHC.Prim and GHC.Err, to avoid lots
        module GHC.Err          -- of people having to import it explicitly
  )
        where

import GHC.Types
import GHC.Classes
import GHC.CString
import GHC.Magic
import GHC.Prim
import {-# SOURCE #-} GHC.Err
import {-# SOURCE #-} GHC.IO (failIO)

-- This is not strictly speaking required by this module, but is an
-- implicit dependency whenever () or tuples are mentioned, so adding it
-- as an import here helps to get the dependencies right in the new
-- build system.
import GHC.Tuple ()
-- Likewise we need Integer when deriving things like Eq instances, and
-- this is a convenient place to force it to be built
import GHC.Integer ()

infixr 9  .
infixr 5  ++
infixl 4  <$
infixl 1  >>, >>=
infixr 0  $

default ()              -- Double isn't available yet
\end{code}

