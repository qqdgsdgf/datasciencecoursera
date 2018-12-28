# get data
setwd("/Users/yun/datasciencecoursera/R_notes/household_power_consumption")
list.files()

# read data
dat <- read.table("household_power_consumption.txt", header=T,
                  sep=";", na.strings = "?",
                  colClasses = c(rep("character",2), rep("numeric",6)))
str(dat)

dat$Datetime <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
dat$Date  <- as.Date(dat$Date, "%d/%m/%Y") # error: / is ignored
dat <- dat[dat$Date>="2007-02-01"&dat$Date<="2007-02-02",]

# plot3
plot(dat$Datetime,dat$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="")
lines(dat$Datetime,dat$Sub_metering_2,type="l",col='red')
lines(dat$Datetime,dat$Sub_metering_3,type="l",col='blue')

legend(x = 'topright', lty = 1, col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,filename='plot3.png')
dev.off

