#
#Display Line plot of Global Active Power consumed per day
#
#Read power consumption data
consumos<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
#Select registers of required dates
registros<-consumos[consumos$Date=="1/2/2007" | consumos$Date=="2/2/2007",]
#Open device
png(file="plot2.png",height=480,width=480)

with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Global_active_power)),
                    ylab="Global Active Power (kilowatts)",
                    xlab="",
                    type="l"))
dev.off()