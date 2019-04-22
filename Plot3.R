#
#Display line plot consume by sub metering by day
#
#Read power consumption data
consumos<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
#Select registers of required dates
registros<-consumos[consumos$Date=="1/2/2007" | consumos$Date=="2/2/2007",]
#Open device
png(file="plot3.png",height=480,width=480)

#For sub-metering 1
with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Sub_metering_1)),
                    ylab="Energy sub metering",
                    xlab="",
                    type="l"))
#Sub-metering 2
with(registros,lines(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Sub_metering_2)),
                    col="red"))
#Sub-metering 3
with(registros,lines(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                     as.numeric(as.character(Sub_metering_3)),
                     col="blue"))
#Display legends
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))
dev.off()