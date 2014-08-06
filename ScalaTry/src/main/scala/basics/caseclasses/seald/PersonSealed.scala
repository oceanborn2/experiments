package caseclasses.seald

// You could mark it as 'sealed'. Explained later.
sealed trait Person {
  def name: String
}

case class MyPerson(name:String) extends Person

case class Employee(
                     override val name: String,
                     salary: Int
                     ) extends Person

case class Tourist(
                    override val name: String,
                    bored: Boolean
                    ) extends Person

object PersonSealed {
  def main(args: Array[String]) {
    val n = MyPerson("someone")
    println(n)
    val e = Employee("slave", 1000)
    println(e)
    val t = Tourist("John", false)
    println(t)
  }
}