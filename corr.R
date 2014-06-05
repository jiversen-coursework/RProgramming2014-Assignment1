corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  corr <- vector(mode="double") #NB: must be numeric, per instructions
  ncomplete <- complete(directory)
  goodidx <- ncomplete[["nobs"]] > threshold #NB must be > not >= because default=0
  id <- ncomplete[["id"]][goodidx]
  for (i in seq_along(id)) {
    fname <- paste(directory, "/", sprintf("%03d",id[i]),'.csv',sep="")
    sensordata <- read.csv(fname)
    gooddata <- sensordata[complete.cases(sensordata),]
    corr[i] = cor(gooddata[["sulfate"]], gooddata[["nitrate"]])
  }
  corr
}
