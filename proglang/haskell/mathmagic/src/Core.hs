module Core where

-- enumeration of arithmetic systems

data Algo = name::Str
	
data ARITH_SYSTEMS = CLASSIC | VEDIC | TRACHTENBERG

-- supported operators
data Operator = PLUS | MINUS | MULTIPLY | DIVIDE


data Expression =
    Num op |
    Num op1 Operator op Num op2




