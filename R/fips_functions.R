#' Get the state-level FIPS code
#'
#' \code{get_state} returns the 2-digit state FIPS code from a complete FIPS
#' string.
#' 
#' @param fips A character vector of complete FIPS strings.
#' 
#' @return a character vector with the 2-digit state code.
#' 
#' @examples 
#' get_state(ctpp_flows$residence)
#' 
#' @export
#'
#' @seealso \code{\link{get_county}}, \code{\link{get_tract}} 
#' 
get_state <- function(fips){
  # digits 1 and 2 have state FIPS code
  substr(fips, 1,2)
}
