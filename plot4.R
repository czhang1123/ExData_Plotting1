
#####################################################
## Exploratory Data Analysis - Course Project One
#####################################################

## set work directory to be the location with the data

############################################
## read in data
############################################

## read in household electric power consumption data
ds <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')
head(ds)
str(ds)

## change Date variable to Date class
ds$Date <- as.Date(ds$Date, '%d/%m/%Y')

## subset to two dates 2007-02-01 and 2007-02-02
hspower <- subset(ds, Date %in% as.Date(c('2007-02-01', '2007-02-02')) )

## change Time variable to DateTime class
hspower$Time <- strptime(paste(hspower$Date, hspower$Time), '%Y-%m-%d %H:%M:%S', tz='GMT')

## check out the data
head(hspower)

############################################
## Plots
############################################

## Plot 4

# define graph window to be 2 by 2
par(mfrow = c(2, 2))

# first plot
plot(1:nrow(hspower), hspower$Global_active_power, type = 'l', xaxt = 'n', ylab = 'Global Active Power', xlab = '')
axis(1, at=c(1, min(which(hspower$Date == as.Date('2007-02-02'))), nrow(hspower)+1), labels=c('Thu','Fri','Sat'))

# second plot
plot(1:nrow(hspower), hspower$Voltage, type = 'l', xaxt = 'n', ylab = 'Voltage', xlab = 'datetime')
axis(1, at=c(1, min(which(hspower$Date == as.Date('2007-02-02'))), nrow(hspower)+1), labels=c('Thu','Fri','Sat'))

# third plot
plot(1:nrow(hspower), hspower$Sub_metering_1, type = 'l', xaxt = 'n', ylab = 'Energy sub metering', xlab = '')
axis(1, at=c(1, min(which(hspower$Date == as.Date('2007-02-02'))), nrow(hspower)+1), labels=c('Thu','Fri','Sat'))
points(hspower$Sub_metering_2, type = 'l', col = 'red')
points(hspower$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', bty='n', lty=c(1,1), col = c('black','red','blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# fourth plot
plot(1:nrow(hspower), hspower$Global_reactive_power, type = 'l', xaxt = 'n', ylab = 'Global_reactive_power', xlab = 'datetime')
axis(1, at=c(1, min(which(hspower$Date == as.Date('2007-02-02'))), nrow(hspower)+1), labels=c('Thu','Fri','Sat'))

# save to png file with dimension 480 x 480
dev.copy(png, file = 'plot4.png', width = 480, height = 480)
dev.off()


