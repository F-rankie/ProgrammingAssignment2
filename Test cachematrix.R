# Test cachematrix.R

source('C:/Statistik/R/coursera/ProgrammingAssignment2/cachematrix.R')


data <- rnorm(100)      # generate test data (a 10x10 matrix)
dim(data) = c(10,10)

f <- makeCacheMatrix()  # f is now the list of the four functions set(), get(), setinv(), getinv()
f$set(data)             # store the matrix (to the environment of f)
f$get()                 # retrieve the matrix
i1 <- cacheSolve(f)     # first time: inverse of matrix will be calculated
i2 <- cacheSolve(f)     # second time: will be taken from cache
i3 <- cacheSolve(f)     # third and subsequent times: again, from the cache

data <- rnorm(100)      # generate NEW test data
dim(data) = c(10,10)

f$set(data)             # again, store the data -> this will NULLify the cache for the inverse of the matrix
i1 <- cacheSolve(f)     # now, first time again - have to calculate
i2 <- cacheSolve(f)     # again, the second and subsequent times will come from the cache.