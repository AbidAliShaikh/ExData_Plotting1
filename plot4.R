setwd('c:/r/Git')
library(sqldf)
SqlQry <- "SELECT * from file WHERE Date ='1/2/2007' OR  Date='2/2/2007'"
data <- read.csv.sql ('household_power_consumption.txt',SqlQry,sep=';')
attach(data)


png (filename='plot4.png')
par(mfrow=c(2,2))

hist(Global_active_power,  main='',xlab="Global Active Power (kilowatts)",col='red')

plot(data$DateTime, data$Voltage,type='l',ylab='Voltage',xlab='datetime')

plot(data$DateTime, data$Sub_metering_1 ,type='l',ylab='Energy sub metering',xlab='')
lines(data$DateTime, data$Sub_metering_2,col='red')
lines(data$DateTime, data$Sub_metering_3,col='blue')
legend ('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_2'),lwd=c(1,1,1),col=c('black','red','blue'),bty='n',pt.cex=.5)

plot(data$DateTime, data$Global_reactive_power,type='l',xlab='datetime')

dev.off()