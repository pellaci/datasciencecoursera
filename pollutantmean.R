pollutantmean <- function(directory="specdata", pollutant,id=1:332){
  
  data_vec <- vector()
  
  for (i in id) {
    while(nchar(i) < 3) {
      i <- paste(0,i,sep = "")
    }
    
    filename <- paste(directory,"/",i,".csv",sep="")
    pollu_data<- read.csv(file=filename)
    col_data <- pollu_data[pollutant]
    clean_data<-col_data[which(!is.na(col_data)),]
    
    data_vec <-  c(data_vec, clean_data)
  }
  
  mean(as.vector(data_vec,mode = "numeric"))
}