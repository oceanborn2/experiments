import System.Console.Haskeline
import System.Random
import Data.List
import Data.String

main::IO() 
main = 
    let bic = "BNPA FR PP XXX" in
    let iban = "FR7630004013130000059136876" in 
    let codeBanque = take 5  (drop 4  iban) in
    let codeAgence = take 5  (drop 9  iban) in 
    let numCompte =  take 11 (drop 14 iban) in
    do
        putStrLn ("BIC            : " ++ bic)
        putStrLn ("IBAN           : " ++ iban)
        putStrLn ("Code Banque    : " ++ codeBanque)
        putStrLn ("Code codeAgence: " ++ codeAgence)
        putStrLn ("NumCompte      : " ++ numCompte)        
