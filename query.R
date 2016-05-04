require(lattice)
require(latticeExtra)

realconf <<- c(1, 1.5, 2)
graphing <- function(points, conf){
  cat("conf=", conf, "\n")
  a <- histogram(~points)
  b <- layer(panel.abline(v = 2:4, lwd=3))
  c <- layer(panel.abline(v=conf))
  d <- layer(pabel.abline(v=realconf))
  e <- a + c
  return(e)
}
graphing(points=c(1,2,3,4,5,7,8,9), conf=c(2,4))

x <- rnorm(100, 0, 10); myconf <- c(2, 4)
a <- histogram(~x)
c <- layer(panel.abline(v=myconf))
d <- a + c
d
