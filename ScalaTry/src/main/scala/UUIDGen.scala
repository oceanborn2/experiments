import scala.util.Random

class UUIDGen(val seed: Long, val len: Int = 16) {
  val alphabet = List('a' to 'z', 'A' to 'Z', '0' to '9') flatten
  //List('A' to 'Z') :: List('a' to 'z') :: List('0' to '9')
  val alphabetLen = alphabet.length
  val randomizer = new Random(seed)

  def next() = {
    var s = new StringBuilder()
   for ( i <-0 to len) {
      val c = alphabet(randomizer.nextInt(alphabetLen))
      s.append(c)
    }
    s
  }
}


object UUIDGen {


  def main(args: Array[String]) {
    println((List('a' to 'z', 'A' to 'Z', '0' to '9') flatten) foreach (print))
    val uuid = new UUIDGen(686472981123422l, 32)
    for (i <- 1 to 10) {
      println(uuid.next())
    }

  }
}