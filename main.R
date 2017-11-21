
#############################################################################
################This is about the Master Thesis Demo program ################
# Function:                                                                 #
#    1. Explain what is the frequency domain.                               #
#    2. Explain what is the Cohrence.                                       #
# Auth: Roddy_HUng                                                          #
# Date: 2017.10.19                                                          #
# Final Version: 0.1                                                        #
#############################################################################
#############################################################################

library(shiny)
library(ggplot2)
source('function/gen_fft_data.R')
source('function/amp_fft_data.R')

ui <- navbarPage("Analyze Function Option",
                 navbarMenu("Frequency Domain Transfrom",
                    tabPanel("Spectrum Raw Data",
                       sidebarLayout(
                          sidebarPanel(
                             fileInput("org_data_in",h3("Time serial Data:")),
                             downloadButton("store_fft_raw_data","Download")
                             #,verbatimTextOutput("debug")
                          ),
                          mainPanel(
                               
                          )
                       )
                    ),
                    tabPanel("Amlitude Data",
                       sidebarLayout(
                          sidebarPanel(
                             fileInput("raw_data",h3("Frequency Domain Data:")),
                             downloadButton("store_fft_amp_data","Download"),
                             verbatimTextOutput("debug")
                          ),
                          mainPanel(
                                 
                          )     
                       )
                    ),
                    tabPanel("Phase Data"
                    )
                 ),
                 navbarMenu("Coherence Analysis",
                           tabPanel("Single Frequency"),
                           tabPanel("Multi Frequency")
                           
                 ),
                 navbarMenu("Iverse Freq to Time Domain",
                           tabPanel("Single Data")
                           
                 ),
                 navbarMenu("Help",
                          tabPanel("About"
                          )
                 )

)


server <- function(input, output, session) {
   
   #creat the fft raw data
   observeEvent(input$org_data_in,{
    
      if (is.null(input$org_data_in))
          return(NULL)
     
      fft.raw_data<<-gen.fft_data(input$org_data_in)
     
   })
  
   #calculate the fft amplitude data  
   observeEvent(input$raw_data,{
      if (is.null(input$raw_data))
          return(NULL)
      fft.amp_data<<-amp.fft_data(input$raw_data)
      output$debug<-renderPrint({
         #fft.raw_data
         fft.amp_data
      })
    
   })
   
   #download the fft raw data file
   output$store_fft_raw_data<-downloadHandler(
        filename = function() {
          paste(input$org_data_in$name, ".RData",sep = "")
        }, 
         content = function(file){
           if(is.null(fft.raw_data))
             return(NULL)
           save(fft.raw_data, file=file)
         }
      )

   #download the fft amplitude data file   
   output$store_fft_amp_data<-downloadHandler(
     filename = function() {
       paste(input$raw_data$name, ".csv", sep = "")
     }, 
     content = function(file){
       if(is.null(fft.amp_data))
         return(NULL)
       save(fft.raw_data, file=file)
       write.csv(fft.amp_data, file, row.names = FALSE)
     }
   )
   
}

shinyApp(ui=ui, server = server)


