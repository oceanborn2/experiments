1 + 1

var name = "Steve "
name += " Lorenz"

name + name

(name, name)

Math.sqrt(3 + Math.pow(Math.abs(-5), 2))

val x = Math.sqrt(2)

Math.log(x)


def add(x: Int, y: Int): Int = {
  x + y
}
add(4, 3)

def addxy(x: Int)(y: Int): Int = {
  x + y
}

def add2 = {
  addxy(2)
}

add2(1000)

val a: Int = 1
val b: Int = 3
val c = (a, b) = (b, a)
println("a:" + a)
println("b:" + b)

//def add(x,y) = x + y

