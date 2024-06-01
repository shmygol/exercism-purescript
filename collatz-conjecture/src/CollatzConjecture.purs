module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.Either (Either(Left, Right), hush)
import Data.Int (even)

collatz :: Int -> Maybe Int
collatz = hush <<< verboseCollatz 

newtype Error = Error String

error :: forall a. String -> Either Error a
error = Left <<< Error

verboseCollatz :: Int -> Either Error Int
verboseCollatz = recursiveCollatz 0
  where
    recursiveCollatz counter x
      | x < 1 = error "x must be greater than 0"
      | x == 1 = Right counter
      | otherwise =
        recursiveCollatz 
          (counter + 1)
          if even x then (x / 2) else (x * 3 + 1)
  
