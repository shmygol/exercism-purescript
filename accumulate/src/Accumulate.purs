module Accumulate
  ( accumulate
  ) where

import Prelude
import Data.List (List)

accumulate :: forall a b. (a -> b) -> List a -> List b
accumulate = map
