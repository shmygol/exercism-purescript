module DifferenceOfSquares
  ( differenceOfSquares
  , squareOfSum
  , sumOfSquares
  ) where


import Prelude
import Math (pow)
import Data.Int (toNumber, floor)

differenceOfSquares :: Int -> Int
differenceOfSquares n = (squareOfSum n) - (sumOfSquares n)

squareOfSum :: Int -> Int
squareOfSum = floor <<< squareOfSumNumber <<< toNumber
  where
    squareOfSumNumber n = pow <@> 2.0
                          $ (n / 2.0) * (n + 1.0)

sumOfSquares :: Int -> Int
sumOfSquares = floor <<< sumOfSquaresNumber <<< toNumber
  where
    sumOfSquaresNumber n = (pow n 3.0) / 3.0
                           + (pow n 2.0) / 2.0
                           + n / 6.0
