## Put comments here that give an overall description of what your
## functions do
# This function will do below mentioned 4 actions: 
# 1. sets the value of the matrix,
# 2. gets the value of the matrix,
# 3. sets the value of the inverse,
# 4. gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


# Below functions finds the inverse of the matrix created with the previous function.
# First it will check if the inverse has already been created or not.
# If Yes, it will get the inverse from the cache and skips the computation.
# Else, it calculates the inverse of the matrix and sets the value of the matrix in the cache.


cacheSolve <- function(x, ...) {
    
    m <- x$getinverse()
    if(!is.null(m)) {
        message("Fetching cahced data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    ## Return a matrix that is the inverse of 'x'
}
