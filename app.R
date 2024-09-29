library(shiny)
library(shinydashboard)

source("sidebar.R")
source("body.R")
source("header.R")

ui <- dashboardPage(
  skin = "green",
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
 
  output$tabset1Selected <- renderText({
    input$tabset1   
  })

  output$progressBox <- renderInfoBox({
    infoBox(
      "Progress",
      paste0(25, "%"),
      icon = icon("list"),
      color = "purple"
    )
  })

  output$approvalBox <- renderInfoBox({
    infoBox(
      "Approval",
      paste0(90, "%"),
      icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
                                     
  output$progressBox1 <- renderInfoBox({
    infoBox(
      "Progress",
      paste0(25, "%"),
      icon = icon("list"),
      color = "purple",
      fill = TRUE
    )
  })

  output$approvalBox2 <- renderInfoBox({
    infoBox(
      "Approval",
      paste0(90, "%"),
      icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow",
      fill = TRUE
    )
  })  

  output$valueprogressBox <- renderValueBox({
    valueBox(
      1000,
      "New Visitors",
      icon = icon("users"),
      color = "yellow"
    )
  })

  output$valueapprovalBox <- renderValueBox({
    valueBox(
      1000,
      "New Visitors",
      icon = icon("list")
    )
  })


}

shinyApp(ui, server)
