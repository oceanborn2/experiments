package math

trait Expression {

  def operation

  //  val value: T

  /**
   * Build the expression
   */
  def build

  def compute

}

trait UnaryExpression extends Expression

//case class Opposite extends UnaryExpression {
//  def compute = {
//    return -value
//  }
//}

trait BinaryExpression extends Expression
