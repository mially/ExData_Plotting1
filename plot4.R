##Load the data:
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

##Subset 
plotdata <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ];

##Convert Date and Time
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep = " ");
plotdata$Timeline <- as.POSIXct(strptime(plotdata$DateTime, "%d/%m/%Y %H:%M:%S"));

##Build complex craph:
png("plot4.png");

par(mfcol=c(2,2), bg = "white");
plot(plotdata$Timeline, plotdata$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = NA);

plot(plotdata$Timeline, plotdata$Sub_metering_1, 
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering");
points(plotdata$Timeline, plotdata$Sub_metering_2, col= "red", type = "l");
points(plotdata$Timeline, plotdata$Sub_metering_3, col= "blue", type = "l");
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 2, 4), lty = 1, bty = "n");

plot(plotdata$Timeline, plotdata$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage");

plot(plotdata$Timeline, plotdata$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power");

##Save PNG
dev.off();