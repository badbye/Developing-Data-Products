
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Classification of iris data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
    p("This app use the famous (Fisher's or Anderson's) iris data set in R,
      and KNN algorithm to build a model to classify the iris's Species."),
    tags$hr(),
      sliderInput("k",
                  "Please input the parameter k in the KNN algorithm:",
                  min = 1,
                  max = 50,
                  value = 30),
    tags$hr(),
    p("The points with deffierent color and shape means different species.
      And the points inside a red box means it's misclassified.")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
