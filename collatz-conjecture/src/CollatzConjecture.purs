module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.Int (even)

collatz :: Int -> Maybe Int
collatz = recursive_collatz 0
  where
    recursive_collatz counter x
      | x < 1 = Nothing
      | x == 1 = Just counter
      | otherwise =
        recursive_collatz 
          (counter + 1)
          if even x then (x / 2) else (x * 3 + 1)
  
