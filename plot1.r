#Script 1

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