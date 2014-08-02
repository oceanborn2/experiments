object IteratorsTest {

  def walk(what: Array[Any]) = {
    print("combi: ")
    what.foreach(println)
    println
  }

  def main(args: Array[String]) {
    println("Iterators test")
    val a = Array("A", 1, 1.0, "B", 2.3)

    println("iterator:")
    a.iterator.foreach(println)
    println

    println("reverse iterator:")
    a.reverseIterator.foreach(println)
    println

    println("combinations(2) iterator")
    val comb = a.combinations(2)
    comb.foreach(_.foreach(println))

    println("a.apply(2):" + a.apply(2))

    a.foreach(println)
    println
    
    //println ("sorted: " + a.sort).foreach(println))

    for (i <- 0 to 10) {
      println("i:" + i)
    }

    println
    
    for (i <- 0 until 10) {
      println("i:" + i)
    }
  }
}
