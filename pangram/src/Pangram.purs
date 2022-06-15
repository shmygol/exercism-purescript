module Pangram
  ( isPangram
  ) where

import Prelude
import Data.String.CodeUnits (toCharArray)
import Data.String.Common (toLower)
import Data.Set as Set

isPangram :: String -> Boolean
isPangram = Set.subset alphabet
            <<< Set.fromFoldable
            <<< toCharArray
            <<< toLower
    where
        alphabet = Set.fromFoldable ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                                     'i', 'g', 'k', 'l', 'm', 'n', 'o', 'p',
                                     'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                                     'y', 'z']
