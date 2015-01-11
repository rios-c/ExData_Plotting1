r = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F, na.strings="?")



r$date2=as.Date(r$Date, "%d/%m/%Y")
rn=r[r$date2 >= as.Date("2007-02-01", "%Y-%m-%d") & r$date2 <= as.Date("2007-02-02", "%Y-%m-%d"), ]

dev.off()
par(mfrow = c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))

with( rn, { hist(Global_active_power, main="Global Active Power", col='red', xlab="Global Active Power (kilowatts)", nclass=12)})
mtext("Plot 1", side=3, outer=TRUE, adj=0)


dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
