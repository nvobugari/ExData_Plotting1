##plot2.R

## histogram of Global Active POwer usage on 2007-02-01 and 2007-02-02
##reading data from local file and loading it to a variable powerData
# reads the data from household_power_consumption.txt which is located in the directory specified
powerData <- read.table('Assignments/Exploratory Data Analysis/household_power_consumption.txt', sep=';',header=T,
                        colClasses = c('character', 'character', 'numeric',
                                       'numeric', 'numeric', 'numeric',
                                       'numeric', 'numeric', 'numeric'),
                        na.strings='?')

##pasting Data and Time variables and formatting them into the required format.
powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

##subsetting the data for the required Dates
powerData <- subset(powerData, 
                    as.Date(DateTime) >= as.Date("2007-02-01") &
                      as.Date(DateTime) <= as.Date("2007-02-02"))

##creating the plot.png
png("plot2.png", height=480, width=480)

##creating the plot
plot(powerData$DateTime, 
     powerData$Global_active_power,
     pch=NA,
     xlab="",
     ylab="Global Active Power (kilowatts)")
     

lines(powerData$DateTime, powerData$Global_active_power)

##closing the PNG file
dev.off()

