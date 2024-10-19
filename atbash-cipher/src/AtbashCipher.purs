module AtbashCipher
  ( decode
  , encode
  ) where

import Prelude
import Data.Maybe
import Data.Enum (enumFromTo)
import Data.String.Common as String
import Data.String.CodeUnits as String
import Data.Array (zip)
import Data.Foldable (and)
import Data.Map as Map

vocabularies :: { encode :: Map.Map Char Char, decode :: Map.Map Char Char }
vocabularies = let enumAsc = enumFromTo 'a' 'z'
                   enumDesc =  enumFromTo 'z' 'a' in
               {
                 encode: Map.fromFoldable (zip enumAsc enumDesc),
                 decode: Map.fromFoldable (zip enumDesc enumAsc)
               }

isDigit :: Char -> Boolean
isDigit = and <<< flap [(_ >= '0'), (_ <= '9')]

mapChar :: Map.Map Char Char -> Char -> String
mapChar vocab c | isDigit c = String.singleton c
                | otherwise = maybe "" String.singleton $ Map.lookup c vocab

mapStringWith :: Map.Map Char Char -> (String -> Int -> String) -> String -> String
mapStringWith vocab f = String.trim
                        <<< mapStringWith' 0 ""
                        <<< String.uncons
                        <<< String.toLower
    where
        mapStringWith' :: Int -> String -> Maybe { head :: Char, tail :: String } -> String
        mapStringWith' _ acc Nothing = acc
        mapStringWith' i acc (Just { head, tail }) =
          case mapChar vocab head of
            "" -> mapStringWith' i acc (String.uncons tail)
            mappedString -> mapStringWith' (i + 1) (append acc (f mappedString i)) (String.uncons tail) 

decode :: String -> Maybe String
decode = Just <<< mapStringWith vocabularies.decode const

encode :: String -> Maybe String
encode = Just <<< mapStringWith vocabularies.encode prependSeparator
    where
        prependSeparator :: String -> Int -> String
        prependSeparator s i | i `mod` 5 == 0 = " " <> s
                             | otherwise = s
