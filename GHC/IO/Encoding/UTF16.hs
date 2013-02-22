{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE CPP
           , NoImplicitPrelude
           , BangPatterns
           , NondecreasingIndentation
           , MagicHash
  #-}
{-# OPTIONS_GHC  -funbox-strict-fields #-}

-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.IO.Encoding.UTF16
-- Copyright   :  (c) The University of Glasgow, 2009
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  libraries@haskell.org
-- Stability   :  internal
-- Portability :  non-portable
--
-- UTF-16 Codecs for the IO library
--
-- Portions Copyright   : (c) Tom Harper 2008-2009,
--                        (c) Bryan O'Sullivan 2009,
--                        (c) Duncan Coutts 2009
--
-----------------------------------------------------------------------------

module GHC.IO.Encoding.UTF16 (
  utf16, mkUTF16,
  utf16_decode,
  utf16_encode,

  utf16be, mkUTF16be,
  utf16be_decode,
  utf16be_encode,

  utf16le, mkUTF16le,
  utf16le_decode,
  utf16le_encode,
  ) where

import GHC.Base
import GHC.Real
import GHC.Num
-- import GHC.IO
import GHC.IO.Buffer
import GHC.IO.Encoding.Failure
import GHC.IO.Encoding.Types
import GHC.Word
import Data.Bits
import Data.Maybe
import GHC.IORef
