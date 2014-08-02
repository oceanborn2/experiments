package functional

object Functional {

  val FiveLetters =  List("a","b","c","d","e")
  val FiveDigits = List(1,2,3,4,5)
  val ManyDigits = 0 to 100

  def showReduce() {
    println("reduce* tests")
    println (FiveDigits reduceLeft { _ * _ })
    println (FiveDigits reduceRight{ _ * _ })

    println(FiveDigits  reduceLeft  { _ + _ })
    println(FiveLetters reduceRight { _ + _ })
    println

  }




  def showMap() {
    println("map tests")
    FiveDigits map println
    FiveLetters map println

    val digitsWithComma = ManyDigits mkString ","
    println("digitsWithComma:" , digitsWithComma)

    val sumOfTo100 = ManyDigits

    println("sumOf0To100:" , sumOfTo100)

    println(FiveDigits map ((x) => 2 *x ))


  }

  def main(args:Array[String]){
    showReduce()
    showMap()
  }

}
