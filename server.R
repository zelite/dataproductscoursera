
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(TSP)
library(grid)
library(RColorBrewer)


plotTour <- function(mapPlot, cities, start_city){
  
  if (length
      (cities) <= 1)
    return()
  else{
  colors <- brewer.pal(8, "Dark2")
  tsp <- TSP(distances[cities, cities])
  start_city <- which(labels(tsp) == start_city)
  path <- solve_TSP(tsp, method = "nn", control=list(start=start_city))
  print(mapPlot+geom_point(data=cityList, aes(group=NULL), size=2, color=colors[1])+
          #geom_path(data=cityList[names(path), ], aes(group=NULL), size=1.5, arrow=arrow()))
          geom_point(data=cityList[names(path), ], aes(group=NULL), size=4, color=colors[3])+
          geom_segment(data=cityList[names(path), ], aes(xend=c(tail(long, n=-1), NA), yend=c(tail(lat, n=-1), NA), group=NULL), 
                       arrow=arrow(), size=1, colour=colors[2])+
          geom_text(data=cityList[names(path), ], aes(label=CityName, group=NULL), hjust=0.5, vjust=1), size=0.5)
  
}}

p <- ggplot(t, aes(x=long, y=lat, group=group))+geom_path()+theme_few()+coord_quickmap()+guides(fill=FALSE)#+theme(aspect.ratio=1)

shinyServer(function(input, output) {
  
  output$start <- renderUI(selectInput(inputId = "start", label = "Where to start?", choices = input$cities))
  
  
  
  output$plot <- renderPlot(if (is.null(input$cities) | is.null(input$start))
                                return()
                            else suppressWarnings(plotTour(p, input$cities, input$start)))

  
  

  

})
