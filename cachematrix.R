## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = numeric()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
  
}


## Write a short comment describing this function
# Compute the inverse of a matrix , but first try to get the cache
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    ## don't write return(m) to have the value, 
    ## this is a difference with cache mean ?!
    m
  }
  
  ## not in the cache, so we compute
  data <- x$get()
  m <- solve(data, ...)
  ## put in the cache
  x$setinverse(m)
  m
  
  
}
