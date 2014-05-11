


setwd('c:/r/Git')
library(sqldf)
SqlQry <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql ('household_power_consumption.txt',SqlQry,sep=';')
attach(data)
png(filename='plot1.png')
hist(Global_active_power, main='Global Active Power', xlab="Global Active Power (kilowatts)",col='red')
dev.off()