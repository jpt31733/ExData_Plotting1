require(sqldf)
require(lubridate)
file <- "household_power_consumption.txt"
query <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
df <- read.csv.sql(file, sql = query, sep = ";", stringsAsFactors = FALSE)
df$datetime <- paste(df$Date, df$Time, sep = " ")
df$datetime <- dmy_hms(df$datetime)

# Plot 2
png("plot2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
plot(df$datetime, df$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
