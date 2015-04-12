###Module 4 Course Project 1

##Read in raw file from working directory
rm(list=ls()) ##clear memory
rawfile <-read.table("household_power_consumption.txt", sep=";", header= TRUE,
                     stringsAsFactors=FALSE, na.strings = "?")
#head(rawfile);nrow(rawfile) ##check sample records and check total records (2075259 records)

##Form the required file by subsetting 2 specific days of records
file <- subset(rawfile, Date == "1/2/2007" | Date == "2/2/2007") 
#head(file);nrow(file) ##check sample records and check total records (2880 records)

##---Construct Plot 1---
png("plot1.png", width = 480, height = 480, bg = "transparent") ##set background as transparent
hist(file$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main ="Global Active Power")
dev.off()
