module Bob
  ( hey
  ) where

import Prelude
import Data.Maybe
import Data.String.CodeUnits (toCharArray) as String
import Data.String.Common (trim) as String
import Data.Enum (enumFromTo)
import Data.Array.NonEmpty (NonEmptyArray, intersect, last, fromArray) as NonEmptyA
import Data.Array (null)

hey :: String -> String
hey = case _ of
          Nothing -> "Fine. Be that way!"
          Just(sentenceChars) | isYelledQuestion sentenceChars -> "Calm down, I know what I'm doing!"
                              | isYelling sentenceChars -> "Whoa, chill out!"
                              | isQuestion sentenceChars -> "Sure."
                              | otherwise -> "Whatever."
      <<< NonEmptyA.fromArray
      <<< String.toCharArray
      <<< String.trim
    where
        lowerChars :: NonEmptyA.NonEmptyArray Char
        lowerChars = enumFromTo 'a' 'z'

        upperChars :: NonEmptyA.NonEmptyArray Char
        upperChars = enumFromTo 'A' 'Z'

        isYelling :: NonEmptyA.NonEmptyArray Char -> Boolean
        isYelling inputChars =
            (null $ NonEmptyA.intersect inputChars lowerChars)
            && (not $ null $ NonEmptyA.intersect inputChars upperChars)

        isQuestion :: NonEmptyA.NonEmptyArray Char -> Boolean
        isQuestion inputChars = NonEmptyA.last inputChars == '?'

        isYelledQuestion :: NonEmptyA.NonEmptyArray Char -> Boolean
        isYelledQuestion inputChars = (isYelling inputChars) && (isQuestion inputChars)
