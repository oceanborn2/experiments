import unittest

proc myFact(n:int):int=
  case n:
    of 0: 1
    of 1: 1
    else:
      n*myFact(n-1)

proc myFib(n:int):int=
  case n:
    of 0: 0
    of 1: 1
    else:
      myFib(n-1)+myFib(n-2)

proc myPermutations(n:int, k:int):int=
  result = myFact(n) div myFact(n-k) #TODO:Optimize

proc myCombinations(n:int, k:int):int=
  let den = myFact(n-k)*myFact(k) #TODO:Optimize
  result = myFact(n) div den

proc mySqrt(n:int)=
  discard

proc mySumOfInt(n:int):int=
  n*(n+1) div 2


suite "basic math functions in Nim":

  test "sum of integer":
    check (mySumOfInt(0)==0)
    check (mySumOfInt(1)==1)
    check (mySumOfInt(2)==3)
    check (mySumOfInt(3)==4)

    discard """ check (mySumOfInt(0)==0)
    check (mySumOfInt(0)==0)
    check (mySumOfInt(0)==0)
    check (mySumOfInt(0)==0)
    check (mySumOfInt(0)==0)
    check (mySumOfInt(0)==0) """



  test "myFact(0..20)":
    check (myFact(0)==1)
    check (myFact(1)==1)
    check (myFact(2)==2)
    check (myFact(3)==6)
    check (myFact(4)==24)
    check (myFact(5)==120)
    check (myFact(6)==720)
    check (myFact(7)==5040)
    check (myFact(8)==40320)
    check (myFact(9)==362880)
    check (myFact(10)==3628800)
    check (myFact(11)==39916800)
    check (myFact(12)==479001600)
    check (myFact(13)==6227020800)
    check (myFact(14)==87178291200)
    check (myFact(15)==1307674368000)
    check (myFact(16)==20922789888000)
    check (myFact(17)==355687428096000)
    check (myFact(18)==6402373705728000)
    check (myFact(19)==121645100408832000)
    check (myFact(20)==2432902008176640000)

  test "myFib(0..20)":
    check (myFib(0)==0)
    check (myFib(1)==1)
    check (myFib(2)==1)
    check (myFib(3)==2)
    check (myFib(4)==3)
    check (myFib(5)==5)
    check (myFib(6)==8)
    check (myFib(7)==13)
    check (myFib(8)==21)
    check (myFib(9)==34)
    check (myFib(10)==55)
    check (myFib(11)==89)
    check (myFib(12)==144)
    check (myFib(13)==233)
    check (myFib(14)==377)
    check (myFib(15)==610)
    check (myFib(16)==987)
    check (myFib(17)==1597)
    check (myFib(18)==2584)
    check (myFib(19)==4181)
    check (myFib(20)==6765)
