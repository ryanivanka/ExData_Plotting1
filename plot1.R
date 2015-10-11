#read data
data <- read.table("household_power_consumption.txt", sep = ";",header = T,na.strings ="?", stringsAsFactors= F)

#format Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create device
png(file="plot1.png",height=480, width=480)

#Draw plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Output png file
dev.off()