# Set example ts for testing
test_ts_ids = c("53686042","1395042")

# Skip if no internet connection
skip_if_net_down <- function(){
  if(has_internet()){
    return()
  }
  testthat::skip("No internet")
}

# Skip if unable to connect to Quinte server
skip_if_exp_down <- function(){
  if(exp_live()){
    return()
  }
  testthat::skip("Quinte server offline.")
}