object Functional {

  def main(args:Array[String]){
	  println(List(1, 2, 3, 4, 5) reduceLeft { _ * _ })
	  println(List(1, 2, 3, 4, 5) reduceRight{ _ * _ })

	  println(List("a","b","c","d","e") reduceLeft  { _ + _ })
	  println(List("a","b","c","d","e") reduceRight { _ + _ })

  }

}
