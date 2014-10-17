
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(TSP)

plotTour <- function(mapPlot, cities, start_city){
  if (length
      (cities) <= 1)
    return()
  else{
  tsp <- TSP(distances[cities, cities])
  start_city <- which(labels(tsp) == start_city)
  path <- solve_TSP(tsp, method = "nn", control=list(start=start_city))
  print(mapPlot+geom_point(data=cityList, aes(group=NULL))+
          geom_path(data=cityList[names(path), ], aes(group=NULL)))
}}

p <- ggplot(t, aes(x=long, y=lat, group=group))+geom_path()+theme_few()+coord_quickmap()+guides(fill=FALSE)#+theme(aspect.ratio=1)

shinyServer(function(input, output) {
  
  output$start <- renderUI(selectInput(inputId = "start", label = "Where to start?", choices = input$cities))
  
  
  
  output$plot <- renderPlot(if (is.null(input$cities) | is.null(input$start))
                                return()
                            else plotTour(p, input$cities, input$start))

  
  

  

})
