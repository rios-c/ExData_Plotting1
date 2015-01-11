r = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F, na.strings="?")

r$date2=as.Date(r$Date, "%d/%m/%Y")
rn=r[r$date2 >= as.Date("2007-02-01", "%Y-%m-%d") & r$date2 <= as.Date("2007-02-02", "%Y-%m-%d"), ]
rn$datetime=strptime(paste(rn$Date, rn$Time), "%d/%m/%Y %H:%M:%S")

dev.off()
par(mfrow = c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(rn, {plot(datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")})
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
mtext("Plot 2", side=3, outer=TRUE, adj=0)
dev.copy(png, file="plot2.png")
dev.off()
