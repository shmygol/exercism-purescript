module Pangram
  ( isPangram
  ) where

import Prelude
import Data.Enum (enumFromTo)
import Data.String.CodeUnits (toCharArray)
import Data.String.Common (toLower)
import Data.Set as Set

isPangram :: String -> Boolean
isPangram = Set.subset alphabet
            <<< Set.fromFoldable
            <<< toCharArray
            <<< toLower
    where
        alphabet = Set.fromFoldable (enumFromTo 'a' 'z' :: Array Char)
