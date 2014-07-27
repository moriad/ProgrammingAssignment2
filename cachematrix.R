## creates variable to solve and store inverse of sqaure matrix or solve and
##store inverse if it hasn't been solved



## creates list to identify matrix, if inverse has been solved, stores
## value of inverse if it is being solved for the first time

makeCacheMatrix <- function(x = matrix()) {
  I <- NULL
  set <- function(y) {
    x <<- y
    I <<- NULL
  }
  get <- function() x
  setinv <- function(solve) I <<- solve
  getinv <- function() I
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}



## Checks if Matrix inverse has been solved. returns solution if true
## if not true, stores data, calcs inverse

cacheSolve <- function(x, ...) {
I <- x$getinv() # get value of inverse
if(!is.null(I)) { # check if Inv has been solved
  message("getting cached data")
  return(I) # return value of inverse if it has been solved
}
  data <- x$get() # if value hasn't been solved store data
  I <- solve(data, ...) # solve matrix
  x$setinv(I) # store value of solution
  I
}
