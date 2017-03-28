class FactImplementation {

  def fact(n: Int): BigInt = {
    if (n == 0) {
      1
    }
    else {
      n * fact(n - 1)
    }
  }

}

class FibonacciImplementations {

  def fibnaive(n: Int): BigInt = {
    if (n < 2) 1
    else fibnaive(n - 1) + fibnaive(n - 2)
  }

  def fibrec(n: Int): BigInt = {
    def fibrecn(n: Int, acc: BigInt): BigInt = {
      if (n < 2) return acc + 1
      return acc + fibrecn(n - 1, acc)
    }
    return fibrecn(n, 0)
  }

  //http://stackoverflow.com/questions/9864497/generate-a-sequence-of-fibonacci-number-in-scala
  def fibSeq(n: Int): List[Int] = {
    var ret = scala.collection.mutable.ListBuffer[Int](1, 2)
    while (ret(ret.length - 1) < n) {
      val temp = ret(ret.length - 1) + ret(ret.length - 2)
      if (temp >= n) {
        return ret.toList
      }
      ret += temp
    }
    ret.toList
  }

  val fibs2: Stream[Int] = 0 #:: 1 #:: (fibs2 zip fibs2.tail).map { t => t._1 + t._2}

  val fibs3: Stream[Int] = 0 #:: fibs3.scanLeft(1)(_ + _)

  //http://stackoverflow.com/questions/24444250/wrongly-implemented-fibonacci-sequence-in-scala?rq=1
  def fibonacci(n: Int): BigInt = n match {
    case 0 => 0
    case 1 => 1
    case _ => fibonacci(n - 1) + fibonacci(n - 2)
  }


  import scala.collection.mutable.Stack

  def fibonacci2(n: Int): BigInt = {
    var result = BigInt(0)
    val stack = Stack.empty[Int]
    stack.push(n)

    while (stack.nonEmpty) {
      val x = stack.pop()
      if (x == 1) {
        result += 1
      }
      else if (x > 1) {
        stack.push(x - 2)
        stack.push(x - 1)
      }
    }

    result
  }

  def fibonacci3(n: Int): BigInt = {
    var a = BigInt(0)
    var b = BigInt(1)
    var idx = 0

    while (idx < n) {
      val tmp = a
      a = b
      b = tmp + a
      idx += 1
    }

    a
  }

  import scala.annotation.tailrec

  def fibonacci4(n: Int): BigInt = {
    @tailrec
    def loop(a: BigInt, b: BigInt, idx: Int = 0): BigInt =
      if (idx < n)
        loop(b, a + b, idx + 1)
      else
        a

    loop(0, 1)
  }


}


object RecursiveFunctions {

  def showfn1(n: Int, funName: String, fn: Int => BigInt => BigInt) = {
    println(funName + "(" + n + ")=" + fn(n)(0))
  }

  def showfn2(n: Int, funName: String, fn: BigInt) = {
    println(funName + "(" + n + ")=" + fn)
  }

  def showfn2(n: Int, funName: String, fn: List[Int]) {
    println(funName + "(" + n + ")=" + fn)
  }

  def main(args: Array[String]) {
    val n = 27
    val mf = new FactImplementation()
    showfn2(n, "fact", mf.fact(n))

    val mf2 = new FibonacciImplementations()
    showfn2(n, "fibnaive", mf2.fibnaive(n))
    showfn2(n, "fibrec", mf2.fibrec(n))
    showfn2(n, "fibs2", mf2.fibs2(n))
    showfn2(n, "fibs3", mf2.fibs3(n))
    showfn2(n, "fibSeq", mf2.fibSeq(n))
  }

}
