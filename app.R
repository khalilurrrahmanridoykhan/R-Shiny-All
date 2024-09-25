library(shiny)
library(shinydashboard)

source("sidebar.R")
source("body.R")
source("header.R")
source("server.R")

ui <- dashboardPage(
  header,
  sidebar,
  body
)

messageData <- data.frame(
  from = c("sales Dept", "User", "Support"),
  message = c(
    "sales are steady this month.",
    "How do I register?",
    "The new dashboard looks great!"
  ),
  stringsAsFactors = FALSE
)


server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)

  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })


  output$messageMenu <- renderMenu({
    msgs <- apply(messageData, 1, function(row) {
      messageItem(from = row[["from"]], message = row[["message"]])
    })

    dropdownMenu(type = "messages", .list = msgs)
  })
}

shinyApp(ui, server)
