package basics

/**
 * Created with IntelliJ IDEA.
 * User: pascal
 * Date: 12/02/13
 * Time: 22:51
 * To change this template use File | Settings | File Templates.
 */

class Role

case object Developer extends Role

case object Manager extends Role

case class Person(name: String, age: Int, role: Role)

object PatternMatchingOnObjects {

  def main(args: Array[String]) = {
    val alice = new Person("Alice", 25, Developer)
    val bob = new Person("Bob", 27, Developer)
    val charlie = new Person("Charlie", 32, Manager)
    var onlyDevel = Array[Person]()
    for (item <- Map(1 -> alice, 2 -> bob, 3 -> charlie)) {
      item match {
        case (id, p@Person(_, _, Manager)) => "%s is overpaid.\n" format(p)
        case (id, p@Person(_, _, _)) =>
         // onlyDevel = p++onlyDevel
          "%s is underpaid.\n" format(p)
      }
    }
    println(onlyDevel)
    /*for (r <- res) {
      println(r)
    } */
  }

}
