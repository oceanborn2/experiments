module Functions where

import Data.Char

export isOdd isEven positive negative digits digitsum mymax mymin fib

-- is integer i odd?
isOdd::Integral->Bool
isOdd i =  i  `mod` 2 /= 0

-- is integer i even?
isEven::Integral->Bool
isEven i =  i  `mod` 2 == 0

positive::Integral->Bool
positive n = n >= 0

negative::Integral->Bool
negative n = n<0

-- inspired from: http://stackoverflow.com/questions/3963269/split-a-number-into-its-digits-with-haskell
digits::Integral x => x -> [x]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

-- calculate the digitsum of a given number
digitsum::Integral->Integral
digitsum n | n<0 = digitsum(-n)
digitsum n | n < 10 = n
digitsum n | otherwise = digitsum(sum(digits(n)))

-- calculate min and max of two integrals
mymax::Integral->Integral->Integral
mymax x y = if x>y then x else y

mymin::Integral->Integral->Integral
mymin x y = if x<y then x else y

-- fibonacci function (recursive version)
fib 0 = 1
fib 1 = 1
fib n = fib(n-1)+fib(n-2)




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

sumFrom1ToN::Integral->Integral
sumFrom1ToN n | n < 1 = sumFrom1ToN(-n)
sumFrom1ToN n | otherwise = n * (n + 1) `div` 2

myabs::Integral->Integral
myabs n | n == 0 = 0
myabs n | n > 0 = n
myabs n | otherwise = -1 * n

myabs2::Integral->Integral
myabs2 n = if n > 0 then n else -n


double::Integral->Integral
double x = 2 * x

fact::Integral->Integral
fact 0 = 1
fact n = n * fact(n-1)

{-product(x:xs)=
when
  case [] : 1
  case x:xs : x * product(xs)
-}

-- kaprekar number = x::Int | x*x =
--kaprekar::Int->Bool
--kaprekar x = x * x


divides::Integral->Integral->Bool
divides a b =
    a * b = round(a/b)*b



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