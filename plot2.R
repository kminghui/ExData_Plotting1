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

##---Construct Plot 2---
png("plot2.png", width = 480, height = 480, bg = "transparent")##set background as transparent
plot(xdatetime, file$Global_active_power,type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
