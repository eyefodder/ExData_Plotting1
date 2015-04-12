source('getData.R')
# Calling this function will create the first plot
# if you supply the data set it will be used, otherwise it will download 
# and subset the raw data from the site url
# for details of this @see getData.R
# this way you only have to download and parse the data once.
create_plot_1 <- function(data=NULL){
  if (is.null(data)){
    message( 'loading the data')
    data <- get_data()
  }else{
    message ('using supplied data')
  }
  # create a histogram of the data
  h <- hist(data$Global_active_power, breaks=15, plot=FALSE)
  #display a plot
  plot(h, col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')
  
  #copy it into a file
  dev.copy(png, file = "plot1.png")
  dev.off()
  
  #return data, so you can chain methods
  data
}