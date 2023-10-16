#' Water quality data from two sites on the Arroyo Colorado
#'
#' Includes water quality monitoring data from two sites on the Arroyo Colorado
#' from 1973 through 2022. Multiple parameters are included. Station 13079 is upstream
#' of station 13074. In 2011 a treatment wetland started operation at a wastewater
#' treatment plant between the two stations. This data is typical of data
#' downloaded from the TCEQ SWQMIS database.
#'
#' @docType data
#'
#' @usage data(arroyo_wetland)
#'
#' @format A data frame with 7005 rows and 13 variables:
#' \describe{
#'   \item{basin_id}{two digit basin identifier}
#'   \item{segment_id}{TCEQ segment identifier}
#'   \item{on_segment}{data flag indicating location of station}
#'   \item{rfa_tag_id}{trip identifer, records with the same value were collected on the same trip and location}
#'   \item{station_id}{station identifier}
#'   \item{end_date}{monitoring trip date}
#'   \item{end_time}{time of collection}
#'   \item{end_depth}{depth sample was collected at}
#'   \item{monitoring_type}{monitoring type codes are used to distinguish monitoring purporse. TCEQ DMRG includes a record and description of type codes}
#'   \item{parameter_code}{distinct parameter codes described below}
#'   \item{greater_than_less_than}{censored data flag; "<" indicates below the minimum detection limit, ">" indicates above the maximum detection limit}
#'   \item{value}{measured value}
#'   \item{mdl}{minimum detection limit reported by the lab}
#'   }
#' @details
#' Additional details...
#' LIST OF UNIQUE PARAMETERS
#' * 00010 TEMPERATURE, WATER (DEGREES CENTIGRADE)
#' * 00061 FLOW  STREAM, INSTANTANEOUS (CUBIC FEET PER SEC)
#' * 00070 TURBIDITY, (JACKSON CANDLE UNITS)
#' * 00076 TURBIDITY,HACH TURBIDIMETER (FORMAZIN TURB UNIT)
#' * 00094 SPECIFIC CONDUCTANCE,FIELD (US/CM @ 25C)
#' * 00300 OXYGEN, DISSOLVED (MG/L)
#' * 00400 PH (STANDARD UNITS)
#' * 00530 RESIDUE, TOTAL NONFILTRABLE (MG/L)
#' * 00600 NITROGEN, TOTAL (MG/L AS N)
#' * 00610 NITROGEN, AMMONIA, TOTAL (MG/L AS N)
#' * 00620 NITRATE NITROGEN, TOTAL (MG/L AS N)
#' * 00625 NITROGEN, KJELDAHL, TOTAL (MG/L AS N)
#' * 00630 NITRITE PLUS NITRATE, TOTAL ONE LAB DETERMINED VALUE (MG/L AS N)
#' * 00665 PHOSPHORUS, TOTAL, WET METHOD (MG/L AS P)
#' * 00671 ORTHOPHOSPHATE PHOSPHORUS,DISS,MG/L,FLDFILT<15MIN
#' * 00680 CARBON, TOTAL ORGANIC, NPOC (TOC), MG/L
#' * 01351 FLOW SEVERITY:1=No Flow,2=Low,3=Normal,4=Flood,5=High,6=Dry
#' * 31616 FECAL COLIFORM,MEMBR FILTER,M-FC BROTH, #/100ML
#' * 31648 E. COLI, MTEC, MF, #/100 ML
#' * 31699 E. COLI, COLILERT, IDEXX METHOD, MPN/100ML
#' * 70507 ORTHOPHOSPHATE PHOSPHORUS,DISS,MG/L,FILTER >15MIN
#' * 72053 DAYS SINCE PRECIPITATION EVENT (DAYS)
#' * 74069 STREAM FLOW ESTIMATE (CFS)
#' * 82078 TURBIDITY,FIELD NEPHELOMETRIC TURBIDITY UNITS, N
#' * 82903 DEPTH OF BOTTOM OF WATER BODY AT SAMPLE SITE
#' * 89835 FLOW MTH 1=GAGE 2=ELEC 3=MECH 4=WEIR/FLU 5=DOPPLER
#'
#' @source TCEQ SWQMIS database.
#'
"arroyo_wetland"


