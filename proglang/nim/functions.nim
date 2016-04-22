import unittest,strutils, intsets, math

proc myFact*(n:int):int=
  case n:
    of 0: 1
    of 1: 1
    else:
      n*myFact(n-1)

proc myFib*(n:int):int=
  case n:
    of 0: 0
    of 1: 1
    else:
      myFib(n-1)+myFib(n-2)

proc mySum*(nums:varargs[int]):int=
  result=0
  for e in nums:
    result += e

proc myProd*(nums:varargs[int]):int=
  result=1
  for e in nums:
    result *= e


proc myPermutations*(n:int, k:int):int=
  result = myFact(n) div myFact(n-k) #TODO:Optimize

proc myCombinations*(n:int, k:int):int=
  let den = myFact(n-k)*myFact(k) #TODO:Optimize
  result = myFact(n) div den

proc mySqrt*(n:int)=
  const delta=0.001
  var rac=n

proc mySumOfInt*(n:int):int=
  n*(n+1) div 2

proc digits*(n:uint64):(seq[uint8],uint64,int,uint8) =
  let dstr = $n
  let dl = len(dstr)
  var sm= 0'u64 # or var sm:uint64=0
  var ds : seq[uint8] = @[]
  var ld = uint8(ord(dstr[dl-1])-48)
  for d in dstr:
    let v = uint8(ord(d)-48)
    ds.add(v)
    sm += uint64(v)
    #ld = v

  echo ("digits: " & $n & "> " & $sm & "," & $dl & ", " & $ld)
  result = (ds, sm, dl, ld)

#const lastDigitsNotPrime:IntSet = initIntSet()
const Nine = 9'u64
const One = 1'u64
const Ten = 10'u64


proc myPrime*(n:uint64, silent:bool = false):bool =
  let (ds, sm, dl, ld) = digits(n)
  if not silent:
    # ds = list of digits
    # sm = initial sum of digits (equivalent to first step of digitsum)
    # dl =
    echo "myPrime:" & $n
    echo "  digits           : " & $ds
    echo "  initial digit sum: " & $sm
    echo "  digits len       : " & $dl
    echo "  last digit       : " & $ld
    echo ""

  if dl==1:
    if ld==2 or ld==3 or ld==5 or ld==7: #if ld<2 or ld==4 or ld==6 or ld==8 or ld==9:return false
      return true
    return false

  else: # more than one digit
    # last digit in 0,2,5 => not prime (since dl>1)
    if ld==0 or ld==2 or ld==5:
      return false

    # calculate digit sum to match against 9
    var dsm = sm # start from already available digit sum
    if dsm == Nine:
      return false

    while dsm > Nine:
      let (ds2, sm2, dl2, ld2)= digits(dsm)
      dsm = sm2
      if dsm == Nine:
        return false

    var halfOfN = uint64(round(sqrt(float64(n)))+1)
    echo "half:" & $halfOfN
    var i=10'u64 # all digits lesser than 10 have been tested already (with dl==1)
    while i<halfOfN:
      echo "i:" & $i
      var rm = n # Nim does net yet have uint64 mod operations
      while rm >= i:
        rm = rm - i
        echo "dec:" & $(rm+i) & " => " & $rm

      echo "rm: " & $rm & "(" & $i & ")"
      if rm==0:
        return false
      i = i + 1

    # If we arrive here, then the number is prime
    return true

proc testAPrime*(n:uint64, expected: bool, silent:bool=false) =
  let boolRes = myPrime(n, silent)
  check(boolRes == expected)
  if not silent: echo "testing : " & $n & " => " $expected

suite "digits sums & primality tests":

  test "digits extraction":
    #var s=newSeq[uint8][1,2,9,4]
    echo (digits(1294)) #==(@[1'u8,2'u8,9'u8,4'u8])))

  test "primes":
    discard """ testAPrime(00'u64, false, silent=true)
    testAPrime(01'u64, false, silent=true)
    testAPrime(02'u64, true,  silent=true)
    testAPrime(03'u64, true,  silent=true)
    testAPrime(04'u64, false, silent=true)
    testAPrime(05'u64, true,  silent=true)
    testAPrime(06'u64, false, silent=true)
    testAPrime(07'u64, true,  silent=true)
    testAPrime(08'u64, false, silent=true)
    testAPrime(09'u64, false, silent=true)
    testAPrime(10'u64, false, silent=true)
    testAPrime(11'u64, true,  silent=true)
    testAPrime(12'u64, false, silent=true)
    testAPrime(13'u64, true,  silent=true)
    testAPrime(17'u64, true,  silent=true) """

    testAPrime(21'u64, false, silent=true)

    discard """


    for i in countup(2000, 2200, 2):
      testAPrime(uint64(i), false,silent=true)
 """


  discard """ suite "basic math functions in Nim":

  test "sum of integer (1 to n)":
    check (mySumOfInt(0)==0)
    check (mySumOfInt(1)==1)
    check (mySumOfInt(2)==3)
    check (mySumOfInt(3)==6)
    check (mySumOfInt(4)==10)
    check (mySumOfInt(5)==15)
    check (mySumOfInt(10)==55)
    check (mySumOfInt(20)==210)
    check (mySumOfInt(100)==5050)
    check (mySumOfInt(1200)==720600)

  test "sum of integer (list) ":
    check (myProd(1,2,3,4)==24)
    check (myProd(1,3,5,7,11)==1155)
    check (myProd(11,12,13,140)==240240)

  test "product of integer (list) ":
    check (mySum(1,2,3,4)==10)
    check (mySum(1,3,5,7,11)==27)
    check (mySum(11,12,13,140)==176)

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

  test "permutations":
    check (myPermutations(3,1)==3)
    check (myPermutations(3,2)==6)
    check (myPermutations(3,3)==6) """


  discard """fact optim tests":
    let myf3 = myFact(3)
    echo myf3

    let myf5 = myFact(5)
    echo myf5

    let myf8 = myFact(8)
    echo myf8

    check (myFact(7)==myFact(3)*myFact(5)) """
