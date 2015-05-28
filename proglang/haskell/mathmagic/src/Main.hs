import Core
import Functions {- (isOdd, isEven) -}


import System.Console.Haskeline
import System.Random

header = do
    putStrLn "MathMagic shell"
    putStrLn "Pascal Munerot"
    putStrLn ""

main::IO()
main = do
    header

    --putStrLn (show(isOdd(1)))
    print(isOdd(1))
    print(isOdd(2))
    print(isEven(1))
    print(isEven(2))

    let s = 1
    print(show s) --digitsum s) --putStrLn(show s)



