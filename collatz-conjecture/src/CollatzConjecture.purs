module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.Int (even)

collatz :: Int -> Maybe Int
collatz = recursive_collatz (Just 0)
  where
    incr = map $ add 1
    recursive_collatz maybe_counter x
      | x < 1 = Nothing
      | x == 1 = maybe_counter
      | otherwise =
        recursive_collatz 
          (incr maybe_counter)
          if even x then (x / 2) else (x * 3 + 1)
  
