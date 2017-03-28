package implicits

class Numerique(x: Number) extends Number {

  def display() {
    println(x)
  }

  implicit def intToNumber(x: Int) = new Numerique(x)

  override def intValue(): Int = x.intValue()

  override def longValue(): Long = x.longValue()

  override def floatValue(): Float = x.floatValue()

  override def doubleValue(): Double = x.doubleValue()
}

object implicits {
  val i = 10
  //i.display()
}

