#
#Display line plot consume by sub metering by day
#
#Read power consumption data
consumos<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
#Select registers of required dates
registros<-consumos[consumos$Date=="1/2/2007" | consumos$Date=="2/2/2007",]
#Open device
png(file="plot4.png",height=480,width=480)

#To display 4 plots, 2 rows with 2 plots each
par(mfrow=c(2,2))

#First plot
with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Global_active_power)),
                    ylab="Global Active Power",
                    xlab="",
                    type="l"))
#Second plot
with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Voltage)),
                    ylab="Voltage",
                    xlab="datetime",
                    type="l"))
#Third plot- Sub metering 1
with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Sub_metering_1)),
                    ylab="Energy sub metering",
                    xlab="",
                    type="l"))
#Third plot- Sub metering 2
with(registros,lines(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                     as.numeric(as.character(Sub_metering_2)),
                     col="red"))
#Third plot- Sub metering 3
with(registros,lines(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                     as.numeric(as.character(Sub_metering_3)),
                     col="blue"))
#Third plot- Legends
with(registros,legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"),cex=0.75,box.lty=0))

#Fourth plot
with(registros,plot(strptime(as.character(paste(registros$Date,registros$Time)),format="%d/%m/%Y %H:%M:%S"),
                    as.numeric(as.character(Global_reactive_power)),
                    ylab="Global_reactive_power",
                    xlab="datetime",
                    type="l"))

dev.off()