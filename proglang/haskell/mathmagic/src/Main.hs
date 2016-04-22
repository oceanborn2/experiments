--import Core

import Functions {- (isOdd, isEven) -}
import System.Console.Haskeline
import System.Random
import Data.List

header = do
    putStrLn "MathMagic shell"
    putStrLn "A REPL calculator for non conventional arithmetic (vedic, trachtenberg, ...)"
    putStrLn "GNU 3.0 Licence (TODO)"
    putStrLn ""

testOddEven = do
    --putStrLn (show(isOdd(1)))
    print(isOdd(1))
    print(isOdd(2))
    print(isEven(1))
    print(isEven(2))

testdigits = do
    let x=digits(12345521312)
    print (x)

testdigitsums(xs) = do
    -- calculate the digitsum of numbers from 1 to 100
    let ds = map (digitsum) xs --[1..100] --oneToHundred;
    print("digitsums:" ++ (show ds))
    --map (print ((show x)++ "==>" ++ (show digitsum(x)))) [1..100]

testsum(xs) = do
    -- calculate the sum
    --print("sum:", (show sm), " = ", (show sm2), " /= ", (show df))  -- ++ (show sm)++ " " ++ (show sm2))
    --df
    let sm1=sum(xs)
    let sm2=map(+) xs
    let dif=map(-) xs
    --let msg=intercalate(["sum:", (show sm1), " = ", (show sm2), " /= ", (show dif)])
    --let msg=concat(map (show)("sum:",sm1, " = ",sm2," /= ",dif))
    --let msg=map (show) [sm1,sm2,dif]
    print("")

main::IO()
main = do
    header
    let oneToHundred = [1..100]
    testOddEven
    testdigits
    testsum(oneToHundred)
    testdigitsums(oneToHundred)
--    print (show res)
--    print ""
--    print (show [1..1001])
    --print (show [1..1001])
    --print(show res)


