module Maths where

import Functions

prime:Int- >Bool
prime n | n < 0 = prime(-n)
prime n | n < 4 = Just True
prime n | otherwise =
    let dig = digits(n),
        l=length(dig),
        lastDig =dig[l]

    let isOdd = digitSum(n)=3
        | Math.sqrt(n)
prime n | n >= 0 and n < 4  = Just True
prime n | n
prime n | otherwise = Just False

