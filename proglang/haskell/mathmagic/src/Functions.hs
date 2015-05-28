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

mysum::[Int]->MayBe Int
mysum i = case i of
    match [] => Nothing
    [xs] => xs
    [xs:x] => foldl 0 xs+mysum(x)


--mymin::[Int]->Int
--mymin [x, y] = mymin x y

--ackerman::Int->Int->Int
--ackerman n m | m==0 = n+1
--ackerman n m | n== 0 && m>0 = ackerman(m-1,1)
--ackerman n m | m>0   && n>0 = ackerman(m-1,ackerman(m,n-1))



{-splitInt::Int->[Char]
splitInt | i==1 => []
splitInt i
    case i of
        1 => 10
    else [i]++splitInt i `div` 10
-}

--digitsum::Int->[Char]
--digitsum x = do

