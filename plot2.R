source('getData.R')
# Calling this function will create the second plot
# if you supply the data set it will be used, otherwise it will download 
# and subset the raw data from the site url
# for details of this @see getData.R
# this way you only have to download and parse the data once.
create_plot_2 <- function(data=NULL){
  if (is.null(data)){
    message( 'loading the data')
    data <- get_data()
  }else{
    message ('using supplied data')
  }
  #create the plot so we can see it
  plot(data$date_time, data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
  #copy it into a file
  dev.copy(png, file = "plot2.png")
  dev.off()
  
  #return data, so you can chain methods
  data
 
}