library(SkeletonExistingPredictionModelStudy)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "./SkeletonExistingPredictionModelStudyResults"

# Details for connecting to the server:
dbms <- "you dbms"
user <- 'your username'
pw <- 'your password'
server <- 'your server'
port <- 'your port'

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)

# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- 'cdm database schema'
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'work database schema'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'SkeletonExistingPredictionModelStudyCohort'

# TAR settings
sampleSize <- NULL
riskWindowStart <- 1
startAnchor <- 'cohort start'
riskWindowEnd <- 365
endAnchor <- 'cohort start'
firstExposureOnly <- F
removeSubjectsWithPriorOutcome <- F
priorOutcomeLookback <- 99999
requireTimeAtRisk <- F
minTimeAtRisk <- 1
includeAllOutcomes <- T


#=======================

SkeletonExistingPredictionModelStudy::execute(connectionDetails = connectionDetails,
                                    cdmDatabaseSchema = cdmDatabaseSchema,
                                    cdmDatabaseName = cdmDatabaseName,
                                    cohortDatabaseSchema = cohortDatabaseSchema,
                                    cohortTable = cohortTable,
                                    sampleSize = sampleSize,
                                    riskWindowStart = riskWindowStart,
                                    startAnchor = startAnchor,
                                    riskWindowEnd = riskWindowEnd,
                                    endAnchor = endAnchor,
                                    firstExposureOnly = firstExposureOnly,
                                    removeSubjectsWithPriorOutcome = removeSubjectsWithPriorOutcome,
                                    priorOutcomeLookback = priorOutcomeLookback,
                                    requireTimeAtRisk = requireTimeAtRisk,
                                    minTimeAtRisk = minTimeAtRisk,
                                    includeAllOutcomes = includeAllOutcomes,
                                    outputFolder = outputFolder,
                                    createCohorts = T,
                                    runAnalyses = T,
                                    viewShiny = T,
                                    packageResults = F,
                                    minCellCount= 5,
                                    verbosity = "INFO",
                                    cdmVersion = 5)
