\begin{code}
{-# LANGUAGE Unsafe #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , BangPatterns
           , MagicHash
           , UnboxedTuples
           , UnliftedFFITypes
           , ForeignFunctionInterface
           , DeriveDataTypeable
           , StandaloneDeriving
           , RankNTypes
           , PatternGuards
  #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_HADDOCK not-home #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Conc.Sync
-- Copyright   :  (c) The University of Glasgow, 1994-2002
-- License     :  see libraries/base/LICENSE
--
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC extensions)
--
-- Basic concurrency stuff.
--
-----------------------------------------------------------------------------

-- No: #hide, because bits of this module are exposed by the stm package.
-- However, we don't want this module to be the home location for the
-- bits it exports, we'd rather have Control.Concurrent and the other
-- higher level modules be the home.  Hence:

#include "Typeable.h"

-- #not-home
module GHC.Conc.Sync
        ( ThreadId(..)

        -- * Forking and suchlike
        , forkIO
        , forkIOWithUnmask
        , forkOn
        , forkOnWithUnmask
        , numCapabilities
        , getNumCapabilities
        , setNumCapabilities
        , getNumProcessors
        , numSparks
        , childHandler
        , myThreadId
        , killThread
        , throwTo
        , par
        , pseq
        , runSparks
        , yield
        , labelThread
        , mkWeakThreadId

        , ThreadStatus(..), BlockReason(..)
        , threadStatus
        , threadCapability

        -- * TVars
        , STM(..)
        , atomically
        , retry
        , orElse
        , throwSTM
        , catchSTM
        , alwaysSucceeds
        , always
        , TVar(..)
        , newTVar
        , newTVarIO
        , readTVar
        , readTVarIO
        , writeTVar
        , unsafeIOToSTM

        -- * Miscellaneous
        , withMVar
        , modifyMVar_

        , setUncaughtExceptionHandler
        , getUncaughtExceptionHandler

        , reportError, reportStackOverflow

        , sharedCAF
        ) where

import Foreign
import Foreign.C

#ifdef mingw32_HOST_OS
import Data.Typeable
#endif

#ifndef mingw32_HOST_OS
import Data.Dynamic
#endif
import Control.Monad
import Data.Maybe

import GHC.Base
import {-# SOURCE #-} GHC.IO.Handle ( hFlush )
import {-# SOURCE #-} GHC.IO.Handle.FD ( stdout )
import GHC.IO
import GHC.IO.Encoding.UTF8
import GHC.IO.Exception
import GHC.Exception
import qualified GHC.Foreign
import GHC.IORef
import GHC.MVar
import GHC.Ptr
import GHC.Real         ( fromIntegral )
import GHC.Show         ( Show(..), showString )
import GHC.Weak

infixr 0 `par`, `pseq`
\end{code}
