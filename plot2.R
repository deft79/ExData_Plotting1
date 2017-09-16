dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(fdata$Date), fdata$Time)
fdata$Datetime <- as.POSIXct(datetime)

## Plot 2
attach(fdata)
plot(fdata$Global_active_power~fdata$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
detach(fdata)


