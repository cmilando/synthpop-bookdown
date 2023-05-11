#Author: Flannery Black-Ingersoll
#Purpose: PUMAS and Tracts: Create textfiles

#Libraries ----
library(tigris)
library(leaflet) #https://rstudio.github.io/leaflet/basemaps.html
library(sf)
library(dplyr)
library(utils)
library(readr)

# Datasets ----
MA_pumas <- pumas(state = "MA", year = 2021)
pumas <- c("00503",
           "00505",
           "02800",
           "01000",
           "00508",
           "00507",
           "00506",
           "03302",
           "00505",
           "03306",
           "01300")
MA_pumas_mywra <- subset(MA_pumas, MA_pumas$PUMACE10 %in% pumas)
MA_tracts <- tracts(state = "MA", year = 2021)

# Spatial join by tract centroids ----
centroids_tracts <- st_centroid(MA_tracts)
join_PUMA_centroids <- st_join(centroids_tracts, MA_pumas_mywra)
join_PUMA_centroids<- join_PUMA_centroids[!is.na(join_PUMA_centroids$STATEFP10),]
# Make and save files for each PUMA ----
PUMA_tracts <- as.data.frame(cbind(join_PUMA_centroids$GEOID,
                                   join_PUMA_centroids$PUMACE10))
PUMA_tracts <- rename(PUMA_tracts, TRACTGEOID = V1) 
PUMA_tracts <- rename(PUMA_tracts, PUMACE10 = V2) 
unique(PUMA_tracts$PUMACE10)

setwd("~/Desktop/WINTER2023/ResearchRotation/synthetic_population_code/CRESSHr")
PUMA_02800 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "02800","TRACTGEOID"])
PUMA_02800

PUMA_00503 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "00503","TRACTGEOID"])
PUMA_00503

PUMA_00505 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "00505","TRACTGEOID"])
PUMA_00505

PUMA_01000 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "01000","TRACTGEOID"])
PUMA_01000

PUMA_00508 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "00508","TRACTGEOID"])
PUMA_00508

PUMA_00507 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "00507","TRACTGEOID"])
PUMA_00507

PUMA_00506 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "00506","TRACTGEOID"])
PUMA_00506

PUMA_03302 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "03302","TRACTGEOID"])
PUMA_03302

PUMA_03306 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "03306","TRACTGEOID"])
PUMA_03306

PUMA_01300 <- data.frame(PUMA_tracts[PUMA_tracts$PUMACE10 == "01300","TRACTGEOID"])
PUMA_01300

# Join dictionary to tracts file
MA_tracts_mywra <- right_join(MA_tracts, PUMA_tracts, by = "TRACTCE")

# Save shapefile 