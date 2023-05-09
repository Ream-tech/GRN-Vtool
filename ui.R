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
library(SeqNet)
library(htmltools)


# Define the UI
ui <- dashboardPage(
  
  
  # Define the dashboard header
  dashboardHeader(title = div(
    img(src = normalizePath("C:/Users/user/Desktop/GRNN/GRN/GRNNEW/logo.jpeg"), height = "30px"),
    "GRN VTOOLS",
    style = "display: flex; align-items: center; justify-content: center;"
  ), 
  titleWidth = 300),
  
              
  
  # Define the sidebar
  dashboardSidebar(
    
    # Choose the number of data files to upload
    radioButtons("num_files", label = "Number of Files:",
                 choices = list("One File" = "one",
                                "Two Files" = "two"), 
                 selected = "one"),
    
    # Upload data file(s)
    conditionalPanel(
      condition = "input.num_files == 'one'",
      fileInput("data_file1", "Upload Data File", 
                accept = c(".csv", ".tsv", ".txt")),
      br()
    ),
    conditionalPanel(
      condition = "input.num_files == 'two'",
      fileInput("data_file1", "Upload Data File 1", 
                accept = c(".csv", ".tsv", ".txt")),
      br(),
      fileInput("data_file2", "Upload Data File 2", 
                accept = c(".csv", ".tsv", ".txt")),
      br()
    ),
    
    # Normalize data
    actionButton("normalize_button", label = "Normalize Data", 
                 icon = icon("arrows-alt-h"), 
                 style = "background-color: purple; color: white"),
    
    # Perform exploratory data analysis
    actionButton("eda_button", label = "Exploratory Expression", 
                 icon = icon("line-chart"), 
                 style = "background-color: purple; color: white"),
    
    # Choose network generation tool
    selectInput("tool_choice", label = "Choose Network Generation Tool:", 
                choices = list("SeqNet", "DIANE"), 
                selected = "SeqNet"),
    
    # Generate network
    actionButton("network_button", label = "Generate Network", 
                 icon = icon("sitemap"), 
                 style = "background-color: purple; color: white")
  ),
  
  # Define the main body
  dashboardBody(
    
    # Display the network plot
    box(
      title = "Gene Network",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      plotOutput("network_plot")
    )
    
  )
  
)

                          
# Run the application 
shinyApp(ui = ui, server = server)
