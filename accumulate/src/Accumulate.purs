module Accumulate
  ( accumulate
  ) where

import Prelude
import Data.List
import Data.List.NonEmpty (fromList, head, tail) as NonEmptyList
import Data.Maybe (maybe)

accumulate :: forall a b. (a -> b) -> List a -> List b
accumulate operation =
    maybe
        Nil
        (\nonEmptyCollection ->
            Cons
                (operation $ NonEmptyList.head nonEmptyCollection)
                (accumulate operation $ NonEmptyList.tail nonEmptyCollection))
    <<< NonEmptyList.fromList
