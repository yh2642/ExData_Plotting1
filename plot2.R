## Loading and processing the data
entire_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
target_data1 <- subset(entire_data, Date == "1/2/2007")
target_data2 <- subset(entire_data, Date == "2/2/2007")
target_data <- rbind(target_data1, target_data2)
for(i in 1:nrow(target_data)){
        target_data$DateTime[i] <- paste(target_data$Date[i], target_data$Time[i])
}
target_data$DateTime <- strptime(target_data$DateTime, "%d/%m/%Y %H:%M:%S")
target_data$Global_active_power = as.numeric(target_data$Global_active_power)

## plot the exploratory graph:
with(target_data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## save it as png
dev.copy(png, file = "plot2.png")
dev.off()

