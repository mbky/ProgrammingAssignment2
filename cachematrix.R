## These functions provide the ability to:
## 1.  create a cached matrix object
## 2.  determine the inverse matrix given a cached matrix object
##
## The actual computation of the inverse matrix will only be performed once.
## After that the cached value is returned.

## This function creates a matrix and returns a set of functions
## setting and getting the matrix and the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    x <- NULL
    set <- function(initData) {
        data <<- initData
        x <<- NULL
    }
    get <- function() data
    setSolution <- function(initSolution) x <<- initSolution
    getSolution <- function() x
    list(set = set, get = get,
         setSolution = setSolution,
         getSolution = getSolution)
}

## This function returns the inverse matrix of a matrix contained
## in a cached matrix object.  If the cached value does not exist,
## the inverse matrix is computed and cached/returned.
cacheSolve <- function(x, ...) {
    solution <- x$getSolution()
    if(!is.null(solution)) {
        message("Getting cached solution...")
        return(solution)
    }
    data <- x$get()
    solution <- solve(data, ...)
    x$setSolution(solution)
    solution
}
