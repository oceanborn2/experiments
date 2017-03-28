package caseclasses.p1

abstract class Person {
  def name: String
  def age: Int
  // address and other properties
  // methods (ideally only accessors since it is a case class)
}

case class Employer(val name: String, val age: Int, val taxno: Int)
  extends Person

case class Employee(val name: String, val age: Int, val salary: Int)
  extends Person


object Person {

  def main (args: Array[String]) {
    println(Employee("employee", 40, 10000))
    println(Employer("employer", 42, 20000))
  }
}