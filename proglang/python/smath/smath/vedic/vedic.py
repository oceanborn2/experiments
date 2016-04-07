from smath.core import Subtraction, multipleOf10, getDigits
from smath.vedic import Vedic

class AllFromNineAndLastFromTen(Vedic):
    
    def applicable(self, expression):
        if (not isinstance(expression, Subtraction)):
            return False
        return multipleOf10(expression.loper) and expression.loper > expression.roper
    
    def apply(self, expression):
        (lopers, loperi, loperd) = getDigits(expression._loper)
        (ropers, roperi, roperd) = getDigits(expression._roper)
        l = len(roperd)
        c = l - len(roperd)
        for x in range(0,c):
            roperd.insert(0, 0)
        print("roperd:" + roperd.__str__())
            
                
