###Module 4 Course Project 1

##Read in raw file from working directory
rm(list=ls()) ##clear memory
rawfile <-read.table("household_power_consumption.txt", sep=";", header= TRUE,
                     stringsAsFactors=FALSE, na.strings = "?")
#head(rawfile);nrow(rawfile) ##check sample records and check total records (2075259 records)

##Form the required file by subsetting 2 specific days of records
file <- subset(rawfile, Date == "1/2/2007" | Date == "2/2/2007") 
#head(file);nrow(file) ##check sample records and check total records (2880 records)

##convert Date of char type and Time of char type into Date/Time format
temp <- paste(file$Date, file$Time)
xdatetime <- strptime(temp, "%d/%m/%Y %H:%M:%S")

##---Construct Plot 4---  
png("plot4.png", width = 480, height = 480, bg = "transparent")##set background as transparent

##Set the graphics parameters for the required layout
par(mfrow = c(2,2), font = 2) ##plot direction : topleft, topright, bottomleft, bottomright

##Construct topleft graph (Plot 2):
plot(xdatetime, file$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")

##Construct topright graph:
plot(xdatetime, file$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

##Construct bottomleft graph (Plot 3):
plot(xdatetime, file$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(xdatetime, file$Sub_metering_2, type = "l", col = "red")
points(xdatetime, file$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, bty = "n")

##Construct bottomright graph:
plot(xdatetime, file$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()