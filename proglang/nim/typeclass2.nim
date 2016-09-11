# original code: http://forum.nim-lang.org/t/754
type
  Generator = generic x
    next(var x)

  Minimizable = generic x
    min(x)

  ConstantGenerator = object
    x: int

proc next(gen: var ConstantGenerator): int = 0

proc min(gen: ConstantGenerator): int = 0

var g = ConstantGenerator(x: 37)
echo (g is Generator)
echo (g is Minimizable)
