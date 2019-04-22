#
#Display Global Active Power Histogram
#
#Read power consumption data
consumos<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
#Select registers of required dates
registros<-consumos[consumos$Date=="1/2/2007" | consumos$Date=="2/2/2007",]
#Open device
png(file="plot1.png",height=480,width=480)

with(registros,hist(as.numeric(as.character(Global_active_power)),
                    main="Global Active Power",
                    xlab="Global Active Power (kilowatts)",
                    ylab="Frequency",
                    ylim=c(0,1200),
                    col="red"))
dev.off()
