# original code: http://forum.nim-lang.org/t/754
type
  Generator*[T] = generic x
    next(var x) is T

  BoundedGenerator*[T] = generic x
    x is Generator[T]
    min(x) is T
    max(x) is T

type Uniform* = object
  gen: BoundedGenerator[int]
  min_p: float
  max_p: float

proc create*(gen: BoundedGenerator[int], min: float, max: float): Uniform =
  return Uniform(gen: gen, min_p: min, max_p: max)
