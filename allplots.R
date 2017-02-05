#Exploratory Data Analysis Course Project 1

#Setup and Loading File
bd<-read.table('household_power_consumption.txt',header = T,sep = ";",colClasses = "character")

#Re-classing Necessary Columns
bd$DateTime<-as.POSIXct(paste(bd[,1],bd[,2]),format="%d/%m/%Y %H:%M:%S")
bd$Date<-as.POSIXct(bd[,1],format="%d/%m/%Y")


#Subsetting by Dates Feb 1 - Feb 2, 2007

feb1<-as.character(bd[,1])==("2007-02-01")

feb2<-as.character(bd[,1])==("2007-02-02")

days<-feb1|feb2

mydf<-bd[days,]

#Reclassing necessary columns
for(i in 3:9){
mydf[,i]<-as.numeric(mydf[,i])
}

#Plot 1
par(mfrow=c(1,1))
hist(mydf$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")

dev.copy(png,"plot1.png")
dev.off()

#Plot 2
par(mfrow=c(1,1))
plot(x = mydf$DateTime,y=mydf$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")

dev.copy(png,"plot2.png")
dev.off()

#Plot 3
par(mfrow=c(1,1))
with(mydf,plot(x=DateTime, y=Sub_metering_1,xlab="",ylab="Energy sub metering",col="black",type="l",ylim=c(0,40)))
par(new=T)
with(mydf,plot(x=DateTime, y=Sub_metering_2,ylab="",xlab="",col="red",type="l",ylim=c(0,40)))
par(new=T)
with(mydf,plot(x=DateTime, y=Sub_metering_3,ylab="",xlab="",col="blue",type="l",ylim=c(0,40)))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.75)

dev.copy(png,"plot3.png")
dev.off()

#Plot 4

#Setup
par(mfrow=c(2,2))

#1
hist(mydf$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")

#2
plot(x = mydf$DateTime,y=mydf$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")

#3
with(mydf,plot(x=DateTime, y=Sub_metering_1,xlab="",ylab="Energy sub metering",col="black",type="l",ylim=c(0,40)))
par(new=T)
with(mydf,plot(x=DateTime, y=Sub_metering_2,ylab="",xlab="",col="red",type="l",ylim=c(0,40)))
par(new=T)
with(mydf,plot(x=DateTime, y=Sub_metering_3,ylab="",xlab="",col="blue",type="l",ylim=c(0,40)))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty = "n",lty=1,cex=.75)

#4
with(mydf, plot(x = DateTime,y=Global_reactive_power,type = "l"))

dev.copy(png,"plot4.png")
dev.off()
