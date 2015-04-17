#' Aggregate flows to specified geography
#' 
#' 
#' @param geography one of \code{c("state", "county")} specifying the level of 
#'  aggregation desired.
#' @return a \code{tbl_df(data_frame)} with the \code{ctpp_flows} flow data aggregated
#'  to the specified geographic level.
#' @import dplyr
#'  
#' @details This function uses \code{dplyr}'s efficient interfaces to aggregate
#' the flows to a specified geographic level. The flow estimates are summed, 
#' and the margins of error are aggregated using Census' recommended formula,
#' \deqn{\sqrt{\sum_i (x_i^2)}}
#' 
#' @examples
#' aggregate_flows("state")
#' 
#' @export
aggregate_flows <- function(geography = c("state", "county")){
  
  if(geography == "state"){
    df <- ctpp_flows %>%
      mutate(
        residence = get_state(residence),
        workplace = get_state(workplace)
      ) %>%
      group_by(residence, workplace) %>%
      summarise(
        flow = sum(flow),
        moe = sqrt(sum(flow_moe^2))
      )
  } else if(geography == "county"){
    df <- ctpp_flows %>%
      mutate(
        residence = get_county(residence, with_state = TRUE),
        workplace = get_county(workplace, with_state = TRUE)
      ) %>%
      group_by(residence, workplace) %>%
      summarise(
        flow = sum(flow),
        moe = sqrt(sum(flow_moe^2))
      )
  }
  
  df
  
}
