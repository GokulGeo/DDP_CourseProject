# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    ## Plot all points available in the dataset 
    output$sliderValues <- renderUI ({
        if (input$plotAll == TRUE) 
        {
        updateSliderInput(session, "stations", value = max(quakes$stations))
        updateSliderInput(session, "depth", value = max(quakes$depth))
        updateSliderInput(session, "magnitude", value = max(quakes$mag))
        titlePanel("")
        }
        if (input$plotAll == FALSE) 
        {
            updateSliderInput(session, "stations", value = mean(quakes$stations))
            updateSliderInput(session, "depth", value = mean(quakes$depth))
            updateSliderInput(session, "magnitude", value = mean(quakes$mag))
            titlePanel("")
        }
    })
    
    ## Reset All action button observer 
    observeEvent(input$resetAll, {
        session$sendCustomMessage(type = 'testmessage',
                                  message = 'Filters reset')
        updateSliderInput(session, "stations", value = mean(quakes$stations))
        updateSliderInput(session, "depth", value = mean(quakes$depth))
        updateSliderInput(session, "magnitude", value = mean(quakes$mag))
        updateCheckboxInput(session,"plotAll", value = FALSE)
        titlePanel("")
    })
    
    # Generate Filtered data set based on inputs from ui.R
    x <- reactive({ quakes[quakes$stations <= input$stations & quakes$depth <=input$depth & quakes$mag<=input$magnitude,] 
    })
    
    output$quakePlot <- renderLeaflet({
    # draw the map with leaflet function and consider the depth, stations and magnitude input filters
    leaflet(x()) %>% addTiles() %>%
            fitBounds(~min(long), ~min(lat), ~max(long), ~max(lat))    
   
  })
    
    
    # Incremental changes to the map (in this case, replacing the
    # circles when a new color is chosen) should be performed in
    # an observer. Each independent set of things that can change
    # should be managed in its own observer.
    observe({
          leafletProxy("quakePlot", data = x()) %>%
            clearShapes() %>%
            addCircleMarkers(color = "red", radius = ~sqrt(depth) , popup = ~paste("Magnitude:",mag, ", Depth:", depth), clusterOptions = markerClusterOptions()
            )
    })
    
    # Generate the Plotted Location count and render it in UI 
    output$lCount <- renderText({
        paste("Plotted location Count:  ",nrow(x()))
    })
    
    # Generate the output text under side panel 
    output$txt1 <- renderText({
        HTML("The Slider Filter inputs above are by default set to its mean value and also there is an action button to reset to its mean at any 
             point in time of analysis <br><br> There is also another option to plot all available points in the dataset")
    })
  
    
    # Generate the output text under main panel 
    output$txt2 <- renderText({
        HTML("The Plotted location count value shows the actual number of data points available in the map based on the filtered inputs and 
              the circle markers in the map have popup option which is visible on click to show the magnitude and depth of that earthquake location. The 
             locations are grouped in to clusters which can be drilled down in the map by zooming in and out")
    })
    
})
