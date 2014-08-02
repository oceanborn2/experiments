class Implicits(s: String) {
  def upper() = { s.toUpperCase }
  def lower() = { s.toLowerCase }
  def reverseMe() = { s.reverse }
}

object Implicits {

  implicit def StringToImplicits(s: String): Implicits = new Implicits(s)

}

import Implicits._

object Test extends App {
  println("hello world".upper())
  println("hello there".lower())
  println("Hi there".reverseMe())
}