import System.Environment (getArgs)
import Data.Char (toLower)

main :: IO ()
main = do
  [digits] <- getArgs
  dict <- words <$> readFile "/usr/share/dict/words"
  print (filter (digits `canSpell`) dict)

canSpell :: String -> String -> Bool
canSpell digits word | length word /= length digits = False
canSpell digits word = all match (zip digits word)
  where
    match ('2', c) = c `oneOf` "abc"
    match ('3', c) = c `oneOf` "def"
    match ('4', c) = c `oneOf` "ghi"
    match ('5', c) = c `oneOf` "jkl"
    match ('6', c) = c `oneOf` "mno"
    match ('7', c) = c `oneOf` "pqrs"
    match ('8', c) = c `oneOf` "tuv"
    match ('9', c) = c `oneOf` "wxyz"
    match _ = False
    oneOf x xs = toLower x `elem` xs
