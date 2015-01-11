r = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F, na.strings="?")

r$date2=as.Date(r$Date, "%d/%m/%Y")
rn=r[r$date2 >= as.Date("2007-02-01", "%Y-%m-%d") & r$date2 <= as.Date("2007-02-02", "%Y-%m-%d"), ]
rn$datetime=strptime(paste(rn$Date, rn$Time), "%d/%m/%Y %H:%M:%S")

dev.off()
par(mfrow = c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(rn, {plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")})
with(rn, {points(datetime, Sub_metering_2, type="l", col="red")})
with(rn, {points(datetime, Sub_metering_3, type="l", col="blue")})
legend( "topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(mar=c(4,4,2,1), oma=c(0,0,2,0))
mtext("Plot 3", side=3, outer=TRUE, adj=0)
dev.copy(png, file="plot3.png")
dev.off()