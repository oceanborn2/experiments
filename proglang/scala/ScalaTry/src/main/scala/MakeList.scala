/**
 * Created with IntelliJ IDEA.
 * User: pascal
 * Date: 12/02/13
 * Time: 22:26
 * To change this template use File | Settings | File Templates.
 */
object MakeList {

  def main(args: Array[String]) = {
    val x = List(1)
    println(x::x::x::x::x)
    println(1::x::x::x::x)
    println(3::2::x reverse)

    val y = 3::2::List()
    println(y)
    println(y companion)

    val z =  'a::'b::'a::'c::'d::List()
    println(z)
    println(z head)

    print("filter:")
    println(z filter(e => e.name == "a"))

    println(z reverse)
  }

}
