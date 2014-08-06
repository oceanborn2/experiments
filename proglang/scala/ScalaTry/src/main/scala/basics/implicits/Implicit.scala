package implicits

class Numerique(x: Number) extends Number {

  def display() {
    println(x)
  }

  implicit def intToNumber(x: Int) = new Numerique(x)

}

object implicits {
  val i = 10
  //i.display()
}

