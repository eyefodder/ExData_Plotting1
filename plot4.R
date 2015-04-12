source('getData.R')
# Calling this function will create the fourth plot
# if you supply the data set it will be used, otherwise it will download 
# and subset the raw data from the site url
# for details of this @see getData.R
# this way you only have to download and parse the data once.
create_plot_4 <- function(data=NULL){
  if (is.null(data)){
    message( 'loading the data')
    data <- get_data()
  }else{
    message ('using supplied data')
  }
  #create the plot so we can see it
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(0, 0, 0, 0))
  with(data, {
    # PLOT 1
    plot(date_time, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
    
    # PLOT 2
    plot(date_time, Voltage, type='l', xlab='datetime', ylab='Voltage')
    #PLOT 3
    plot(date_time, Sub_metering_1, ylab='Energy Sub metering', type='l')
    lines(date_time, Sub_metering_2, col='red')
    lines(date_time, Sub_metering_3, col='blue')
    legend("topright", box.lwd=0, lty = 'solid', col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'))
    
    #PLOT 4
    plot(date_time, Global_reactive_power, type='l', xlab='datetime')
  })
      

  #copy it into a file
  dev.copy(png, file = "plot4.png")
  dev.off()
  
  #return data, so you can chain methods
  data
  
}