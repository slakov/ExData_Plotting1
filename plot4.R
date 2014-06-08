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

png("plot4.png", width=480, height=480)


par(mfrow=c(2,2))

##
plot(d2$Global_active_power, type="l",xlab="", ylab="Global Active Power" ,xaxt="n")
axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
##

##
plot(d2$Voltage, type="l",xlab="datetime", ylab="Voltage" ,xaxt="n")
axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
##

###
plot(d2$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering" ,xaxt="n")
lines(d2$Sub_metering_2, col="red")
lines(d2$Sub_metering_3, col="blue")
axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
##

##
plot(d2$Global_reactive_power, type="l",xlab="datetime", xaxt="n")
axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
##

dev.off()