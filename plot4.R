## Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.string = "?")

## Subset the two days required from the data
newdata <- subset(data, Date == '1/2/2007'| Date == '2/2/2007')

## Create a new DateTime column
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Save the plot in a png format
png("plot4.png", width = 480, height = 480)

## Plot in the same frame 4 plots in two cols and two rows
par( mfrow = c( 2, 2 ) )

plot1 <- plot(newdata$DateTime, newdata$Global_active_power, type = "l", col = "black", main = "", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 1.1 )

plot1

plot2 <- plot(newdata$DateTime, newdata$Voltage, type = "l", col = "black", main = "", ylab = "Voltage", xlab = "datetime", cex.lab = 1.1 )

plot2

plot3 <- plot(newdata$DateTime, newdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")

plot3 <- points(newdata$DateTime, newdata$Sub_metering_2, type = "l", col = "red")

plot3 <- points(newdata$DateTime, newdata$Sub_metering_3, type = "l", col = "blue")

plot3 <- legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot3

plot4 <- plot(newdata$DateTime, newdata$Global_reactive_power, type = "l", col = "black", main = "", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 1.1)


##legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), fill = NULL, col = par("col"), border = "black")

plot4

dev.off()
