package functional.calculations

import scala.annotation.tailrec

class Sums {

  // Inspired from this discussion : http://stackoverflow.com/questions/12496959/summing-values-in-a-list

  final def sum(xs: List[Int]): Int = {
    xs match {
      case x :: tail => x + sum(tail) // if there is an element, add it to the sum of the tail
      case Nil => 0 // if there are no elements, then the sum is 0
      case _ => throw new Exception("type Error : " )
    }
  }

  final def sumRecursive(xs: List[Int]): Int = {
    if (xs.isEmpty) 0
    else xs.head + sumRecursive(xs.tail)
  }

  final def sumTailRecursive(xs: List[Int]): Int = {
    @tailrec
    def inner(xs: List[Int], accum: Int): Int = {
      xs match {
        case x :: tail => inner(tail, accum + x)
        case Nil => accum
      }
    }
    inner(xs, 0)
  }

  final def sumWithMatchList(xs: List[Int]): Int = xs match {
    case Nil => 0
    case x :: xs2 => x + sumWithMatchList(xs2)
  }


/*
  final def sumWithMatchArray(xs: Array[Int]): Int = xs match {
    case Array(_) => 0
    case Array(x:Array(x2)) => sumWithMatchArray(x2)
  }
*/

  final def sumWithFold(xs: List[Int]) = xs.foldLeft (0) (_ + _)

  final def sumWithFoldAndNamesParams (xs:List[Int]) = xs.foldLeft(0)((a, b) => a + b)


}

object Sums {

  def checkThatSum(expectedSum: Int, intList: List[Int],  sumFunc: List[Int] => Int) = {
    val sumOf = sumFunc(intList)
    assert(sumOf == expectedSum, "dommage")
    sumOf
  }

  def main (args: Array[String]) {
    val intList = List(1,2,3,4,5,6,7,8,9,10)

    val twenty  = (1 to 20) toList
    val twentyAsArray = (1 to 20) toArray

    val sumUtils = new Sums()

    println(checkThatSum(55, intList, sumUtils.sumRecursive))
    println(checkThatSum(55, intList, sumUtils.sumWithMatchList))
    println(checkThatSum(55, intList, sumUtils.sumWithFold))
    println(checkThatSum(55, intList, sumUtils.sumWithFoldAndNamesParams))
    println(checkThatSum(55, intList, sumUtils.sumTailRecursive))

    val sumToTwenty = sumUtils.sum(twenty)
    assert(sumToTwenty equals 210)
    assert(sumToTwenty.equals(210))
    assert(sumUtils.sum(twenty) == 210)
    assert(sumUtils.sum(twenty) equals 210)

    println (checkThatSum(210, twenty, sumUtils.sum))
    println (checkThatSum(210, twenty, (intList: List[Int]) => sumUtils.sum(intList) ))

 //   println(sumUtils.sumWithMatchArray(twentyAsArray))
  }
}