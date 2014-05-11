

setwd('c:/r/Git')
library(sqldf)
SqlQry <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql ('household_power_consumption.txt',SqlQry,sep=';')
attach(data)

data[,1] <- as.Date(data[,1],format = '%d/%m/%Y')
date_time <- paste (as.character(Date),Time,sep=' ')
date_time <- strptime (date_time, format='%d/%m/%Y %H:%M:%S')
data$DateTime <- date_time
plot(data$DateTime, data$Sub_metering_1 ,type='l',ylab='Energy sub metering',xlab='')
lines(data$DateTime, data$Sub_metering_2)
lines(data$DateTime, data$Sub_metering_3)
