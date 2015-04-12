source('getData.R')
# Calling this function will create the third plot
# if you supply the data set it will be used, otherwise it will download 
# and subset the raw data from the site url
# for details of this @see getData.R
# this way you only have to download and parse the data once.
create_plot_3 <- function(data=NULL){
  if (is.null(data)){
    message( 'loading the data')
    data <- get_data()
  }else{
    message ('using supplied data')
  }
  #create the plot so we can see it
  with(data, plot(date_time, Sub_metering_1, ylab='Energy Sub metering', type='l'))
  with(data, lines(date_time, Sub_metering_2, col='red'))
  with(data, lines(date_time, Sub_metering_3, col='blue'))
  legend("topright", lty = 'solid', col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'))
  #copy it into a file
  dev.copy(png, file = "plot3.png")
  dev.off()
  
  #return data, so you can chain methods
  data
  
}