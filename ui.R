#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "GRN VTOOLS"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data import", tabName = "Data import", icon = icon("th")),
      fileInput("file1", "Choose a file"),
      menuItem("Normalisation", tabName = "Normalisation", icon = icon("th")),
      menuItem("Exploratory analysis", tabName = "Exploratory analysis", icon = icon("th")),
      menuItem("Differntial Expression", tabName = "Differntial Expression", icon = icon("th")),
      selectInput("Distibution","Please Select a Tool:", choices =c("SeqNet", "DIANE")),
      menuItem("Network Generation", tabName = "Network Generation", icon = icon("th"))
    )
  ),
  dashboardBody(
    tableOutput("content")
  )
)

server <- function(input, output) {
  output$content <- renderTable({
    infile <- input$file1
    if (is.null(infile)) return(NULL)
    read.csv(infile$datapath)
  })
}

shinyApp(ui, server)
