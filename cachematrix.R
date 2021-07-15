## R programming week3 Assignment

## the makeCacheMatrix func is a parent function
## the <- works on the current level
## <<- can modify var in the parent level

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) { ## default matrix data type
        m <- NULL                           ## m as the empty basket for the later inv calculation
        set <- function(y) {
                x <<- y                     ## assign imput matrix in parent level; reset m
                m <<- NULL
        }                                   
        get <- function() x                 ## returns input matrix
        
        
        setsol <- function(solve) m <<- solve   ##  assign m in parent level
        getsol <- function() m                  ##  the value of func cacheSolve will save back here
        
        
        list(set = set, get = get,setsol = setsol,getsol = getsol)
        ## assign var name for using $ operator later on
}

## cacheSolve will do the inverse calculation

cacheSolve <- function(x, ...) {
        m <- x$getsol()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsol(m)                          ## put value in cache; look up there !!
        m                                    ## Return a matrix that is the inverse of 'x'
}