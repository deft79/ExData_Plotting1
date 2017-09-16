dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(fdata$Date), fdata$Time)
fdata$Datetime <- as.POSIXct(datetime)

# Plot 3
attach(fdata)
plot(Sub_metering_1 ~ Datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ Datetime, col = "Red")
lines(Sub_metering_3 ~ Datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(fdata)
