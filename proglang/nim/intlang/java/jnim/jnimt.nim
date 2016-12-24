import jnim,
       java.lang,
       encodings

jclass java.io.PrintStream of JVMObject:
  proc println(s: string)

jclass java.lang.System of JVMObject:
  proc `out`: PrintStream {.prop, final, `static`.}

jclass Service of JVMObject:
#  proc `init`:void {.prop, final, `static`.}
  proc `init`:void
  proc `new`:Service
  proc run(s:string):string


# Initialize JVM
initJNI()

let c=2
System.`out`.println("This string is printed with System.out.println! => " & $c)

var s = Service.new

echo(addr(s))

#System.`out`.println(s.run("test"))



#[import jnim,
       java.lang,
       common,
       unittest,
       encodings

suite "jnim tests":

  setup:
    if not isJNIThreadInitialized():
      initJNIForTests()

  test "Basic tests":

    # Import a couple of classes
    jclass java.io.PrintStream of JVMObject:
      proc println(s: string)

    jclass java.lang.System of JVMObject:
      proc `out`: PrintStream {.prop, final, `static`.}

    jclass Service of JVMObject:
      proc run(s:string):string

    let c=2

    # Initialize JVM
    #initJNI()
    # Call!
    System.`out`.println("This string is printed with System.out.println! => " & $c)

    var s = Service.new
    System.`out`.println(s.run("test"))


]#

