package caseclasses.p2

trait Identifiable {
  def name: String
}

trait Locatable {
  def address: String
}

// trait Ages { def age: Int }

case class Employer(val name: String, val address: String, val taxno: Int)
  extends Identifiable
  with Locatable

case class Employee(val name: String, val address: String, val salary: Int)
  extends Identifiable
  with Locatable

object Person2 {

  def main(args: Array[String]) {
    println(Employee(address="address", name="employee", salary=10))
    println(Employer(address="address", name="employer", taxno=20))
  }
}