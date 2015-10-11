#read data
data <- read.table("household_power_consumption.txt", sep = ";",header = T,na.strings ="?", stringsAsFactors= F)

#format Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

#create device
png(file="plot2.png",height=480, width=480)

#draw plots
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Output png file
dev.off()