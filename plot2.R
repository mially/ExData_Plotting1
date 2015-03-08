##Load the data:
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

##Subset 
plotdata <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ];

##Convert Date and Time
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep = " ");
plotdata$Timeline <- as.POSIXct(strptime(plotdata$DateTime, "%d/%m/%Y %H:%M:%S"));

##Build the scatterplot of Global Active Power
png("plot2.png");

plot(plotdata$Timeline, plotdata$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = NA,
     bg = 1);

##Save PNG
dev.off();