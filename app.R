library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    title = "First Dashbord",
    dropdownMenu(
      type = "messages",
      messageItem(
        from = "sales Dept",
        message = "sales are steady this month."
      ),
      messageItem(
        from = "User",
        message = "How do I register?",
        icon = icon("question"),
        time = "13:45"
      ),
      messageItem(
        from = "Support",
        message = "The new dashboard looks great!",
        icon = icon("life-ring"),
        time = "13:45"
      )
    ),
    dropdownMenuOutput("messageMenu")
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Charts", tabName = "charts", icon = icon("bar-chart-o"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(
        tabName = "dashboard",
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          box(
            title = "Controls",
            sliderInput(
              "slider",
              "Number of observations:",
              1,
              100,
              50
            )
          )
        )
      ),
      tabItem(
        tabName = "widgets",
        h2("Widgets tab content")
      ),
      tabItem(
        tabName = "charts",
        div(class = "my-class", p("Charts tab content")),
        div(class = "input-filed", textInput(
          "text",
          "Text input:"
        )),
      )
    )
  )
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
