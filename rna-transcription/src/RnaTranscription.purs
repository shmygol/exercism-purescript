module RnaTranscription
  ( toRNA
  ) where

import Prelude
import Data.Maybe (Maybe)
import Data.Traversable (traverse)
import Data.Map as Map
import Data.String.CodeUnits as String
import Data.Tuple (Tuple(..))

rules :: Map.Map Char Char
rules = Map.fromFoldable [(Tuple 'G' 'C'),
                          (Tuple 'C' 'G'),
                          (Tuple 'T' 'A'),
                          (Tuple 'A' 'U')]

transcript :: Char -> Maybe Char
transcript = Map.lookup <@> rules

toRNA :: String -> Maybe String
toRNA = map String.fromCharArray
        <<< traverse transcript
        <<< String.toCharArray
