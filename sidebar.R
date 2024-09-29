sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      menuItem("Charts", tabName = "charts", icon = icon("bar-chart-o"),badgeLabel = "new", badgeColor = "green"),
      menuItem("Google", icon = icon("google"), href = "http://www.google.com"),
      menuItem("Box", icon = icon("box"), tabName = "box", selected = TRUE,
               menuSubItem("Box 1", tabName = "box1"),
               menuSubItem("Box 2", tabName = "box2")
      ),
      menuItem("tab", icon = icon("table"), tabName = "tab"),
      menuItem("infoBox", icon = icon("info"), tabName = "infoBox"),
      menuItem("valueBox", icon = icon("value"), tabName = "valueBox"),
      menuItem("column", icon = icon("columns"), tabName = "column"),
      menuItem("columnrow", icon = icon("columns"), tabName = "columnrow")
    )
  )