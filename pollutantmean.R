pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # JRI: I question why they ask for a 'flat' mean, rather than a mean of sensor means
  
  #sensormeans = vector();
  flatlist = vector();
  for (i in id) {
    fname <- paste(directory, "/", sprintf("%03d",i),'.csv',sep="")
    #cat(fname)
    sensordata <- read.csv(fname)
    #sensormeans[id] <- mean(sensordata[[pollutant]], na.rm=TRUE)
    flatlist = c(flatlist, sensordata[[pollutant]])
  }
  #return(mean(sensormeans, na.rm=TRUE))
  return(mean(flatlist, na.rm=TRUE))
}
