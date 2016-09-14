module Functions (isOdd, isEven, positive, negative, digits, digitsum, mymax, mymin, fib) where

import Data.Char

-- is integer i odd?
isOdd::Integer->Bool  -- Integral x =>Bool
isOdd i =  i  `mod` 2 /= 0

isOdd2::Integer->Bool
isOdd2 i = i `mod` 2 /=0

-- is integer i even?
isEven::Integer->Bool
isEven i =  i  `mod` 2 == 0

positive::Integer->Bool
positive n = n >= 0

negative::Integer->Bool
negative n = n<0

-- inspired from: e
digits::Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

-- calculate the digitsum of a given number
digitsum::Integer->Integer
digitsum n | n<0 = digitsum(-n)
digitsum n | n < 10 = n
digitsum n | otherwise = digitsum(sum(digits(n)))

-- calculate min and max of two Integers
mymax::Integer->Integer->Integer
mymax x y = if x>y then x else y

mymin::Integer->Integer->Integer
mymin x y = if x<y then x else y

-- fibonacci function (recursive version)
fib 0 = 1
fib 1 = 1
fib n = fib(n-1)+fib(n-2)

sumFrom1ToN::Integer->Integer
sumFrom1ToN n | n < 1 = sumFrom1ToN(-n)
sumFrom1ToN n | otherwise = n * (n + 1) `div` 2

myabs::Integer->Integer
myabs n | n == 0 = 0
myabs n | n > 0 = n
myabs n | otherwise = -1 * n

myabs2::Integer->Integer
myabs2 n = if n > 0 then n else -n


double::Integer->Integer
double x = 2 * x

fact::Integer->Integer
fact 0 = 1
fact n = n * fact(n-1)

{-prime::Int->Bool
prime n | n < 0 = prime(-n)
prime n | n < 4 = Just True
prime n | otherwise =
    let dig = digits(n)
        l=length(dig)
        lastDig =dig[l]

    let isOdd = digitSum(n)=3
        | Math.sqrt(n)

prime n | n >= 0 and n < 4  = Just True
prime n | n
prime n | otherwise = Just False
-}

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



{-product(x:xs)=
when
  case [] : 1
  case x:xs : x * product(xs)
-}

-- kaprekar number = x::Int | x*x =
--kaprekar::Int->Bool
--kaprekar x = x * x


--divides::Integer->Integer->Bool
--divides a b = a `mod` b > 0

{-

sqrt 3 3

while
sqrt::Num->Num->Num
sqrt a xold =
    let
        epsilon=0.001,
        delta = Math.abs(x-xold)
    in
        if delta > epsilon then

            return sqrt((x+ xold)
        else
            return x

public static double sqrtNewton(double a, double eps){
double xold, x = a;
do{
    // recopie de la valeur ancienne
    xold = x;
    // calcul de la nouvelle valeur
    x = (xold+a/xold)/2;
    System.out.println(x);
} while(Math.abs(x-xold) > eps);
return x;
}

-}

