data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)

data$Date<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)   
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
   
subset1<-subset(data,Date<"2007-02-03")
subset1<-subset(subset1,Date>="2007-02-01")
rm(data)

attach(subset1)

#Plot1
library(png)
png("Plot1.png",width=480,height=480)
hist(Global_active_power,col=2,freq=T,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
