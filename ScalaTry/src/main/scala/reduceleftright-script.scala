
object Reduce extends App {
  
println((1 to 1000000) reduceLeft(_ + _))
println((1 to 1000000) reduceRight(_ + _))

println((1 to 4) reduceLeft(_ / _)) //0
println((1 to 4) reduceLeft(_ - _)) //-8
println((1 to 4) reduceRight(_ - _))// -2  
  
}
