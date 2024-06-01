module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.Either (Either(Left, Right), hush)
import Data.Int (even)

collatz :: Int -> Maybe Int
collatz = hush <<< verbose_collatz 

newtype Error = Error String

error :: forall a. String -> Either Error a
error = Left <<< Error

verbose_collatz :: Int -> Either Error Int
verbose_collatz = recursive_collatz 0
  where
    recursive_collatz counter x
      | x < 1 = error "x must be greater than 0"
      | x == 1 = Right counter
      | otherwise =
        recursive_collatz 
          (counter + 1)
          if even x then (x / 2) else (x * 3 + 1)
  
