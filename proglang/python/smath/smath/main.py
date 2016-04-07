from smath.core import Addition, Square, Subtraction, Multiplication, Division, \
    digitSum, getDigits, firstDigit
from smath.core.exceptions import WrongResult
from smath.vedic.vedic import AllFromNineAndLastFromTen

def test_digitsum(number, expected):
    r = digitSum(number)
    if (r != expected):
        raise WrongResult("wrong result: %d => %d <> %d" % (number, r, expected))
    print("digitsum: %d => %d" % (number, r))
    
def test_getdigits(number, expected, bpos, epos):
    (s, r, d) = getDigits(number, bpos, epos)
    if (s != expected):
        raise WrongResult("wrong result: %d => %d <> %s" % (number, r, expected))
    print("getdigits: %s => %s" % (number, s))        
        
def test_getfirstdigit(number, expected):
    (s, r, d) = firstDigit(number)
    if (s != expected):
        raise WrongResult("wrong result: %d => %d <> %s" % (number, r, expected))
    print("getfirstdigit: %s => %s" % (number, s))        
    
        
if __name__ == '__main__':
    ex1 = Addition(2, 3)
    print("ex1:" + ex1.__str__())
    
    ex2 = Square(25)
    print("ex2:" + ex2.__str__())
    
    ex3 = Subtraction(100, 81)
    print("ex3:" + ex3.__str__())
    AllFromNineAndLastFromTen().apply(ex3)
    
    ex4 = Subtraction(100, Multiplication(3, Division(7, 5)))
    print("ex4:" + ex4.__str__())

    test_digitsum(18278128253, 2)
    test_digitsum(12637137321, 9)
    
    test_getdigits(1234567890, "12", 1, 2)
    test_getfirstdigit(1234567890, "1")
    
