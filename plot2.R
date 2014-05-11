#plot2

setwd('c:/r/Git')
library(sqldf)
SqlQry <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql ('household_power_consumption.txt',SqlQry,sep=';')
attach(data)

data[,1] <- as.Date(data[,1],format = '%d/%m/%Y')
date_time <- paste (as.character(Date),Time,sep=' ')
date_time <- strptime (date_time, format='%d/%m/%Y %H:%M:%S')
data$DateTime <- date_time
png(filename='plot2.png')
plot(data$DateTime, Global_active_power,type='l',ylab='Global Active Power \ (kilowatts\ )',xlab='')
dev.off()