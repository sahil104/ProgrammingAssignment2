## Overall the function is taking a matrix and saving the inverse into the cache so that in future it won't require computation and output can be taken direcctly from the function itself.


## the makeCacheMatrix is esentially creating a memory of the inverse of the matrix provided
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}
## Extracting the cached inverse of the matrix and using the output along with displaying a message that the cached data is being extracted
cacheSolve <- function(x, ...) {m <- x$getinv()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinv(m)
m
## Return a matrix that is the inverse of 'x'
}
