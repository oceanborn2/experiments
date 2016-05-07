# derived from original example in Nim Documentation at: http://nim-lang.org/docs/tut2.html#macros

import macros

#when isMainModule:
dumpTree:
  const cfgversion: string = "1.1"
  const cfglicenseOwner= "Hyori Lee"
  const cfglicenseKey= "M1Tl3PjBWO2CC48m"

  let
    a=3 
    b=2*a
    c=6*b+b

  var x = c * 2

  echo("A=",$a, ", B=",$b,", C= ", c) 
  for x in (a,b,c):
      print x

