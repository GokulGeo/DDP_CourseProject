#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# Author       Vasudevan Durairaj 
# Date         08/June/2018 

# Loading up the needed library files 
library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Locations of Earthquakes Off Fiji since 1964"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("stations",
                   "Stations less than or equal to",
                   min(quakes$stations),max(quakes$stations),
                   value = mean(quakes$stations),
                   step = 5),
        sliderInput("depth",
                "Depth less than or equal to",
                min(quakes$depth),max(quakes$depth),
                value = mean(quakes$depth), 
                step = 10),
       sliderInput("magnitude", 
                   "Magnitude less than or equal to", 
                   min(quakes$mag), max(quakes$mag),
                   value = mean(quakes$mag), step = 0.1), 
       checkboxInput("plotAll", "Plot all points", FALSE),
       actionButton("resetAll", "Reset all Filter inputs to its mean value"),
       uiOutput("sliderValues"), 
       htmlOutput("txt1")
     ),
    # Show a plot of the generated distribution
    mainPanel(
       leafletOutput("quakePlot"),
       h4(textOutput("lCount"), align = "right"),
       htmlOutput("txt2", align = "left")
    )
  )
))
