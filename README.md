
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ctppflows

<!-- badges: start -->
<!-- badges: end -->

The goal of ctppflows is to provide tract level home-work flow data from
the Census Transportation Planning Package (CTPP) in a much more
convenient format for R users, particularly those without a Microsoft
Access license.

The entire tract dataset is included in the package as a documented R
object, and the package also contains helper functions for properly
calculating aggregate flows and their margins of error.

## Installation

You can install the development version of ctpp\_flows from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gregmacfarlane/ctpp_flows")
```

## Example

After installing the library, the `ctpp_flows` dataset is available as a
tibble lazy-loaded into your environment.

``` r
library(ctppflows)

# load 
ctpp_flows
#> # A tibble: 4,156,426 x 4
#>    residence   workplace    flow flow_moe
#>    <chr>       <chr>       <int>    <int>
#>  1 06073018700 06073018700 20950     2359
#>  2 51710000902 51710000902 10155     2516
#>  3 45079011501 45079011501  8735      875
#>  4 13215010802 13215010802  7720     1144
#>  5 06071010402 06071010402  7040      848
#>  6 12033002400 12033002400  6480      838
#>  7 08041003802 08041003802  6380      583
#>  8 36071013600 36071013600  5430      551
#>  9 48029161400 48029161400  5410      909
#> 10 17097863003 17097863003  5245     1069
#> # … with 4,156,416 more rows
```

The `aggregate_flows` function will aggregate the flows to a state or
county. The aggregated margin of error is computed as

$$\sqrt{\sum_{i=1}^N MOE_i^2}$$

The results can then be passed into other R formatting functions.

``` r
aggregate_flows("state") %>%
  filter(residence == "49") %>% #utah residents
  filter(flow > 1000)
#> # A tibble: 3 x 4
#> # Groups:   residence [1]
#>   residence workplace    flow   moe
#>   <chr>     <chr>       <int> <dbl>
#> 1 49        06           2203  464.
#> 2 49        32           1977  359.
#> 3 49        49        1111666 7598.
```
