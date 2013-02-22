{-# LANGUAGE Unsafe #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , BangPatterns
           , MagicHash
           , UnboxedTuples
  #-}
{-# OPTIONS_HADDOCK hide #-}
{-# LANGUAGE DeriveDataTypeable, StandaloneDeriving #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.ForeignPtr
-- Copyright   :  (c) The University of Glasgow, 1992-2003
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC extensions)
--
-- GHC's implementation of the 'ForeignPtr' data type.
-- 
-----------------------------------------------------------------------------

-- #hide
module GHC.ForeignPtr
  (
        ForeignPtr(..),
        ForeignPtrContents(..),
        FinalizerPtr,
        FinalizerEnvPtr,
        newForeignPtr_,
        mallocForeignPtr,
        mallocPlainForeignPtr,
        mallocForeignPtrBytes,
        mallocPlainForeignPtrBytes,
        mallocForeignPtrAlignedBytes,
        mallocPlainForeignPtrAlignedBytes,
        addForeignPtrFinalizer,
        addForeignPtrFinalizerEnv,
        touchForeignPtr,
        unsafeForeignPtrToPtr,
        castForeignPtr,
        newConcForeignPtr,
        addForeignPtrConcFinalizer,
        finalizeForeignPtr
  ) where

import Control.Monad    ( sequence_ )
import Foreign.Storable
import Data.Typeable

import GHC.Show
import GHC.List         ( null )
import GHC.Base
import GHC.IORef
import GHC.STRef        ( STRef(..) )
import GHC.Ptr          ( Ptr(..), FunPtr(..) )
import GHC.Err
