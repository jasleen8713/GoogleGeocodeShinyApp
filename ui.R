library(shiny)
library(googleway)
library(shinydashboard)
library(shinyjs)
library(httr) #for api call
library(jsonlite) # for api call

shinyUI(fluidPage(
  useShinyjs(),
  textInput("text", label = h3("Submit API Key"), value = "", width="400px"),
  textInput("address", label = h3("Type address / Geo codes"), value = "", width="400px"),
  actionButton("buttonGetGeocode","Get Geo Code"),
  div(id="mapBoxdiv",
  box(id = "mapBox", title = "Address Output", width = "800px", height="800px", google_mapOutput(outputId = "map")))
  ))


