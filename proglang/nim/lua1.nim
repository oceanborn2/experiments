import nimLua

proc abc(a, b: int): int =
  result = a + b

var L = newNimLua()
L.bindFunction(abc)
L.bindFunction:
  abc -> "cba"
L.bindFunction("alphabet", abc)
