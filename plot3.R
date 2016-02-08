## Problem 3 plot of "Enegry Sub Metering" and "Time" variables.  


## Read data files
datafile <- "household_power_consumption.txt"
readindata <- read.table(datafile, header = TRUE, sep = ";")

## Subset the data which are for only 2 days
chosendata <- readindata[(readindata$Date == '1/2/2007') | (readindata$Date == '2/2/2007'),]

## Global_active_power has to be converted to numeric to be able to plot.
## Time variable has to be converted to Date, Time, Hours, Minutes, Seconds to be able to plot.
## Sub_metering (1,2,3) data are also read in here for the this plot
chosendata$Global_active_power <- as.numeric(as.character(chosendata$Global_active_power))
chosendata$Date <- as.Date(chosendata$Date, format="%d/%m/%Y")
chosendata <- transform(chosendata, timesyaxis=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
chosendata$Sub_metering_1 <- as.numeric(as.character(chosendata$Sub_metering_1))
chosendata$Sub_metering_2 <- as.numeric(as.character(chosendata$Sub_metering_2))
chosendata$Sub_metering_3 <- as.numeric(as.character(chosendata$Sub_metering_3))

## Plotting Time, Submetering variables, Energy sub metering variables
windows()
plot(chosendata$timesyaxis,chosendata$Sub_metering_1, type = "l",xlab= "", ylab="Energy sub metering")
lines(chosendata$timesyaxis,chosendata$Sub_metering_2,col="red")
lines(chosendata$timesyaxis,chosendata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))


dev.copy(png, file="plot3.png", width=480, height=480)

dev.off()
