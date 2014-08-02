object MultipleEncodingsMethodNames {
  def méthode(s: String) = {
    println("é:" + s)
  }

  def բարիգալուստ(s: String) = {
    println("բարի գալուստ:" + s)
  }

  def 歡迎(i: Int) = {
    println("歡迎:" + i)
  }

  def καλώςορίσατε() {
    println("καλώς ορίσατε")
  }

  def main(args: Array[String]) {
    méthode("123")
    բարիգալուստ("hello world")
    歡迎(10)
    καλώςορίσατε()
  }

}
