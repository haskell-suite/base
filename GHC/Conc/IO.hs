{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , MagicHash
           , UnboxedTuples
           , ForeignFunctionInterface
  #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_HADDOCK not-home #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Conc.IO
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
module GHC.Conc.IO
        ( ensureIOManagerIsRunning
        , ioManagerCapabilitiesChanged

        -- * Waiting
        , threadDelay
        , registerDelay
        , threadWaitRead
        , threadWaitWrite
        , threadWaitReadSTM
        , threadWaitWriteSTM
        , closeFdWith

#ifdef mingw32_HOST_OS
        , asyncRead
        , asyncWrite
        , asyncDoProc

        , asyncReadBA
        , asyncWriteBA

        , ConsoleEvent(..)
        , win32ConsoleHandler
        , toWin32ConsoleEvent
#endif
        ) where

import Foreign
import GHC.Base
import GHC.Conc.Sync as Sync
import GHC.Real ( fromIntegral )
import System.Posix.Types

#ifdef mingw32_HOST_OS
import qualified GHC.Conc.Windows as Windows
import GHC.Conc.Windows (asyncRead, asyncWrite, asyncDoProc, asyncReadBA,
                         asyncWriteBA, ConsoleEvent(..), win32ConsoleHandler,
                         toWin32ConsoleEvent)
#else
import qualified GHC.Event.Thread as Event
#endif
