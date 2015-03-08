##Load the data:
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

##Subset 
plotdata <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ];

##Convert Date and Time
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep = " ");
plotdata$Timeline <- as.POSIXct(strptime(plotdata$DateTime, "%d/%m/%Y %H:%M:%S"));

##Build the scatterplot of Sub metering 1, 2 and 3 on one graph
png("plot3.png");

plot(plotdata$Timeline, plotdata$Sub_metering_1, 
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering",
     bg = 1);
points(plotdata$Timeline, plotdata$Sub_metering_2, col= "red", type = "l");
points(plotdata$Timeline, plotdata$Sub_metering_3, col= "blue", type = "l");
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 2, 4), lty = 1);

##Save PNG
dev.off();