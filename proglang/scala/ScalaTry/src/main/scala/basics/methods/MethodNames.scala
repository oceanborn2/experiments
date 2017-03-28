package basics.methods

object MethodNames {

  def +(s1: String, s2: String) = {
    "+(" + s1 + "::" + s2 + ")"
  }

  def ___(x: Int, y: Int) = {
    print("___" + (x + y))
  }

  def main(args: Array[String]) {
    println(MethodNames.+("123", "456"))
    println(___(2,3))
//    println(MethodNames.+("123", "456"))
//    println(MethodNames.___(2,3))
  }

}
