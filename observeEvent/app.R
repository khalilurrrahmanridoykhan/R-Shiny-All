library(shiny)

ui <- fluidPage(
    titlePanel("observeEvent Call"),# nolint
    sidebarLayout(
        sidebarPanel(# nolint
            selectInput("color", "choose a color", choices = c("red", "blue", "green")),# nolint
            actionButton("submit", "Submit")
        ),# nolint
        mainPanel(
            textOutput("selected_color")# nolint
        )# nolint
    )# nolint
)

server <- function(input, output){ # nolint
    observeEvent((input$submit), {# nolint
        output$selected_color <- renderText({# nolint
            paste("You Selected: ", input$color)# nolint
        })# nolint
    })# nolint
}

shinyApp(ui = ui, server = server)