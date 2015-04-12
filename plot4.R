## Loading and processing the data
entire_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
target_data1 <- subset(entire_data, Date == "1/2/2007")
target_data2 <- subset(entire_data, Date == "2/2/2007")
target_data <- rbind(target_data1, target_data2)
for(i in 1:nrow(target_data)){
        target_data$DateTime[i] <- paste(target_data$Date[i], target_data$Time[i])
}
target_data$DateTime <- strptime(target_data$DateTime, "%d/%m/%Y %H:%M:%S")
target_data$Global_active_power <- as.numeric(target_data$Global_active_power)
target_data$Global_reactive_power <- as.numeric(target_data$Global_reactive_power)
target_data$Voltage<- as.numeric(target_data$Voltage)
target_data$Sub_metering_1 <- as.numeric(target_data$Sub_metering_1)
target_data$Sub_metering_2 <- as.numeric(target_data$Sub_metering_2)
target_data$Sub_metering_3 <- as.numeric(target_data$Sub_metering_3)

## plot the exploratory graph:
par(mfrow = c(2,2))
with(target_data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(target_data, plot(DateTime, Voltage, type = "l", ylab = "Voltage"))
with(target_data, {plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                   points(DateTime, Sub_metering_2, type = "l", col = "red")
                   points(DateTime, Sub_metering_3, type = "l", col = "blue")})
legend("topright", pch = "——", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(target_data, plot(DateTime, Global_reactive_power, type = "l"))

## save it as png
dev.copy(png, file = "plot4.png")
dev.off()