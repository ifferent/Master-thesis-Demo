
#############################################################################
################This is about the Master Thesis Demo program ################
# Function:                                                                 #
#    1. Explain what is the frequency domain.                               #
#    2. Explain what is the Cohrence.                                       #
# Auth: Roddy_HUng                                                          #
# Date: 2017.10.19                                                          #
# Final Version: 0.1                                                        #
#############################################################################


library(shiny)

ui <- navbarPage("Analyze Function Option",
                tabPanel("FreqDomainDemo"
                ),
                tabPanel("Coherence Calculate"
                ),
                navbarMenu("Spectum Order",
                           tabPanel("Phase")
                )

)


server <- function(input, output, session) {

}

shinyApp(ui=ui, server = server)



