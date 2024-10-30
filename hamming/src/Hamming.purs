module Hamming
  ( distance
  ) where

import Prelude
import Data.Maybe
import Data.String (length)
import Data.String.CodeUnits (toCharArray)
import Data.Array (zipWith)
import Data.Foldable (sum)

distance :: String -> String -> Maybe Int
distance a b | length a /= length b = Nothing
             | otherwise = Just
                           $ sum
                           $ zipWith distanceForChars (toCharArray a) (toCharArray b)
  where
    distanceForChars :: Char -> Char -> Int
    distanceForChars x y | x == y = 0
                         | otherwise = 1
