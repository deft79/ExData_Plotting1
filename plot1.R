dataFile <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
fdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1
attach(fdata)
hist(as.numeric(Global_active_power), main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(fdata)

