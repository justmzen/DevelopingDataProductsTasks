library(shiny)

# Define UI for application that define a linear model for calculating 
# the number of telephones in the world
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict number of telephones in the world from year by region"),
    
    # Sidebar with a slider input for the predictor value "year"
    sidebarLayout(
        sidebarPanel(
            h5("Select the year of prediction: the plot will show a point for each regional predicted value and the specific values will be displayed as text under the plot"),
            sliderInput("sliderYear", 
                        "What is the year?", 
                        min = 1950, 
                        max = 2050, 
                        value = 1960),
            checkboxInput("showNAmer", "Show/Hide North America", value = TRUE),
            checkboxInput("showEurope", "Show/Hide Europe", value = TRUE),
            checkboxInput("showAsia", "Show/Hide Asia", value = TRUE),
            checkboxInput("showSAmer", "Show/Hide South America", value = TRUE),
            checkboxInput("showOceania", "Show/Hide Oceania", value = TRUE),
            checkboxInput("showAfrica", "Show/Hide Africa", value = TRUE),
            checkboxInput("showMidAmer", "Show/Hide Middle America", value = TRUE)
        ),
        
        # Show a plot of the number of phones and predicted values
        mainPanel(
            plotOutput("predPlot"),
            h5("Predicted number of phones in North America:"),
            textOutput("predNAmerica"),
            
            h5("Predicted number of phones in Europe:"),
            textOutput("predEurope"),
            
            h5("Predicted number of phones in Asia:"),
            textOutput("predAsia"),
            
            h5("Predicted number of phones in South America:"),
            textOutput("predSAmer"),
            
            h5("Predicted number of phones in Oceania:"),
            textOutput("predOceania"),
            
            h5("Predicted number of phones in Africa:"),
            textOutput("predAfrica"),
            
            h5("Predicted number of phones in Middle America:"),
            textOutput("predMidAmer")
        )
        
    )
))
