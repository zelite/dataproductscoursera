
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)



shinyUI(fluidPage(theme="bootstrap.css",

  # Application title
  titlePanel("Traveling"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("cities", label="Which cities?",
                     choices = cityList$CityName, multiple=TRUE),
      uiOutput("start")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot", width="1000px", height="1000px")
      #renderPrint("print"),
      #renderPrint("print2")
     
    )
  )
))
