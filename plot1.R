## Loading and processing the data
entire_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
target_data1 <- subset(entire_data, Date == "1/2/2007")
target_data2 <- subset(entire_data, Date == "2/2/2007")
target_data <- rbind(target_data1, target_data2)
target_data$Global_active_power <- as.numeric(target_data$Global_active_power)

## plot the exploratory graph:
hist((target_data$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power(kilowatts)")

## save it as png
dev.copy(png, file = "plot1.png")
dev.off()