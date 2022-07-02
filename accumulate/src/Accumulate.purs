module Accumulate
  ( accumulate
  ) where

import Prelude
import Data.List
import Data.Maybe
import Data.List.NonEmpty (fromList, head, tail) as NonEmptyList

accumulate :: forall a b. (a -> b) -> List a -> List b
accumulate operation =
    case _ of
        Nothing -> Nil
        Just nonEmptyCollection ->
            (operation $ NonEmptyList.head nonEmptyCollection)
            : (accumulate operation $ NonEmptyList.tail nonEmptyCollection)
    <<< NonEmptyList.fromList
