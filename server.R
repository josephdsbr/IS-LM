library(shiny)
library(shinydashboard)

shinyServer(function(input, output){
  
  ## Pre-processing
  
  vals <- reactiveValues()
  res <- reactiveValues()
  
  observe({
    vals$c_0 <- input$c_0
    vals$i_0 <- input$i_0
    vals$g_0 <- input$g_0
    vals$m <- input$m
    vals$e <- input$e
    vals$f <- input$f
    vals$c_1 <- input$c_1
    vals$b <- input$b
    
    res$ga <- vals$c_0 + vals$i_0 + vals$g_0
    res$alpha <- 1 - vals$c_1
    res$sigma <- res$alpha*vals$f + vals$b*vals$e
    res$prod <- (res$ga*vals$f + vals$b*vals$m)/(res$sigma)
    res$juros <- (res$ga*vals$e - res$alpha*vals$m)/(res$sigma)
  })
  
  output$Renda <- renderInfoBox({
    infoBox('Renda', value = paste('$', round(res$prod,2)), fill = T)
  })
  
  output$Taxa <- renderInfoBox({
    infoBox('Juros', value = paste(round(res$juros), '%'), fill = T)
  })
  
  output$alpha <- renderInfoBox({
    infoBox('Multiplicador', value = round(1/(res$alpha)), fill = T)
  })
})