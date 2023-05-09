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
  observeEvent(input$network_button, {
    
    
    

  observeEvent(input$tool_choice, {
    if (input$tool_choice == "SeqNet")  
      p <- 100
    data1<-read_csv('grn-vtool\Data_Cortex_Nuclear')
    network_1 <- random_network(p)
    generated_data <- gen_rnaseq(n, data1)
    g<-plot(network_2)
  
      output$network_plot<-renderPlot({plot(g)})
      output$network_plot_2<-renderPlot({plot(g)})
  })##end if seqnet


  })##end network butten

}##end function
