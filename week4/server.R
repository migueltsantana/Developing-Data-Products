library(shiny)
library(ggplot2)

# First step: define interest rate function

calculate_interest <- function(rate,amount,years) {
  return(amount * sum((1+rate/100)^(0:(years-1))*rate/100))
}

create_data_frame <- function(rate, amount, years) {
  years_data <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  values_data <- c(amount)
  for (i in 1:10) {
    values_data <- append(values_data, amount+calculate_interest(rate, amount, i))
  }
  return(data.frame(years=years_data, values=values_data))
}

shinyServer(function(input, output) {
  output$pText <- renderText({
    paste("The amount to invest is",
          strong(round(input$amount, 1)),
          "units of money, and the interest rate is",
          strong(round(input$interest, 1)),
          "%, then:")
  })
  output$pred <- renderText(paste0("you'll be making ",
                                   em(strong(round(input$amount+calculate_interest(input$interest, input$amount, 10)))),
                                   " in the next 10 years"))
  output$Plot <- renderPlot({
    ggplot(data=create_data_frame(input$interest, input$amount, 10), aes(x=years, y=values, group=1)) +
      geom_line(linetype = "dashed")+
      geom_point()
  })
})