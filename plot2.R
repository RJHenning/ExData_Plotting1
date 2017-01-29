## Peer Graded Assignment: Exploratory Data Analysis Course Project1
## Week 1 Submittal
## Script: plot2.R
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

## Load required packages

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

## Set my working directory
setwd("C:/Projects/Coursera/Exploratory Data Analysis/Week 1/exdata%2Fdata%2Fhousehold_power_consumption")

hpc_data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpc_data$DateTime = paste(hpc_data$Date, hpc_data$Time)
hpc_data$DateTime = as.POSIXlt(hpc_data$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc_data$Date = NULL
hpc_data$Time = NULL

hpc_data_subset <- subset(hpc_data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

# Plot to PNG file
png("plot2.png", width=480, height=480)

plot(hpc_data_subset$DateTime,hpc_data_subset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Turn off PNG
dev.off()