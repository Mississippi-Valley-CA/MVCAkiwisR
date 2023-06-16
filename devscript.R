## Clean up ####################################################################

## Clear environment
rm(list = ls())

## Clear plots
dev.off()  # Only if there IS a plot

## Clear console
cat("\014")  # ctrl+L

## Get the timeseries ID #######################################################

## Load the CSV file #
input <- read.csv(file=file.path("data", "mvca_wiski_timeseries.csv"), header=TRUE, sep = ",", dec = ".")

## Select the parameter #
parameters <- sort(unique(input$Parameter))
parameter <- select.list(parameters, title = "Select a Parameter")

## Narrow down the timeseries list by filtering for the parameter #
inputAfterParameter <- input[input$Parameter == parameter, ]

# Select the station #
stations <- sort(unique(inputAfterParameter$Station))
station <- select.list(stations, title = "Select a Station")

## Narrow down the timeseries list further by filtering for the station #
inputAfterStation <- inputAfterParameter[inputAfterParameter$Station == station, ]

## Select the period #
periods <- sort(unique(inputAfterStation$TS.Name))
period <- select.list(periods, title = "Select a Period")

## Get the ts details and call in a variable #
timeseries <- inputAfterStation[inputAfterStation$TS.Name == period, ]
tsID <- timeseries$TS.ID

## Pick a start date and an end date within the bounds available #
prompt=paste0("No. of levels in attribute ", i, ":")
startDate <- as.Date(readline(prompt=paste0("Enter Start Date of ", substr(timeseries$From, 1, 10), " or later: ")),"%Y-%m-%d", tz = "EST")

endDate <- as.Date(readline(prompt=paste0("Enter End Date of ", substr(timeseries$To, 1, 10), " or later: ")),"%Y-%m-%d", tz = "EST")

## Load the timeseries data #
values <- ki_timeseries_values(
  ts_id = timeseries$TS.ID,
  start_date = startDate,
  end_date = endDate
)

