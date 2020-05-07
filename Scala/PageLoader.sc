import scala.io.Source
import scala.actors._
import Actor._

object PageLoader {
  def getPageSize(url: String): Int = Source.fromURL(url).mkString.length
}

val urls = List(
  "https://www.amazon.com/",
  "https://www.google.com",
  "https://www.twitter.com",
  "https://www.cnn.com",
)

def timeMethod(method: () => Unit): Unit = {
  val start = System.nanoTime()
  method()
  val end = System.nanoTime()
  println("Method took " + (end - start) / 1000000000 + " seconds.")
}

def getPageSizeSequentially(): Unit = {
  for (url <- urls) {
    println("Size for " + url + ": " + PageLoader.getPageSize(url))
  }
}
def getPageSizeConcurrently(): Unit = {
  val caller = self

  for (url <- urls) {
    actor {  caller ! (url, PageLoader.getPageSize(url)) }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size for " + url + ": " + PageLoader.getPageSize(url))
    }
  }
}

println("Sequential run:")
timeMethod(getPageSizeSequentially)

println("Concurrent run:")
timeMethod(getPageSizeConcurrently)