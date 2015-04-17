#' Get the state-level FIPS code
#'
#' \code{get_state} returns the 2-digit state FIPS code from a complete FIPS
#' string.
#' 
#' @param fips A character vector of complete FIPS strings.
#' @return a character vector with the 2-digit state code.
#' @examples 
#' get_state(ctpp_flows$residence[1:10])
#' 
#' @export
#' @seealso \code{\link{get_county}}, \code{\link{get_tract}} 
#' 
get_state <- function(fips){
  # digits 1 and 2 have state FIPS code
  substr(fips, 1, 2)
}

#' Get the county-level FIPS code
#'
#' \code{get_county} returns the 3-digit county FIPS code from a complete FIPS
#' string.
#' 
#' @param fips A character vector of complete FIPS strings.
#' @param with_state Include the 2-digit state code? Default 
#'   \code{with_state = FALSE}
#' @return a character vector with the 3-digit county code, unless 
#'   \code{with_state = TRUE} in which case a 5-digit state and county code 
#'   concatenation.
#' @examples 
#' get_county(ctpp_flows$residence[1:10])
#' get_county(ctpp_flows$residence[1:10], with_state = TRUE)
#' 
#' @export
#' @seealso \code{\link{get_county}}, \code{\link{get_tract}} 
#' 
get_county <- function(fips, with_state = FALSE){
  if(with_state){
    # digits 1 and 2 have state FIPS code
    substr(fips, 1, 5)
  } else {
    # digits 3 through 5 have county FIPS code
    substr(fips, 3, 5)
  }
}
