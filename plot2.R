
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

## Plot 2

plot(1:nrow(hspower), hspower$Global_active_power, type = 'l', xaxt = 'n', ylab = 'Global Active Power (kilowatts)', xlab = '')
axis(1, at=c(1, min(which(hspower$Date == as.Date('2007-02-02'))), nrow(hspower)+1), labels=c('Thu','Fri','Sat'))

# save to png file with dimension 480 x 480
dev.copy(png, file = 'plot2.png', width = 480, height = 480)
dev.off()
