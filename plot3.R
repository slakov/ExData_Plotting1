
#read data
d <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# convert Date
#pa <- paste(d$Date, d$Time, sep=" ")
#s <- strptime(pa, format= "%d/%m/%Y %H:%M:%S")
s <- strptime(d$Date, format= "%d/%m/%Y")
s <- as.Date(s)
d$Date <- s

# subset the Data to two dates of interest
doi <- as.Date(c("2007-02-01","2007-02-02"))
d2 <- subset(d, Date %in% doi)


# plot3
png("plot3.png", width=480, height=480)

plot(d2$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering" ,xaxt="n")
lines(d2$Sub_metering_2, col="red")
lines(d2$Sub_metering_3, col="blue")
axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()