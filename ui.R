#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

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
    # Sidebar menu
    sidebarMenu(
      # Home menu item
      menuItem("Home", tabName = "home", icon = icon("home")),
      
      # Data menu item
      menuItem("Data", tabName = "data", icon = icon("database"),
               # Normalize Data submenu item
               menuSubItem("Upload Data", tabName = "upload_data"),
               menuSubItem("Normalize Data", tabName = "normalize"),
               menuSubItem("Exploratory Expression", tabName = "eda")
      ),
      
      # Tools menu item
      menuItem("Tools", tabName = "tools", icon = icon("wrench")),
      
      # Generate Network menu item
      menuItem("Generate Network", tabName = "generate_network", icon = icon("sitemap")),
      
      menuItem("Download", tabName = "download", icon = icon("download")),
      
      menuItem("Log in", tabName = "Log_in", icon = icon("sign-in"))
      
    )
  ),
  
  # Define the main body
  dashboardBody(
    # Tab items
    tabItems(
      # Home tab
      tabItem(tabName = "home",
              h2("Welcome to GRN VTOOLS"),
              p("Welcome to GRN VTOOLS, your comprehensive toolkit for Gene Regulatory Network (GRN) analysis. GRN VTOOLS offers a suite of powerful tools and functionalities to empower researchers and biologists in unraveling the complex interactions and regulatory mechanisms underlying gene expression.GRN VTOOLS provides a versatile and integrated platform for exploring gene regulatory networks.

Whether you're utilizing the advanced capabilities of SeqNet, a state-of-the-art network generation tool, or harnessing the analytical power of DIANE for network inference, GRN VTOOLS equips you with a diverse range of options to suit your research needs. Seamlessly navigate through various stages of GRN analysis, from data upload and normalization to exploratory expression analysis, and finally to network generation.

With GRN VTOOLS, you can easily upload your data, visualize gene expression patterns, and generate comprehensive gene regulatory networks. Gain invaluable insights into the intricate world of gene regulation as you uncover the hidden relationships and dynamics within your biological systems.

Join us on this exciting journey as we provide you with the tools you need to unravel the mysteries of gene regulatory networks. Experience the power and versatility of GRN VTOOLS and unlock a deeper understanding of gene expression and regulation.")
      ),
      
      # Data tab
      tabItem(tabName = "upload_data",
              h2("Upload Data"),
              p("Upload your data files here:"),
              radioButtons("num_files", label = "Number of Files:",
                           choices = list("One File" = "one",
                                          "Two Files" = "two"), 
                           selected = "one"),
              conditionalPanel(
                condition = "input.num_files == 'one'",
                fileInput("data_file1", "Upload Data File", 
                          accept = c(".csv", ".tsv", ".txt"))
              ),
              conditionalPanel(
                condition = "input.num_files == 'two'",
                fileInput("data_file1", "Upload Data File 1", 
                          accept = c(".csv", ".tsv", ".txt")),
                fileInput("data_file2", "Upload Data File 2", 
                          accept = c(".csv", ".tsv", ".txt"))
              )
      ),
      
      # Normalize tab
      tabItem(tabName = "normalize",
              h2("Normalize Data"),
              p("Data normalization content goes here.")
      ),
      
      # EDA tab
      tabItem(tabName = "eda",
              h2("Exploratory Expression"),
              p("Exploratory data analysis content goes here.")
      ),
      
      # Tools tab
      tabItem(tabName = "tools",
              h2("Tools"),
              p("Choose a network generation tool:"),
              selectInput("tool_choice", label = "Choose Network Generation Tool:", 
                          choices = list("SeqNet", "DIANE"), 
                          selected = "SeqNet")),
      
      # Generate Network tab
      tabItem(tabName = "generate_network",
              h2("Generate Network"),
              p("Network generation content goes here.")),
      
      
      tabItem(tabName = "Log_in",
              h2("Log in"),
              p("Log in content goes here.")
      )
    )
  )
)

# Run the application
shinyApp(ui = ui, server = function(input, output) {})

