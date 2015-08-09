require(sqldf)
require(lubridate)
file <- "household_power_consumption.txt"
query <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
df <- read.csv.sql(file, sql = query, sep = ";", stringsAsFactors = FALSE)
df$datetime <- paste(df$Date, df$Time, sep = " ")
df$datetime <- dmy_hms(df$datetime)

# Plot 3
Sys.setlocale("LC_TIME", "English")
png("plot3.png", width = 480, height = 480)
plot(df$datetime, df$Sub_metering_1, type = 'l', xlab = "", 
     mar = c(5, 5, 4, 0) + 0.1,
     ylab = "Energy sub metering", main = "",
     ylim = c(0, max(df$Sub_metering_1)))
par(new = TRUE)
plot(df$datetime, df$Sub_metering_2, type = 'l', axes = FALSE, 
     xlab = "", ylab = "", main = "", col='red', 
     ylim = c(0, max(df$Sub_metering_1)))
par(new = TRUE)
plot(df$datetime, df$Sub_metering_3, type = 'l', axes = FALSE, 
     xlab = "", ylab = "", main = "", col='blue', 
     ylim = c(0, max(df$Sub_metering_1)))
legend("topright", lty = c(1, 1, 1), seg.len = c(2, 2, 2), 
       col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
