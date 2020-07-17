
library(shiny)

shinyUI(fluidPage(

    titlePanel("Information about US States"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3('Pick Population Range'),
            sliderInput('pop','Population',
                        min=300,max=25000,value=c(1000,4000)),
            h3('Pick Life Expectancy Range'),
            sliderInput('lexp','Life Expectancy',
                        min=60,max=80,value=c(65,75)),
            h3('Regions'),
            checkboxInput('NE','Northeast',value=TRUE),
            checkboxInput('NC','North Central',value=TRUE),
            checkboxInput('S','South',value=TRUE),
            checkboxInput('W','West',value=TRUE)
        ),

        mainPanel(
            htmlOutput("plot1")
        )
    )
))
