import Core
import Functions
import System.Console.Haskeline
import System.Random
import Data.List


header = do
    putStrLn "MathMagic shell"
    putStrLn "A REPL calculator for non conventional arithmetic (vedic, trachtenberg, ...)"
    putStrLn "GNU 3.0 Licence (TODO)"
    putStrLn ""

main::IO()
main = do
    header
    putStrLn fromInteger $ calculate(Add (Number 1) (Subtract (Number 10) (Number 3)))
