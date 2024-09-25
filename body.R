body <- dashboardBody(
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
