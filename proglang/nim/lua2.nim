import nimLua

proc abc(a, b: int): int =
  result = a + b

var L = newNimLua()
L.bindFunction(abc)

L.bindFunction:
  abc -> "cba"

L.bindFunction:
  sum -> echo(2+2)


L.bindFunction("alphabet", abc)
#L.echo("Hello world")
echo L.dostring("mylib.abc()")
