## creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

#Sets the value of the vector  
  i  <- NULL
  set  <- function(y){
    x <<- y
    i <<- NULL 
  }

#Gets the value of the vector
  get  <- function() x

#Set the value of the mean 
  setinverse  <- function(inverse) i  <<- inverse

#Get the value of the mean
  getinverse  <- function() i
  list(set= set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## Solves cacheable matrix. No action if inverse calculated

cacheSolve <- function(cacheable.matrix, ...) {
  inverted.matrix <- cacheable.matrix$get.inverse()
  # Find cached matrix
  if(!is.null(inverted.matrix)) {
    message("cacheable matrix")
    return(inverted.matrix)
  }
 matrix.to.inverse <- cacheable.matrix$get()
  inverted.matrix <- solve(matrix.to.inverse)
  cacheable.matrix$set.inverse(inverted.matrix)
  inverted.matrix'
}
