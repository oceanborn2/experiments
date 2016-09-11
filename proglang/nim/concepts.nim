# Original code: http://stackoverflow.com/questions/37550948/how-to-use-a-concept-declaration-in-nim

type
  T = concept t
    t.a is string

  T0 = ref object
    a: string

  T1 = ref object
    a: string
    q: string

proc echoT(t: T) : void =
  echo "hello " & t.a

echoT(T0(a: "T0"))
echoT(T1(a: "T1", q: "q"))