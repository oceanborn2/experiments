import scala.collection.mutable.HashMap


object Symbols {
  def main(args: Array[String]) {
    println("Symbols test")
    val x = 'x
    val y = 'x
    val z= 'y
    val m = new HashMap[Symbol, Symbol]
    m.+=((x, x))
    println("x:" + x + "=>" + x.name)
    println(x == y)
    println(x == z)

    val x2=new String("x")
    val y2=new String("x")
    println(x2==y2) //  .equals ? en Java
    println(x2 eq y2) // == en Java

  }
}
