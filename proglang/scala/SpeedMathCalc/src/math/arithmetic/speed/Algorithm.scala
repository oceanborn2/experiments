package math.arithmetic.speed

trait NamedObject {
  val name: String
  val description: String
}

trait Algorithm extends NamedObject {
  def run
}

trait Problem extends NamedObject {
}

trait AdditionProblem extends Problem

trait SubtractionProblem extends Problem

trait MultiplicationProblem extends Problem

trait DivisionProblem extends Problem


trait SolutionSystem extends NamedObject {
  //abstract val algorithms: Map[Problem, Array[Algorithm]]

}

class VedicSystem extends SolutionSystem {
  val name = "Vedic"
  val description = "Indian arithmetic system"
  //  val algorithms = {
  //    null -> new Array[Algorithm]() {}
  //  }

}


class TrachtenbergSystem extends SolutionSystem {
  val name = "Trachtenberg"
  val description = "Arithmetic method designed by a man while detained in a concentration camp during World War II as a mean to stay mentally fit"
  //  val algorithms = {
  //    null -> new Array[Algorithm]() {}
  //  }
}





