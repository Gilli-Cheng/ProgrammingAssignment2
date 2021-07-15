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