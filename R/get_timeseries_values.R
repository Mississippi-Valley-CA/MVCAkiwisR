#' Prompt user for all needed inputs and then get values for the time series id.
#'
#' @export
#' @description Asks the user for details to narrow down on the timeseries and then returns time series values for given time series id and date range.
#' @author Daniel Post, MVCA, \email{dpost@@mvc.on.ca}
#' @return A tibble with the columns returned by the script ki_timeseries_values.
#' @examples
#' \dontrun{
#' get_timeseries_values()
#' }
#'

get_timeseries_values <- function() {
    ## Load the CSV file #
    input <- read.csv("https://waterdata.quinteconservation.ca/KiWIS/KiWIS?format=csv&datasource=0&timezone=EST&dateformat=yyyy-MM-dd%20HH:mm:ss&service=kisters&type=queryServices&metadata=false&request=getTimeseriesList&station_no=MVCA1*,MVCA2*,MVCA3*,MVCA4*,MVCA5*,MVCA6*,MVCA7*,MVCA8*,MVCA9*,WISKI-0321,02KF01*,02KF001,02KF005,02KF006,02KF020&returnfields=station_name,station_no,ts_id,ts_name,parametertype_name,stationparameter_name,coverage", header=TRUE, sep = ";", dec = ".")

    ## Select the parameter #
    parameters <- sort(unique(input$parametertype_name))
    parameter <- select.list(parameters, title = "Select a Parameter")

    ## Narrow down the timeseries list by filtering for the parameter #
    inputAfterParameter <- input[input$parametertype_name == parameter, ]

    # Select the station #
    stations <- sort(unique(inputAfterParameter$station_name))
    station <- select.list(stations, title = "Select a Station")

    ## Narrow down the timeseries list further by filtering for the station #
    inputAfterStation <- inputAfterParameter[inputAfterParameter$station_name == station, ]

    ## Select the period #
    periods <- sort(unique(inputAfterStation$ts_name))
    period <- select.list(periods, title = "Select a Period")

    ## Get the ts details and call in a variable #
    timeseries <- inputAfterStation[inputAfterStation$ts_name == period, ]
    tsID <- timeseries$ts_id

    ## Pick a start date and an end date within the bounds available #
    startDate <- as.Date(readline(prompt=paste0("Enter Start Date of ", substr(timeseries$from, 1, 10), " or later: ")),"%Y-%m-%d", tz = "EST")

    endDate <- as.Date(readline(prompt=paste0("Enter End Date of ", substr(timeseries$to, 1, 10), " or later: ")),"%Y-%m-%d", tz = "EST")

    ## Get the timeseries values #
    values <- ki_timeseries_values(
    ts_id = timeseries$ts_id,
    start_date = startDate,
    end_date = endDate
    )

    return(values)
}
