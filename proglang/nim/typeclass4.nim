# original code: http://forum.nim-lang.org/t/754

type
  Multipliable = interface
    # some definition
  MyInt = int implements Multipliable
echo MyInt(5).square  # works
echo 5.square # compile-time error: int is not Multipliable


type Uniform*[T: BoundedGenerator] = object
  gen: T
  min_p: float
  max_p: float
