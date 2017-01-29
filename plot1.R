## Peer Graded Assignment: Exploratory Data Analysis Course Project1
## Week 1 Submittal
## Script: plot1.R
## R. Henning
## January 28, 2017

# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#         
# 1.    Date: Date in format dd/mm/yyyy
# 2.    Time: time in format hh:mm:ss
# 3.    Global_active_power: household global minute-averaged active power (in kilowatt)
# 4.    Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5.    Voltage: minute-averaged voltage (in volt)
# 6.    Global_intensity: household global minute-averaged current intensity (in ampere)
# 7.    Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
#       It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave 
#       (hot plates are not electric but gas powered).
# 8.    Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
#       It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9.    Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
#       It corresponds to an electric water-heater and an air-conditioner.

## STEP 0: load required packages

# load the reshape2 package (will be used in STEP 5)
library(reshape2)

# Load the SQLDF package
require(sqldf)

# Load the tcltk package
require(tcltk)

#Load the date package
require(date)

#Load minor tick mark package Hmisc
require(Hmisc)

## STEP 1: set my working directory
setwd("C:/Projects/Coursera/Exploratory Data Analysis/Week 1/exdata%2Fdata%2Fhousehold_power_consumption")

## Step 2: Read data into data frame
hpc_data <- read.table("household_power_consumption.txt",header= TRUE, sep = ";", na.strings = "?")
head(hpc_data)

# specify date format in hpc_datat file so R can read the dates
hpc_data$Date<-as.Date(hpc_data$Date,"%d/%m/%Y")

## create new character version of dt variable
hpc_data$chardt <- as.character(hpc_data$Date)

## create February 1 - February 2, 2007 subset dataframe from Household Power Consumption data by querying the data
## query in sqldf on chardt instead
feb2007 <- sqldf("SELECT * FROM hpc_data WHERE chardt IN ('2007-02-01','2007-02-02')")

png("Plot1.png",width=480, height=480)

hist(feb2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()

