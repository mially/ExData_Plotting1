##Load the data:
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?");

##Subset 
plotdata <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ];

##Build the histogram of Global Active Power
png("plot1.png");

hist(plotdata$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     ylim = c(0, 1300),
     bg = 1);

##Save PNG
dev.off();

