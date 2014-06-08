
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

# hist 1

#png("plot1.png", width=480, height=480)
#hist(d2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
#dev.off()

# plot22
png("plot2.png", width=480, height=480)

plot(d2$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)" ,xaxt="n")


axis (side=1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()