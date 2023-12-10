## Put comments here that give an overall description of what your
## functions do
# This .R script contains function which finds the inverse of a matrix. As getting
# an inverse of a matrix is memory and time consuming, once the inverse of a given
# matrix is calcualted, it will be cached, so that the cached inverse matrix is 
# retrieved, if the inverse of the same matrix is called. 

## Write a short comment describing this function
# Function stores four main function to 
# 1. set a given matrix to a object in global environment
# 2. get the matrix value
# 3. set the inverse of the matrix in global environment
# 4. get the inverse of the matrix which is already cached. 
makeCacheMatrix <- function(x = matrix()) {
        mat_inverse <- NULL
        set_mat <- function(y) {
          message("set the function")
          x <<- y
          mat_inverse <<- NULL
        }
        get_mat <- function() x
        set_inverse_mat <- function(inverse) mat_inverse <<- inverse
        get_inverse_mat <- function() mat_inverse
        list(set_mat = set_mat, 
             get_mat = get_mat,
             set_inverse_mat = set_inverse_mat,
             get_inverse_mat = get_inverse_mat)
}


## Write a short comment describing this function
# Funcion  calculates inverse of a function which is set through the makeCacheMatrix
# function. If the inverse of the matrix in not cached, it will automatically cached
# cached the value, otherwise, calcuate the value of the matrix. 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mat_inverse <- x$get_inverse_mat()
        if(!is.null(mat_inverse)) {
          message("getting cached data")
          return(mat_inverse)
        }
        data <- x$get_mat()
        mat_inverse <- solve(data)
        x$set_inverse_mat(mat_inverse)
        mat_inverse
}




