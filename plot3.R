#read data
data <- read.table("household_power_consumption.txt", sep = ";",header = T,na.strings ="?", stringsAsFactors= F)

#format Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

#create device
png(file="plot3.png",height=480, width=480)

#draw plots
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
#add legends
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Output png file
dev.off()