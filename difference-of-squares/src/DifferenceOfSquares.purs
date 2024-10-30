module DifferenceOfSquares
  ( differenceOfSquares
  , squareOfSum
  , sumOfSquares
  ) where


import Prelude
import Data.Foldable (sum)
import Data.Array (range)
import Data.Int (pow)

square :: Int -> Int
square = flip pow 2

differenceOfSquares :: Int -> Int
differenceOfSquares n = (squareOfSum n) - (sumOfSquares n)

squareOfSum :: Int -> Int
squareOfSum = square <<< sum <<< range 1

sumOfSquares :: Int -> Int
sumOfSquares = sum <<< map square <<< range 1
