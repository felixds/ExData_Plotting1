######################################################################################
## Author: Félix Ángel Fernández Alonso
## 
## Course: Master Data Science (Exploratory data analysis)
## 
## Date: 08 February 2015
## 
## Description:  Our overall goal here is simply to examine how household energy 
## usage varies over a 2-day period in February, 2007. Your task is to reconstruct 
## the following plots below, all of which were constructed using the base plotting 
## system. 
##
##########################    Plot number 1   ########################################

## loading libraries.
library(datasets);
Sys.setlocale(category="LC_TIME", locale="C");

######################################################################################
############################ LOADING and CLEANING PHASE ##############################
######################################################################################
######################################################################################
##
## loading the file and obtaining the variables and values that we need. that's means
## from 2007-02-01 and 2007-02-02. 
##
######################################################################################

# Loading file with only the dates from 2007-02-01 to 2007-02-02.

plot1 <- subset(read.table("./household_power_consumption.txt", 
                     header = TRUE,
                     fill = TRUE,
                     sep=";",
                     colClasses = "character"),
                     Date == "1/2/2007" | Date == "2/2/2007");
       

## convert to numeric and date values.
plot1$Global_active_power<-as.numeric(plot1$Global_active_power);
plot1$Sub_metering_1<-as.numeric(plot1$Sub_metering_1);
plot1$Sub_metering_2<-as.numeric(plot1$Sub_metering_2);
plot1$Sub_metering_3<-as.numeric(plot1$Sub_metering_3);
plot1$Date <- as.Date(plot1$Date, "%d/%m/%Y");

#Time conversion
time <- paste(plot1$Date, plot1$Time);
plot1$Time<- strptime(time, "%Y-%m-%d  %H:%M:%S");


######################################################################################
############################  PLOT 1 and GRAPHICS DEVICES  ##########################
######################################################################################
######################################################################################
##
## generating the plot 1 and creating the graphics devices (PNG)
##
######################################################################################

## definition of png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px");

## creating plot
hist(plot1$Global_active_power, col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)");

## close device
dev.off()
