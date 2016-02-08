## Download the files
## This step only needs to do once to download the data file 

if(!file.exists("./Week1project")){dir.create("./Week1project")}
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataurl, destfile="./Week1project/exdata-data-household_power_consumption.zip")

## Assign the zip file to extract.
powerfile <- "exdata-data-household_power_consumption.zip"
unzip(powerfile, list = FALSE, overwrite = TRUE)
