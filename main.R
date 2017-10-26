
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

ui <- navbarPage("Analyze Function Option",
                 navbarMenu("Frequency Domain Transfrom",
                           tabPanel("Spectrum Raw Data",
                                    fileInput("org_data_in",h3("Time serial Data:")),
                                    downloadButton("store_fft_raw_data","Download")
                           ),
                           tabPanel("Amlitude Data"
                                    
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
  
  })

}

shinyApp(ui=ui, server = server)



