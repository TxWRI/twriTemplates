#' Dissolved oxygen measurements from the Tres Palacios river
#'
#' Data from the Texas Commission on Environmental Quality Surface Water Quality
#' Monitoring Information System. The `Average_DO`` field is the mean of dissolved oxygen
#' concentrations (mg/L) measured at a field site at that day. The `Min_DO` field
#' is the minimum dissolved oxygen concentration measured at that site on that day.
#'
#' @docType data
#'
#' @usage data(Dissolved_Oxygen)
#'
#' @format A data frame with 236 rows and 6 variables:
#' \describe{
#'   \item{Station_ID}{unique water quality monitoring station identifier}
#'   \item{Date}{sampling date in yyyy-mm-dd format}
#'   \item{Param_Code}{unique parameter code}
#'   \item{Param_Desc}{parameter description with units}
#'   \item{Average_DO}{mean of dissolved oxygen measurement, in mg/L}
#'   \item{Min_DO}{minimum of dissolved oxygen measurement, in mg/L}
#'   }
#' @source https://www80.tceq.texas.gov/SwqmisPublic/public/default.htm
#'
"Dissolved_Oxygen"



#' Temperature and precipitation data at Easterwood Airport
#'
#' Data from the National Oceanic Atmospheric Administration (NOAA) Climate
#' Data Online for Easterwood Airport in College Station, Texas. Includes
#' daily maximum temperature and daily precipitation records from approximately
#' 2010 through 2017.
#'
#' @docType data
#'
#' @usage data(easterwood_weather)
#'
#' @format A data frame with 4045 rows and 5 variables:
#' \describe{
#'   \item{station}{station identifier}
#'   \item{date}{sampling date in yyyy-mm-dd format}
#'   \item{name}{station name}
#'   \item{dailymaximumdrybulbtemperature}{daily maximum tempreature in degrees F.}
#'   \item{dailyprecipitation}{daily total precipitation in inches}
#'   }
#' @source https://www.ncei.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00003904/detail
#'
"easterwood_weather"


#' Water quality data for Mission and Aransas National Estuarine Research Reserve (NERR)
#'
#' Fifteen minute water quality data. Includes station, date-time, temperature,
#' specific conductance, salinity, and associated
#' data qualifiers from 2020 through 2021 for the Mission and Aransas (MAR)
#' National Estuarine Research Reserve (NERR). Data from NOAA NERRS Centralized
#' Data Management Office.
#'
#' @docType data
#'
#' @usage data(mission_aransas_nerr)
#'
#' @format A data frame with 140352 rows and 10 variables:
#' \describe{
#'   \item{StationCode}{station identifier, factor with levels `marabwq` and `marcewq` for Aransas Bay and Copano East stations respectively.}
#'   \item{DateTimeStamp}{sampling date-time in yyyy-mm-dd  hh:mm::ss format.}
#'   \item{Temp}{water temperature in degrees Celsius.}
#'   \item{F_Temp}{data qualifier, <0> indicates approved data.}
#'   \item{SpCond}{specific conductance in µS/cm.}
#'   \item{F_SpCond}{data qualifier, <0> indicates approved data.}
#'   \item{Sal}{Salinity in ppt.}
#'   \item{F_Sal}{data qualifier, <0> indicates approved data.}
#'   \item{DO_mgl}{dissolved oxygen in mg/L.}
#'   \item{F_DO_mgl}{data qualifier, <0> indicates approved data.}
#'   }
#' @source NOAA National Estuarine Research Reserve System (NERRS). 2022. System-Wide Monitoring Program. NOAA NERRS Centralized Data Management Office. http://cdmo.baruch.sc.edu/.
#'
"mission_aransas_nerr"
