module Core where

-- Arithmetic system
data ArithSystem = Classic | Vedic | Trachtenberg deriving Show

-- Algorithm description
data Algo = Algo {
    name::String,
    arithSys::ArithSystem
} deriving Show

-- supported operators
data Operator = PLUS | MINUS | MULTIPLY | DIVIDE deriving Show
--data Operator = '+' | '-' | '*' | '/'

-- Arithmetic problem description
data Problem = Problem {
  op1,op2::Integer,
  oper::Operator
} deriving Show



    


--data Expression = Expression op::Num |   op1::Num Operator Num op2



