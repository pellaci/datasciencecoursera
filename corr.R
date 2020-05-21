corr <- function(directory, threshold = 0){
  
  cr_vec <- vector()
  
  for (i in 1:332){
    j <- i
    while(nchar(j) < 3) {
      j <- paste(0,j,sep = "")
    }
    
    filename <- paste(directory,"/",j,".csv",sep="")
    pollu_data<- read.csv(file=filename)
    
    rows <- NROW(pollu_data[which(!is.na(pollu_data$sulfate) & !is.na(pollu_data$nitrate)),])
    
    if (rows > threshold){
      cr <- cor(pollu_data['sulfate'],pollu_data['nitrate'],use='complete.obs')
      cr_vec <- c(cr_vec,cr)
    }
  }
  
  cr_vec
}