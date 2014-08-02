object MixedArray {
  def main(args: Array[String]) {
    println("Mixed array test")
    val a = Array("A",1, 1.0)
    println("a:" + a.toString())
    println("a.type" + a.getClass())
    a.map(println)
    println
    //println (a.type a)
   // for (val x <- a.elements) {
   //   println(x)
   // }



    //println("a.elements:" + a.elements)

  }
}
