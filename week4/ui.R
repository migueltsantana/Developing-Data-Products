library(shiny)

shinyUI(fluidPage(
      titlePanel("Compound Interest"),
      sidebarLayout(
            sidebarPanel(
                  helpText("Prediction of the total value invested with the compound interest in the next 10 years"),
                  helpText("Parameters:"),
                  sliderInput(inputId = "amount",
                              label = "Amount to invest:",
                              value = 100,
                              min = 0,
                              max = 100000,
                              step = 10),
                  sliderInput(inputId = "interest",
                              label = "Interest rate (%):",
                              value = 10,
                              min = 0,
                              max = 100,
                              step = 1)
            ),
            
            mainPanel(
                  htmlOutput("pText"),
                  htmlOutput("pred"),
                  plotOutput("Plot", width = "50%")
            )
      )
))