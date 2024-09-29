body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  tags$head(
    tags$style(HTML(
      '.my-class { background-color: #010110; }'
    ))
  ), 
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
      h2("Widgets tab content", class = "my-class"),
    ),
    tabItem(
      tabName = "charts",
      div(class = "my-class", p("Charts tab content")),
      div(class = "input-filed", textInput(
        "text",
        "Text input:"
      )),
    ),
    tabItem(
      tabName = "box1",
      fluidRow(
        box(
          title = "Box1",
          "Box 1 content"
        )
      )
    ),
    tabItem(
      tabName = "box2",
      fluidRow(
        box(
          title = "Box2",
          "Box 2 content"
        )
      )
    ),
    tabItem(
      tabName = "tab",
      fluidRow(
        tabBox(
          title = "First tabBox",
          id = "tabset1",
          height = "250px",
          selected = "Tab2",
          tabPanel("Tab1", "Tab content 1"),
          tabPanel("Tab2", "Tab content 2")
        )
      ),
      fluidRow(
        tabBox(
          title = tagList(shiny::icon("gear"), "Second tabBox"),
          id = "tabset2",
          height = "250px",
          tabPanel("Tab1", "Tab content 3"),
          tabPanel("Tab2", "Tab content 4")
        )
      ),
      fluidRow(
        tabBox(
          # Title can include an icon
          title = tagList(shiny::icon("gear"), "tabBox status"),
          tabPanel(
            "Tab1",
            "Currently selected tab from first box:",
            verbatimTextOutput("tabset1Selected")
          ),
          tabPanel("Tab2", "Tab content 2")
        )
      )
    ),
    tabItem(
      tabName = "infoBox",
      fluidRow(
        infoBox(
          "New Orders",
          10 * 2,
          icon = icon("credit-card"),
          color = "aqua"
        ),
        infoBoxOutput("progressBox"),
        infoBoxOutput("approvalBox")
      ),
      fluidRow(
        infoBox(
          "New Orders",
          10 * 2,
          icon = icon("credit-card"),
          color = "blue",
          fill = TRUE
        ),
        infoBoxOutput("progressBox1"),
        infoBoxOutput("approvalBox2")
      )
    ),
    tabItem(
      tabName = "valueBox",
      fluidRow(
        valueBox(
          1000,
          "New Visitors",
          icon = icon("credit-card")
        ),
        valueBoxOutput("valueprogressBox"),
        valueBoxOutput("valueapprovalBox")
      )
    ),
    tabItem(
      tabName = "column",
      fluidRow(
        column(
          width = 4,
          box("Box Title", width = NULL, status = "primary", "Box content"),
          box("Title 1", width = NULL, solidHeader = TRUE, status = "primary", "Box Content"),
          box(width = NULL, background = "yellow", "Box Content")
        ),
        column(
          width = 4,
          box("Column 2", status = "warning", width = NULL, background = "green")
        ),
        column(
          width = 4,
          box("Column 3", status = "danger", width = NULL)
        )
      )
    ),
    tabItem(
      tabName = "columnrow",
      fluidRow(
        box("Row 1", width = 6, status = "primary"),
        box(status = "warning", solidHeader = TRUE, "Row 2", width = 6),
      ),
      fluidRow(
        column(
          width = 4,
          box("Column 1", status = "danger", width = NULL),
          box("Column 2", status = "warning", width = NULL)
        ),
        column(
          width = 6,
          box("Column 3", status = "success", width = NULL)
        ),
        column(
          width = 2,
          box("Column 4", status = "info", width = NULL)
        )
      )
    )
  )
)
