
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)



shinyUI(fluidPage(theme="bootstrap.css",

  # Application title
  titlePanel("The shortest tour"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h1("Background"),
      p("Select the cities you want to visit from the dropdown list and then choose your starting city.
                  This app will plot the shortest path through those cities without passing twice in any city.
                  The shortest path takes into account the return to the starting city."),
      selectInput("cities", label="Which cities?",
                     choices = cityList$CityName, multiple=TRUE),
      uiOutput("start"),
      
      h1("Details"),
      p("The list of cities are the ones available on the dataset", code("eurodist"), "which is a default dataset from R.
        The shortest path is calculated with the package TSP, which is a solver for the", 
        a("Travelling salesman problem", href="http://en.wikipedia.org/wiki/Travelling_salesman_problem", target="_blank"), ".")
    ),

   
    mainPanel(
      plotOutput("plot", width="1000px", height="1000px")
      
     
    )
  )
))
