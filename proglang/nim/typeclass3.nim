# original code: http://forum.nim-lang.org/t/754
type
  Generator = generic var x
    next(x)

type
  Multipliable = generic x
    x is SomeOrdinal
    x * x is x.type

proc square(a: Multipliable): Multipliable = a * a
let x = 5
echo x.square   # -> 25
# echo "5".square  #doesn't compile - string is not Multipliable

    
