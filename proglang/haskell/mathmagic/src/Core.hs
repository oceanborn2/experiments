module Core where

-- Arithmetic system
data ArithSystem = Classic | Vedic | Trachtenberg deriving (Eq, Ord, Show)

-- Algorithm description
data Algo = Algo {
    algName::String,
    algArit::ArithSystem
}  deriving (Eq, Ord, Show)

-- supported operators
data Operator = PLUS | MINUS | MULTIPLY | DIVIDE  deriving (Eq, Ord, Show)
--data Operator = '+' | '-' | '*' | '/'

-- Expression
--data Number = Number Int
data Expression = 
    Number Int | 
    Add Expression Expression |
    Subtract Expression Expression |
    Multiply Expression Expression |
    Divide Expression Expression deriving (Eq, Ord, Show)

-- Arithmetic problem description
data Problem = Problem {
    pbText:: String,
    pbComment::String,
    pbExpr:: Expression
} deriving (Eq, Ord, Show)

-- Solution to an arithmetic problem
data Solution = Solution {
    solArit:: ArithSystem
}  deriving (Eq, Ord, Show)


calculate::Expression->Int
calculate (Number n) = n
calculate (Add x y) = calculate (x) + calculate(y)
calculate (Subtract x y) = calculate (x) - calculate(y)
calculate (Multiply x y) = calculate (x) * calculate(y)
calculate (Divide x y) = calculate (x) `div` calculate(y)
