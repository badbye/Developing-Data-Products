
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
if (!require(class)) install.packages('class')
if (!require(ggplot2)) install.packages('ggplot2')
library(class)
library(ggplot2)
data(iris)
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    group = iris$Species
    train = iris[, 1:4]
    predictSpecies = knn(train, train, group, k = input$k)
    iris2 = cbind(iris, predictSpecies)
    out = ggplot(data=iris2, aes(Sepal.Length, Sepal.Width)) + 
        geom_point(aes(color=predictSpecies, shape=predictSpecies), size=3) +
        geom_point(data=subset(iris2, predictSpecies!=Species), 
                   aes(Sepal.Length, Sepal.Width), 
                   shape=5, size=5, col='red') 
    print(out)
  })

})
