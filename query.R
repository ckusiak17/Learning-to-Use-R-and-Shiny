# Nicholas Horton (nhorton@amherst.edu), Coco Kusiak
# query about lattice environment
# May 12, 2016
require(lattice)
require(latticeExtra)

#below is the original function which does not work
graphing <- function(points, conf){
  cat("conf=", conf, "\n")
  a <- histogram(~points)
  b <- layer(panel.abline(v=conf))
  c <- a + b
  return(c)
}
graphing(points=c(1,2,3,4,5,7,8,9), conf=c(2,4))

#however, the function does work if there is a main call from the environment
graphing <- function(points, conf){
  cat("conf=", conf, "\n")
  a <- histogram(~points)
  b <- layer(panel.abline(v=conf))
  c <- layer(panel.abline(v=c(6,9)))
  d <- a + c
  return(d)
}
graphing(points=c(1,2,3,4,5,7,8,9), conf=c(2,4))


#finally, the function works if it accesses a global variable called realconf
realconf <<- c(2,4)
graphing <- function(points, conf){
  cat("conf=", conf, "\n")
  a <- histogram(~points)
  b <- layer(panel.abline(v=realconf))
  c <- a + b
  return(c)
}
graphing(points=c(1,2,3,4,5,7,8,9), conf=c(2,4))
