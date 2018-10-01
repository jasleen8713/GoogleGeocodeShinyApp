shinyServer(function(input, output, session){
  
  observeEvent(input$text,{
    hide(id = "mapBoxdiv", anim = TRUE)
    if (input$text == ""){
      return(NULL)
    }
    else
    {
      output$map <- renderGoogle_map({
      google_map(key = input$text) %>%
          clear_markers()
      })
      show(id = "mapBoxdiv", anim = TRUE)
    }

  })
  
  observeEvent(input$buttonGetGeocode, {
    #call api function
    returnedgeocode <- APILab5::latlon(input$address, input$text)
    df <- data.frame(lat=returnedgeocode[2],lon=returnedgeocode[1])
    print(df)
    output$printGeoCodes <- renderText(paste("lat",returnedgeocode[2],"lon",returnedgeocode[1]))
    output$map <- renderGoogle_map({
      google_map(key = input$text, location = c(returnedgeocode[2],returnedgeocode[1]), data= df) %>%
        add_markers(data = df, lat="lat",lon="lon", update_map_view = F)
    })
   
  })
  
  observeEvent(input$buttonLatLon, {
    #call api function
    locationVector <- c(as.numeric(input$lat), as.numeric(input$lon))
    print(locationVector)
    df <- data.frame(lat=locationVector[1],lon=locationVector[2])
    print(df)
    returnedAddress <- APILab5::reverselatlon(input$lat, input$lon, input$text)
    output$printGeoCodes <- renderText(returnedAddress)
    output$map <- renderGoogle_map({
      google_map(key = input$text, location = locationVector, data= df) %>%
        add_markers(data = df, lat="lat",lon="lon", update_map_view = F)
    })
    
  })
})
