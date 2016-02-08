## Problem 2 plot of "Global_active_power" and "Time" variables.  
                
                
## Read data files
datafile <- "household_power_consumption.txt"
readindata <- read.table(datafile, header = TRUE, sep = ";")
                
## Subset the data which are for only 2 days
chosendata <- readindata[(readindata$Date == '1/2/2007') | (readindata$Date == '2/2/2007'),]
                
## Global_active_power has to be converted to numeric to be able to plot.
## Time variable has to be converted to Date, Time, Hours, Minutes, Seconds to be able to plot.
chosendata$Global_active_power <- as.numeric(as.character(chosendata$Global_active_power))
chosendata$Date <- as.Date(chosendata$Date, format="%d/%m/%Y")
chosendata <- transform(chosendata, timesyaxis=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
                        
## Plotting Histogram of "Global_active_power" variable
windows()
plot(chosendata$timesyaxis,chosendata$Global_active_power, type = "l",xlab= "", ylab="Global Active Power (kilowatts)")
                     

dev.copy(png, file="plot2.png", width=480, height=480)
                
dev.off()
