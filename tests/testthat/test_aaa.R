## Some tests of Alt()

test_that("some tests of the Davies package", {


    tol <- 1e-4
    params <- c(10,1,1)
    expect_true(abs(pdavies(10, params) - 0.5) < tol)
    expect_true(all(abs(pdavies(c(10,10), params) - 0.5) < tol))

    f <- function(x){ddavies(x, params)}
    expect_true(abs(integrate(f,0,10)$value - 0.5) < tol)
    expect_true(abs(integrate(f,0,11)$value - pdavies(11, params)) < tol)

    

    

})
