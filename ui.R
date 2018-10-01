#Using Google Geocode API and googleway R package to dispaly the searched location on map and fetch the geocode information.

library(shiny)
library(googleway)
library(shinydashboard)
library(shinyjs)
library(httr) #for api call
library(jsonlite) # for api call

fluidPage(
tags$head(
tags$style(HTML("
@import url('//fonts.googleapis.com/css?family=Roboto');
h1{
font-family: 'Roboto';
color: #48ca3b;
}
"))
),
  
  headerPanel("Interface using Google Geocode API"),
  useShinyjs(),
  sidebarLayout(
    
    sidebarPanel(
      textInput("text", label = h5("Enter API Key"), value = "", width="400px"),
      textInput("address", label = h5("Type address"), value = "", width="400px"),
      actionButton("buttonGetGeocode","Get GeoCode", style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
      br(),
      br(),
      br(),
      sliderInput("lat", "Latitude", min = -90, max = 90, value = 0,step = .00001),
      sliderInput("lon", "Longitude", min = -180, max = 180, value = 0,step = .00001),
      
      #textInput("lat",label = h5("Latitude"), value = "", width="100px"),
      #textInput("lon",label = h5("Longitude"), value = "", width="100px"),
      actionButton("buttonLatLon","Get Address", style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
      width=6
    ),
    
    mainPanel(width=6,
      div(id="mapBoxdiv",
          verbatimTextOutput("printGeoCodes",placeholder = TRUE),
          box(id = "mapBox", width = "1000px", height="1000px", google_mapOutput(outputId = "map")))
    )
  ))


