#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




# Define server logic required to draw a histogram
function(input, output, session) {
 
  p <- 100
   network_1 <- random_network(p)
   network_2 <- as_single_module(network_1)
   g<-plot(network_1)
  observeEvent(input$SeqNet, {
  output$p1<-renderPlot({plot(g)})

  })

}
