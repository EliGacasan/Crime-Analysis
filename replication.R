
### 2015 Replication ### 

setwd("D:/R-4.0.3/RStudio/RProjects/Projects/Projects")

library(plyr)
library(tidyverse)
library(ggplot2)
library(lobstr)
library(combinat)

# WGTPERCY: Weight used to determine the average total persons 12 years and older during the collection year.
# The weight factor will contain all zeros for noninterview persons. BJS publications CRIMINAL VICTIMIZATION, YYYY
# use this weight to calculate person totals

# WGTHHCY: Weight used to determine the average total households during the NCVS. This weight takes into consideration that 
# the total period from which interviewers were taken spans 18 months, to allow for the six month reference period. This
# weighting factor will contain all zeros for noninterview households. BJS publications except CRIMINAL
# VICTIMIZATION, YYYY will use this weight to calculate household totals. 

# SERIES_WEIGHT: Victimization weight adjusted for series crimes. 

# Load data files 
load("E:/NCVS/ICPSR_36456-V1/ICPSR_36456/DS0003/36456-0003-Data.rda")
load("E:/NCVS/ICPSR_36456-V1/ICPSR_36456/DS0002/36456-0002-Data.rda")
load("E:/NCVS/ICPSR_36456-V1/ICPSR_36456/DS0001/36456-0001-Data.rda")

incidents <- da36456.0003
rm(da36456.0003)
colnames(incidents)


incidents = subset(incidents, incidents$V4022 != "(1) Outside U.S.")
incidents$violent = ifelse(as.numeric(incidents$V4529) <= 20, 1, 0)
incidents$property = ifelse(as.numeric(incidents$V4529) >= 24, 1, 0)
incidents$robbery <- ifelse(as.numeric(incidents$V4529) %in% c(5,6,7,8,9,10), 1, 0)



# Getting data into yearly list
incidents.year.2015 <- incidents %>% filter(YEAR == 2015)

# Weighted total number of victimized persons (by property and violence victimizations)
victims.totals.2015 <- xtabs(SERIES_WEIGHT ~ violent + property, data = incidents.year.2015)
victims.totals.2015.robbery <- xtabs(SERIES_WEIGHT ~ robbery, incidents.year.2015)
victims.totals.2015.weapon <- xtabs(SERIES_WEIGHT ~ V4049 + violent, incidents.year.2015)

# Access the person-level data file.
persons.year.2015 <- da36456.0002 %>% filter(YEAR == 2015)


# Weighted total number of persons
persons.totals.2015 <- xtabs(WGTPERCY ~ V3001, data = persons.year.2015)
persons.totals.2015

# Access the household-level data file.

households.year.2015 <- da36456.0001 %>% filter(YEAR == 2015); rm(da36456.0001)

# Find weighted number of households 
households.totals.2015 <- xtabs(formula = WGTHHCY ~ V2001, data = households.year.2015)
households.totals.2015

# Violent victimization rate per 1,000 persons
VVP <- as.numeric(format((as.numeric(victims.totals.2015[2,1]) / as.numeric(persons.totals.2015)) * 1000, digits = 4))
VVPWW <- as.numeric(format(((977841.5 / as.numeric(persons.totals.2015)) * 1000), digits=4))
PVH <- as.numeric(format(((victims.totals.2015[1,2] / households.totals.2015) * 1000), digits=4))
RP <- as.numeric(format(((victims.totals.2015.robbery[2] / persons.totals.2015) * 1000), digits=4))



# Calculate the rates.
cat("The rate of violent victimization per 1,000 persons is:", format(((victims.totals.2015[2,1] / persons.totals.2015) * 1000), digits=10), "\n")
cat("The rate of serious violent crime involving weapons per 1,000 persons is:", format(((977841.5 / persons.totals.2015) * 1000), digits=10), "\n")
cat("The rate of property victimization per 1,000 households is:", format(((victims.totals.2015[1,2] / households.totals.2015) * 1000), digits=4), "\n")
cat("The rate of robberies per 1,000 persons is:", format(((victims.totals.2015.robbery[2] / persons.totals.2015) * 1000), digits=4), "\n")




# Calculation of standard errors: To be continued! #

