ki_timeseries_values(
  ts_id = "359042",
  start_date = "2015-12-01",
  end_date = "2018-01-01"
)

input <- read.csv(file=file.path("data", "mvca_wiski_timeseries.csv"), header=TRUE, sep = ",", dec = ".")

parameters <- unique(input$Parameter)

parameter <- select.list(parameters, title = "Select a Parameter")
