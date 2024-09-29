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
    )
  )
)
