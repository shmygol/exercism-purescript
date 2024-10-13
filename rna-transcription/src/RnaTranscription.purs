module RnaTranscription
  ( toRNA
  ) where

import Prelude
import Data.Maybe
import Data.Array (foldl)
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
toRNA = foldl foldingFunction (Just "")
        <<< String.toCharArray
    where
        foldingFunction :: Maybe String -> Char -> Maybe String
        foldingFunction acc a = sonc <$> (transcript a) <*> acc
        sonc :: Char -> String -> String
        sonc c s = s <> String.singleton c
