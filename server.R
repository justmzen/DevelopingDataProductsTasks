library(shiny)

# Define server logic
shinyServer(function(input, output) {
    
    # Input data
    df <- as.data.frame(WorldPhones)
    
    # Cleaning data
    df$year <- as.numeric(rownames(df))
    
    
    # Models
    # 
    lmNAmerica <- lm(N.Amer ~ year, data = df)
    lmEurope <- lm(Europe ~ year, data = df)
    lmAsia <- lm(Asia ~ year, data = df)
    lmSAmer <- lm(S.Amer ~ year, data = df)
    lmOceania <- lm(Oceania ~ year, data = df)
    lmAfrica <- lm(Africa ~ year, data = df)
    lmMidAmer <- lm(Mid.Amer ~ year, data = df)
    
    # Reactive predictions
    # 
    modelNAmerPred <- reactive({
        yearInput <- input$sliderYear
        predict(lmNAmerica, newdata = data.frame(year = yearInput))
    })
    
    modelEurope <- reactive({
        yearInput <- input$sliderYear
        predict(lmEurope, newdata = data.frame(year = yearInput))
    })
    
    modelAsia <- reactive({
        yearInput <- input$sliderYear
        predict(lmAsia, newdata = data.frame(year = yearInput))
    })
    
    modelSAmer <- reactive({
        yearInput <- input$sliderYear
        predict(lmSAmer, newdata = data.frame(year = yearInput))
    })
    
    modelOceania <- reactive({
        yearInput <- input$sliderYear
        predict(lmOceania, newdata = data.frame(year = yearInput))
    })
    
    modelAfrica <- reactive({
        yearInput <- input$sliderYear
        predict(lmAfrica, newdata = data.frame(year = yearInput))
    })
    
    modelMidAmer <- reactive({
        yearInput <- input$sliderYear
        predict(lmMidAmer, newdata = data.frame(year = yearInput))
    })
    
    
    # Output Plot
    # 
    output$predPlot <- renderPlot({
    
        yearInput <- input$sliderYear

        plot(df$year, df$N.Amer, xlab = "Year", 
             ylab = "Number of telephones (10^3)",
             bty = "n", pch = 16, xlim = c(1950, 2050), ylim = c(4500, 6e5),
             col = 'red')
        points(df$year, df$Europe, bty = "n", pch = 16, col = 'blue')
        points(df$year, df$Asia, bty = "n", pch = 16, col = 'black')
        points(df$year, df$S.Amer, bty = "n", pch = 16, col = 'cyan')
        points(df$year, df$Oceania, bty = "n", pch = 16, col = 'pink')
        points(df$year, df$Africa, bty = "n", pch = 16, col = 'orange')
        points(df$year, df$Mid.Amer, bty = "n", pch = 16, col = 'gray')
        
        if(input$showNAmer == TRUE){
            abline(lmNAmerica, col = "red", lwd = 2)
            points(yearInput, modelNAmerPred(), col = "red", pch = 16, cex = 2)
        }
        
        if(input$showEurope == TRUE){
            abline(lmEurope, col = 'blue', lwd = 2)
            points(yearInput, modelEurope(), col = "blue", pch = 16, cex = 2)
        }
        
        if(input$showAsia == TRUE){
            abline(lmAsia, col = 'black', lwd = 2)
            points(yearInput, modelAsia(), col = "black", pch = 16, cex = 2)
        }
        
        if(input$showSAmer == TRUE){
            abline(lmSAmer, col = 'cyan', lwd = 2)
            points(yearInput, modelSAmer(), col = "cyan", pch = 16, cex = 2)
        }
        
        if(input$showOceania == TRUE){
            abline(lmOceania, col = 'pink', lwd = 2)
            points(yearInput, modelOceania(), col = "pink", pch = 16, cex = 2)
        }
        
        if(input$showAfrica == TRUE){
            abline(lmAfrica, col = 'orange', lwd = 2)
            points(yearInput, modelAfrica(), col = "orange", pch = 16, cex = 2)
        }
        
        if(input$showMidAmer == TRUE){
            abline(lmMidAmer, col = 'gray', lwd = 2)
            points(yearInput, modelMidAmer(), col = "gray", pch = 16, cex = 2)
        }
        
        legend(x = 1950, y = 6e5,
               legend = c("North America Prediction",
                          "Europe Prediction",
                          "Asia Prediction",
                          "South America Prediction",
                          "Oceania Prediction",
                          "Africa Prediction",
                          "Middle America Prediction"),
               col = c("red", "blue", 'black', 'cyan', 'pink', 'orange', 
                       'gray'), 
               pch = 16, bty = "n", cex = 1.2)
        
    })
    
    
    # Output text
    # 
    output$predNAmerica <- renderText({
        modelNAmerPred()
    })
    
    output$predEurope <- renderText({
        modelEurope()
    })
    
    output$predAsia <- renderText({
        modelAsia()
    })
    
    output$predSAmer <- renderText({
        modelSAmer()
    })
    
    output$predOceania <- renderText({
        modelOceania()
    })
    
    output$predAfrica <- renderText({
        modelAfrica()
    })
    
    output$predMidAmer <- renderText({
        modelMidAmer()
    })
    
    
})
