## Document ####################################################################
devtools::document()
usethis::use_tidy_description()
## Clean up ####################################################################

## Clear environment
rm(list = ls())

## Clear plots
dev.off()  # Only if there IS a plot

## Clear console
cat("\014")  # ctrl+L

## Testing #####################################################################
ki_timeseries_values(
ts_id = "36587042",
start_date = "2015-12-01",
end_date = "2018-01-01"
)

values <- get_timeseries_values()
values
