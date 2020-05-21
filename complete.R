complete <- function(directory ,id = 1:332){
  
  df <- data.frame()
  
  
  for ( i in id){
    j <- i
    while(nchar(j) < 3) {
      j <- paste(0,j,sep = "")
    }
    
    filename <- paste(directory,"/",j,".csv",sep="")
    pollu_data<- read.csv(file=filename)
    
    rows <- NROW(pollu_data[which(!is.na(pollu_data$sulfate) & !is.na(pollu_data$nitrate)),])
    
    df <- rbind(df, c(i,rows))
  }
  
  colnames(df) <- c('id','nobs')
  df
}