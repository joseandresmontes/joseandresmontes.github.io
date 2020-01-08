#' Access All Available Charity Data
#' @description This function allows the users to access charity data from Charity Navigator API
#' through a variety of different parameters. Parameters should be left null if it is not of interest
#' so as to include all fields that have that parameter.
#' @param name search for a near match based on string.
#' @param state A two letter name.
#' @param sizeRange Search organizations within a bracket,
#' as measured in annual total expenses.
#' 1 = Up to $3.5MM,
#' 2 = $3.5MM to $13.5MM,
#' 3 = $13.5MM and up
#' @param limit Number of organizations that will be listed.
#' @examples
#' GetOrganizations()
#'
#' GetOrganizations(state = "CA",10)
#'
#' GetOrganizations(name = "Refresh")
#' @details
#' Returns a data.table with 39 columns filtered based on search query.
#' Certain columns will be empty unless user has a premium subscription.
#' @export

GetOrganizations <- function(name = NULL, state = NULL, sizeRange = NULL, limit = 10)
{

  charity_endpoint <- "https://api.data.charitynavigator.org/v2/Organizations"

  user <- httr::user_agent("R User")

  query_params <- list(app_key = Sys.getenv("CHARITY_APP_KEY"),
                       app_id = Sys.getenv("CHARITY_APP_ID"),
                       search = name,
                       pageSize = limit,
                       state = state)

  parameter_response <- httr::GET(charity_endpoint, user, query=query_params)

  if(parameter_response$status_code == 200)
  {
    content <- jsonlite::flatten(jsonlite::fromJSON(httr::content(parameter_response, "text")))
    data.table::data.table(content)
  }
  else
  {
    print("Error with request, please check query")
  }
}
