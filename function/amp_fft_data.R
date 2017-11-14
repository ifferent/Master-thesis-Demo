amp.fft_data<-function(path.source)
{
  if(grepl(".RData",path.source$name)==FALSE)
    return("non RData file")
  #if((period!="month")&&(period!="season")&&(period!="year"))
  #time_serial.period<-period
  
  load(path.source$datapath)
  
  fft.amp<-Mod(fft.raw_data)
  
  return(fft.amp)
} 