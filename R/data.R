#' CTPP tract-to-tract work flows.
#' 
#' A dataset containing journey-to-work flow volumes between all census tracts
#' in the United States collected through the American Community Survey and 
#' distributed through the Census Transportation Planning Package.
#' 
#' @format A data frame with 4,156,426 rows and 4 variables:
#' \describe{
#' \item{residence}{FIPS code of residence tract.}
#' \item{workplace}{FIPS code of workplace tract.}
#' \item{flow}{Estimate of flow.}
#' \item{flow_moe}{Margin of error on flow estimate.}
#' }
#'  
#' @source \url{http://www.fhwa.dot.gov/planning/census_issues/ctpp/data_products/2006-2010_tract_flows/index.cfm}
#' 
"ctpp_flows"   