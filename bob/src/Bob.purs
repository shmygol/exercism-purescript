module Bob
  ( hey
  ) where

import Prelude
import Data.String.CodeUnits (toCharArray) as String
import Data.String.Common (trim) as String
import Data.Enum (enumFromTo)
import Data.Array.NonEmpty (NonEmptyArray, intersect, last, fromArray)
import Data.Maybe (maybe)
import Data.Array (null)

hey :: String -> String
hey = maybeSilance
          "Fine. Be that way!"
          case _ of
              sentenceChars | isYelledQuestion sentenceChars -> "Calm down, I know what I'm doing!"
                            | isYelling sentenceChars -> "Whoa, chill out!"
                            | isQuestion sentenceChars -> "Sure."
                            | otherwise -> "Whatever."
      <<< String.toCharArray
      <<< String.trim
    where
        maybeSilance :: String -> (NonEmptyArray Char -> String) -> Array Char -> String
        maybeSilance answerToSilance f = maybe answerToSilance f <<< fromArray

        lowerChars :: NonEmptyArray Char
        lowerChars = enumFromTo 'a' 'z'

        upperChars :: NonEmptyArray Char
        upperChars = enumFromTo 'A' 'Z'

        isYelling :: NonEmptyArray Char -> Boolean
        isYelling inputChars =
            (null $ intersect inputChars lowerChars)
            && (not $ null $ intersect inputChars upperChars)

        isQuestion :: NonEmptyArray Char -> Boolean
        isQuestion inputChars = last inputChars == '?'

        isYelledQuestion :: NonEmptyArray Char -> Boolean
        isYelledQuestion inputChars = (isYelling inputChars) && (isQuestion inputChars)
