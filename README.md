The Davies distribution
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="man/figures/Davies.png" width = "150" align="right" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/Davies)](https://cran.r-project.org/package=Davies)
<!-- badges: end -->

# Overview

The Davies distribution is a flexible family of distributions for
non-negative observations; it is particularly suitable for right-skewed
data. Hankin and Lee (2006) set out mathematical properties of the
Davies distribution and the `Davies` package is showcased here. It is
defined in terms of its quantile function

![Q(p;c,\\lambda_1,\\lambda_2) = \\frac{Cp^{\\lambda_1}}{(1-p)^{\\lambda_2}}](https://latex.codecogs.com/png.latex?Q%28p%3Bc%2C%5Clambda_1%2C%5Clambda_2%29%20%3D%20%5Cfrac%7BCp%5E%7B%5Clambda_1%7D%7D%7B%281-p%29%5E%7B%5Clambda_2%7D%7D "Q(p;c,\lambda_1,\lambda_2) = \frac{Cp^{\lambda_1}}{(1-p)^{\lambda_2}}")

<img src="man/figures/README-fig_one-1.png" width="100%" />

<img src="man/figures/README-fig_two-1.png" width="100%" />

We may sample from this distribution using `rdavies()`:

``` r
params <- c(2,0.1,0.1)
rdavies(10,params)
#>  [1] 2.479476 2.007425 1.403187 1.948492 2.607155 1.759633 2.135626 2.370888
#>  [9] 2.090710 1.711254
```

Moments are given by
![E(X^k)=C^kB\\left(1+k\\lambda_1,1-k\\lambda_2\\right)](https://latex.codecogs.com/png.latex?E%28X%5Ek%29%3DC%5EkB%5Cleft%281%2Bk%5Clambda_1%2C1-k%5Clambda_2%5Cright%29 "E(X^k)=C^kB\left(1+k\lambda_1,1-k\lambda_2\right)")
where ![B](https://latex.codecogs.com/png.latex?B "B") is the beta
function. In the package this is given by `M()`, which is a convenience
wraper for `davies.moment()`. Numerical verification for the second
(non-central) moment:

``` r
c(mean(rdavies(1e6,params)^2),M(2,params))
#> [1] 4.275985 4.275837
```

## Estimation

The least-squares technique described in Hankin and Lee 2006 is not
implemented, but the package implements a maximum-likelihood estimate:

``` r
x <- rdavies(80,params)
p_estimate <- maximum.likelihood(x)
p_true <- params
p_estimate
#> [1] 2.04369738 0.12659572 0.06105991
(bias <- p_estimate - p_true)
#> [1]  0.04369738  0.02659572 -0.03894009
```
