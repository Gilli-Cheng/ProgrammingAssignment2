## R programming week3 assignment

## the makeCacheMatrix func is a parent function
## the <- works on the current level
## <<- can modify var in the parent level

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsol <- function(solve) m <<- solve
        getsol <- function() m
        list(set = set, get = get,
             setsol = setsol,
             getsol = getsol)
}


cacheSolve <- function(x, ...) {
        m <- x$getsol()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsol(m)
        m## Return a matrix that is the inverse of 'x'
}