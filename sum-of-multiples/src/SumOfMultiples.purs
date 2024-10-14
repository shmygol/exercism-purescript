module SumOfMultiples
  ( sumOfMultiples
  ) where

import Prelude
import Data.Foldable (sum)
import Data.Set as Set
import Data.List.Lazy as List

energyMultiplies :: Int -> Int -> Set.Set Int
energyMultiplies level item = Set.fromFoldable
                              $ List.takeWhile (level > _)
                              $ List.iterate (item + _) item

sumOfMultiples :: Array Int -> Int -> Int
sumOfMultiples items level = sum
                             $ Set.unions
                             $ Set.map (energyMultiplies level)
                             $ Set.fromFoldable items
