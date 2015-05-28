module Maths where


double::Int->Int
double x = 2 * x

--double2::Num->Num
--double2 x = 2 * x

fib 0 = 1
fib 1 = 1
fib n = fib(n-1)+fib(n-2)

--PutStrln(fib(4))
fact::Int->Int
fact 0 = 1
fact n = n * fact(n-1)

{-product(x:xs)=
when
  case [] : 1
  case x:xs : x * product(xs)
-}

data Project_Status = Vision | Inception | Implementation

class T where
  value::String
deriving (Show)

divides::Int->Int->Bool
divides a b =
    a * b = round(a/b)*b

prime:Int- >Bool
prime n | n >= 0 and n < 4  = Just True
prime n | n
prime n | otherwise = Just False

-- kaprekar number = x::Int | x*x =
--kaprekar::Int->Bool
--kaprekar x = x * x


