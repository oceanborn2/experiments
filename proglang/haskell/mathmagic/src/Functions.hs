module Functions where

import Data.Char

--export isOdd isEven

-- is integer i odd?
isOdd::Int->Bool
isOdd i =  i  `mod` 2 /= 0

-- is integer i even?
isEven::Int->Bool
isEven i =  i  `mod` 2 == 0

mymax::Int->Int->Int
mymax x y = if x>y then x else y

mymin::Int->Int->Int
mymin x y = if x<y then x else y

{-mysum::[Int]->MayBe Int
mysum i = case i of
    match [] => Nothing
    [xs] => xs
    [xs:x] => foldl 0 xs+mysum(x)

-}

--mymin::[Int]->Int
--mymin [x, y] = mymin x y

--ackerman::Int->Int->Int
--ackerman n m | m==0 = n+1
--ackerman n m | n== 0 && m>0 = ackerman(m-1,1)
--ackerman n m | m>0   && n>0 = ackerman(m-1,ackerman(m,n-1))

-- inspired from: http://stackoverflow.com/questions/3963269/split-a-number-into-its-digits-with-haskell
digits::Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

-- calculate the digitsum of a given number
-- => Integral->Integral
digitsum::Int->Int
digitsum n | n < 10 = n
digitsum n | otherwise = digitsum(sum(digits(n)))

sumFrom1ToN::Int->Int
sumFrom1ToN n | n < 1 = sumFrom1ToN(-n)
sumFrom1ToN n | otherwise = n * (n + 1) `div` 2

myabs::Int->Int
myabs n | n == 0 = 0
myabs n | n > 0 = n
myabs n | otherwise = -1 * n

myabs2::Int->Int
myabs2 n = if n > 0 then n else -n

positive::Int->Bool
--positive n = if n >= 0 then True else False
positive n = n >= 0

negative::Int->Bool
negative n = n<0
