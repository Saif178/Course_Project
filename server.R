
library(shiny)
suppressPackageStartupMessages(library(dplyr)) 
suppressPackageStartupMessages(library(googleVis))

pop<-state.x77[,1]
lexp<-state.x77[,4]
states<-data.frame(state.name, pop, lexp, state.region,
                     hover=paste(state.name,':', 
                                  pop,lexp,'years',sep=' '))
states$hover<-as.character(states$hover)


shinyServer(function(input, output) {

    output$plot1<-renderGvis({
        minpop<-input$pop[1];minlexp<-input$lexp[1]
        maxpop<-input$pop[2];maxlexp<-input$lexp[2]
        regions<-vector(length=4)
        regions[1]<-ifelse(input$NE,'Northeast','')
        regions[2]<-ifelse(input$NC,'North Central','')
        regions[1]<-ifelse(input$S,'South','')
        regions[1]<-ifelse(input$W,'West','')
        plotdata<-states%>%
            filter(pop>minpop,pop<maxpop,lexp>minlexp,lexp>maxlexp)%>%
            filter(state.region %in% regions)
        gvisGeoChart(plotdata,
                     locationvar='state.name',hovervar='hover',
                     options=list(region='US',displayMode='Markers',
                                  resolution='provinces',
                                  width=800,height=600))
    })

})
