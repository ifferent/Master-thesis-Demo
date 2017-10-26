gen.fft_data<-function(path.source, path.target, period)
{
  if((grepl(".csv",path.source)||grepl(".CSV",path.source))==FALSE)
    return("檔案格式非CSV檔")
  if((period!="month")&&(period!="season")&&(period!="year"))
    return("週期輸入錯誤")
  
  time_serial.period<-period
  raw<-read.csv(path.source,header=TRUE)
  table.size<-dim(raw)
  time_serial.fft<-matrix(rep(0,table.size[1]*(table.size[2]-1)),ncol=(table.size[2]-1))
  
  for(i in 2:table.size[2])
  {
    time_serial.fft[ ,(i-1)]<-fft(raw[ ,i])
  }
  
  save(time_serial.fft,time_serial.period,file=path.target)
} 