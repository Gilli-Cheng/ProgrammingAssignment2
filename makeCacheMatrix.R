## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
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