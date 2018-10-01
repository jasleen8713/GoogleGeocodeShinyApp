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
    returnedgeocode <- Geocode(input$address)
    df <- data.frame(lat=returnedgeocode[1],lon=returnedgeocode[2])
    output$map <- renderGoogle_map({
      google_map(key = input$text, location = returnedgeocode, data= df) %>%
        add_markers(data = df, lat="lat",lon="lon", update_map_view = F)
    })
   
  })
})
