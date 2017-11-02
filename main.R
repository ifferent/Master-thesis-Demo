
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
source('function/gen_fft_data.R')

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
   
   observeEvent(input$org_data_in,{
    
      if (is.null(input$org_data_in))
          return(NULL)
     
     fft.raw_data<<-gen.fft_data(input$org_data_in)
     
     output$debug<-renderPrint({
         #fft.raw_data
     })
     
   })
      output$store_fft_raw_data<-downloadHandler(
        filename = function() {
          paste(input$org_data_in$name, ".RData")
        }, 
         content = function(file){
           if(is.null(fft.raw_data))
             return(NULL)
           save(fft.raw_data, file=file)
         }
      )
}

shinyApp(ui=ui, server = server)


