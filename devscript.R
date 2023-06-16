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
values <- get_timeseries_values()
values
