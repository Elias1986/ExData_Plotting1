#Obtaining data ordered
Data <- read.csv("~/Desktop/R/EDA/P1/Data.csv", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

#Eliminating Rest of Information
Data1 <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Data)

#Converting dates into Date/Time classes
dt <- paste(as.Date(Data1$Date), Data1$Time)
Data1$Datetime <- as.POSIXct(dt)

#Ploting
plot(Data1$Global_active_power~Data1$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Saving Plot
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
