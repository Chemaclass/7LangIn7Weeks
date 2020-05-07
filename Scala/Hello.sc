object Hello {
  def greet(args: Array[String]): Unit = {
    val names = args.mkString(",");
    println(s"Hello ${names}")
  }
}

Hello.greet(Array("Juan", "Chema", "Susva"));