#' Dissolved oxygen measurements from the Tres Palacios river
#'
#' Data from the Texas Commission on Environmental Quality Surface Water Quality
#' Monitoring Information System. The `Average_DO`` field is the mean of dissolved oxygen
#' concentrations (mg/L) measured at a field site at that day. The `Min_DO` field
#' is the minimum dissolved oxygen concentration measured at that site on that day.
#'
#' @docType data
#'
#' @usage data(dissolved_oxygen)
#'
#' @format A data frame with 236 rows and 6 variables:
#' \describe{
#'   \item{station_id}{unique water quality monitoring station identifier}
#'   \item{end_date}{sampling date in yyyy-mm-dd format}
#'   \item{parameter_code}{unique parameter code}
#'   \item{parameter_description}{parameter description with units}
#'   \item{average_do}{mean of dissolved oxygen measurement, in mg/L}
#'   \item{min_do}{minimum of dissolved oxygen measurement, in mg/L}
#'   }
#' @source \url{https://www80.tceq.texas.gov/SwqmisPublic/public/default.htm}
#'
"dissolved_oxygen"



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
#' @source \url{https://www.ncei.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00003904/detail}
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
#' @source NOAA National Estuarine Research Reserve System (NERRS). 2022. System-Wide Monitoring Program. NOAA NERRS Centralized Data Management Office. \url{http://cdmo.baruch.sc.edu/}.
#'
"mission_aransas_nerr"



#' Discharge measurements from field-based surveys
#'
#' Includes field based stream discharge and stage measurements at the Como Creek
#' NEON field station.
#'
#' @docType data
#'
#' @usage data(neon_stage_discharge)
#'
#' @format A data frame with 134 rows and 36 variables. Primary variables of interest include:
#' \describe{
#'   \item{averageVelocityUnits}{}
#'   \item{averageVelocityUnitsQF}{}
#'   \item{collectDate}{}
#'   \item{collectedBy}{}
#'   \item{dataQF}{}
#'   \item{dischargeUnitsQF}{}
#'   \item{domainID}{}
#'   \item{filterParamTime}{}
#'   \item{finalDischarge}{Corrected measured stream discharge}
#'   \item{flowCalcQF}{}
#'   \item{flowCalculation}{}
#'   \item{handheldDeviceID}{}
#'   \item{lowVelocityFinalQF}{}
#'   \item{namedLocation}{}
#'   \item{profileName}{}
#'   \item{publicationDate}{}
#'   \item{recorduid}{}
#'   \item{release}{}
#'   \item{samplingProtocolVersion}{}
#'   \item{siteID}{}
#'   \item{stageImpractical}{}
#'   \item{startDate}{}
#'   \item{stationEntryTest}{}
#'   \item{streamStage}{Measured stream stage in meters}
#'   \item{streamStageUnits}{}
#'   \item{streamStageUnitsQF}{}
#'   \item{tapeDistanceUnits}{}
#'   \item{tapeDistanceUnitsQF}{}
#'   \item{totalDischarge}{}
#'   \item{totalDischargeCalcQF}{}
#'   \item{totalDischargeUnits}{}
#'   \item{uid}{}
#'   \item{velocitySensorID}{}
#'   \item{waterDepthUnits}{}
#'   \item{waterDepthUnitsQF}{}
#'   \item{waterEdge}{}
#'   }
#' @source NEON (National Ecological Observatory Network). n.d. Discharge Field Collection (DP1.20048.001), RELEASE-2022. \doi{10.48443/eaak-tt31}.
#'
"neon_stage_discharge"



#' Uranium and total dissolved solids
#'
#' Example dataset from Helsel et al. (2020) that includes
#' measured concentrations of total dissolved solids (tds) in mg/L and uranium
#' in parts per billion from the Ogallala aquifer.
#'
#' @docType data
#'
#' @usage data(uranium_tds)
#'
#' @format A data frame with 44 rows and 4 variables:
#' \describe{
#'   \item{tds}{Total dissolved solids in mg/L}
#'   \item{uranium}{Uranium concentration in ppb}
#'   \item{hco3}{cation composition percent milliequivalents}
#'   \item{definition}{not documented}
#'   }
#' @source Helsel, D.R., Hirsch, R.M., Ryberg, K.R., Archfield, S.A., and Gilroy, E.J., 2020, Statistical Methods in Water Resources - Supporting Materials: U.S. Geological Survey data release, \doi{10.5066/P9JWL6XR}
#'
"uranium_tds"
