## Problem 1 Histogram plot of "Global_active_power" variable.  


## Read data files
datafile <- "household_power_consumption.txt"
readindata <- read.table(datafile, header = TRUE, sep = ";")

## Subset the data which are for only 2 days
chosendata <- readindata[(readindata$Date == '1/2/2007') | (readindata$Date == '2/2/2007'),]

## Global_active_power has to be converted to numeric to be able to plot.
chosendata$Global_active_power <- as.numeric(as.character(chosendata$Global_active_power))

## Plotting Histogram of "Global_active_power" variable
windows()
hist(chosendata$Global_active_power,col = "red",xlab= "Global Active Power (kilowatts)", ylab="Frequency",
     main = "Global Active Power")

dev.copy(png, file="plot1.png", width=480, height=480)

dev.off()
