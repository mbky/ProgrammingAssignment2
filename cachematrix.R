## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
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


## Write a short comment describing this function
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
