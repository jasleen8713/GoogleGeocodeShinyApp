shinyServer(function(input, output, session){
  
  api_key <- ""
  
  output$map <- renderGoogle_map({
    google_map(key = api_key)
  })
})
