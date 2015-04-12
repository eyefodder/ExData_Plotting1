get_data <- function (){
    file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    #create a temporary file and download the data to it
    temp <- tempfile()
    download.file(file_url,temp, method='curl')
    
    #read the data into a datatable
    all_data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings='?', dec='.')
    
    #parse the date column
    all_data$Date <- as.Date(all_data$Date, '%d/%m/%Y')
    
    #get the subset of data we care about
    household_energy_data <- subset(all_data, Date == '2007-02-01' | Date == '2007-02-02')
    
    #combine Date and Time columns into a sngle date_time column and parse the result to a time format
    household_energy_data$date_time <- paste(household_energy_data$Date, household_energy_data$Time, sep=' ')
    household_energy_data$date_time <- strptime(household_energy_data$date_time, format='%Y-%m-%d %H:%M:%S' )
    household_energy_data
}