## cachematrix.R
## by Frank M. Berger, 23-Jan-2015; Frankfurt, Germany
## 
## coursera "R Programming"
## Programming Assignment Week 2


## Provide two functions:
##
##      the first function delivers a list with 4 (sub)functions to administer a matrix
##          subfunctions are: set(), get(), setinv() and getinv()
##                            - the latter will retrieve the inverse from the cache, if valid
##
##      the second function returns the inverse of matrix;
##      this will be either newly calculated or taken from the cache if the cache is valid


## The first function, makeCacheMatrix, returns a list with 4 functions that administer a matrix
##
## These functions are:
## 1. <set> set (store) the matrix
## 2. <get> get (retrieve) the matrix
## 3. <setinv> set (store) the inverse of the matrix
## 4. <getinv> get (retrieve) the inverse of the matrix

## code lines with message() functions are optional

makeCacheMatrix <- function(x = matrix()) {
    ## initially upon start, make the 'inverse matrix' cache invalid (not calculated yet)
    inv <- NULL
    
    ## define the set() function (store the matrix);
    ## any call to this function will NULLify the cached inverse
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    ## define the get() function (retrieve the matrix)
    get <- function() x
    
    ## define the setinv() function - stores the parameter in the cache
    setinv <- function(inverse) inv <<- inverse
    
    ## define the getinv() function - retrieves the parameter from the cache, no matter whether valid or NULL
    getinv <- function() inv
    
    ## generate a list with four functions as return value
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## The second function, cacheSolve, returns a matrix that is the inverse of <x>.
##
## To do so, it first checks whether the inverse has already been computed and cached (i.e., is valid).
## 
## If yes, the cache is returned, no calculation necessary
## If no, compute the inverse matrix and save it to the cache

cacheSolve <- function(x, ...) {
      
    ## retrieve the cached inverse and check whether it is valid (not NULL)
    inv <- x$getinv()
    
    if(!is.null(inv)) {
        ## cache is valid
        message("retrieving inverse of the matrix from the cache")
        return(inv)
    }
    ## otherwise (= NULL) cache is not valid (= NULL), therefore the inverse of the matrix must be newly calculated
    message("calculating the inverse of the matrix")
    
    ## first, retrieve matrix
    matrix <- x$get()
    
    ## then calculate the inverse of the matrix
    ## any additional arguments for cacheSolve will be passed onto solve()
    inv <- solve(matrix, ...)
    
    ## and store it in the cache
    x$setinv(inv)
    
    ## finally return the inverse of the matrix
    inv
}
