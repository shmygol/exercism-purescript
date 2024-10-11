module Isogram
  ( isIsogram
  ) where

import Prelude
import Data.Enum (enumFromTo)
import Data.List as List
import Data.List ((:))
import Data.Maybe
import Data.String.CodeUnits (toCharArray)
import Data.String.Common (toLower)
import Data.Set as Set

isIsogram :: String -> Boolean
isIsogram = isIsogram' Set.empty
            <<< List.fromFoldable
            <<< toCharArray
            <<< toLower
    where
        alphabet = Set.fromFoldable (enumFromTo 'a' 'z' :: Array Char)
        isIsogram' :: Set.Set Char -> List.List Char -> Boolean
        isIsogram' visited List.Nil = true
        isIsogram' visited (cur:tail)
            | not $ Set.member cur alphabet = isIsogram' visited tail
            | not $ Set.member cur visited = isIsogram' (Set.insert cur visited) tail
            | otherwise = false