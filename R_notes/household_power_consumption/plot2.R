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

# plot2
plot(dat$Datetime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,filename='plot2.png')
dev.off


