from functools import reduce

class CalcSystem:

    def __init__(self):
        pass  
    
    def applicable(self, expression):
        pass
    
    def apply(self, params):
        pass

class Expression:
    def __init__(self, fcheck):
        self._fcheck = fcheck
    
    def apply(self):
        pass
    

class UnaryExpression(Expression):
    def __init__(self, oper, operator, fcheck):
        Expression.__init__(self, fcheck)
        self._oper = oper
        self._operator = operator

    def check(self, r):
        res = self._fcheck(self._oper, r)
        if (not res):
            raise "wrong result found: %s%d <> %d" % (self._oper, self._operator, r)

    def __str__(self):
        return "(" + self._operator + self._oper.__str__() + ")"
        
class BinaryExpression(Expression):
    def __init__(self, loper, operator, roper, fcheck):
        Expression.__init__(self, fcheck)
        self._loper = loper
        self._roper = roper
        self._operator = operator
        
    def check(self, r):
        res = self._fcheck(self._loper, self._roper, r)
        if (not res):
            raise "wrong result found: %d %s %d <> %d" % (self._loper, self._operator, self._roper, r)

    def __str__(self):
        return "(" + self._loper.__str__() + self._operator + self._roper.__str__() + ")"
        

class Addition(BinaryExpression):
    def __init__(self, loper, roper):
        BinaryExpression.__init__(self, loper, '+', roper, lambda x, y, r:x + y == r)
        
class Subtraction(BinaryExpression):
    def __init__(self, loper, roper):
        BinaryExpression.__init__(self, loper, '-', roper, lambda x, y, r:x - y == r)
        
class Multiplication(BinaryExpression):
    def __init__(self, loper, roper):
        BinaryExpression.__init__(self, loper, '*', roper, lambda x, y, r: x * y == r)
        
class Division(BinaryExpression):
    def __init__(self, loper, roper):
        BinaryExpression.__init__(self, loper, '/', roper, lambda x, y, r: x / y == r)
        
class Square(Multiplication):
    def __init__(self, loper):
        Multiplication.__init__(self, loper, loper)

def digitsToNumber(digits):
    return reduce(lambda a,d: 10*a+d, digits, 0)
    
def digitSum(number):
    print("in digitsum: %d" % number)
    ds = reduce(lambda x,y: x+y, [ord(n)-48 for n in number.__str__()])
    if (ds>9):
        return digitSum(ds) # modulo 9?
    return ds

def getDigits(number, bpos=1, epos=None):
    if (not isinstance(number, str)):
        number = str(number)
    if (epos is None):
        epos = len(number)
    number=number[bpos-1:epos]
    digits = [ord(n)-48 for n in number]
    return (number, reduce(lambda a,d: 10*a+d, digits, 0), digits)
    
def firstDigit(number):
    return getDigits(number, 1, 1)

def multipleOf10(number):
    return number % 10==0
