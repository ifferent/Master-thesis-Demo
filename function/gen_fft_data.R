gen.fft_data<-function(path.source)#, path.target, period)
{
  if((grepl(".csv",path.source$name)||grepl(".CSV",path.source$name))==FALSE)
      return("non csv file")
  #if((period!="month")&&(period!="season")&&(period!="year"))
  #time_serial.period<-period

  raw<-read.csv(path.source$datapath,header=TRUE)
  table.size<-dim(raw)
  time_serial.fft<-matrix(rep(0,table.size[1]*(table.size[2]-1)),ncol=(table.size[2]-1))
  
  for(i in 2:table.size[2])
  {
    time_serial.fft[ ,(i-1)]<-fft(raw[ ,i])
  }
  
  return(time_serial.fft)
} 