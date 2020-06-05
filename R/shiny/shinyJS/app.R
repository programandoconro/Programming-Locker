library(shiny)

js_inline_code <- tags$script(HTML('console.log("hello world shiny js")'))

js_external_code <- includeScript(path = 'myscript.js')

html_inline_code <- h1('Using HTML, Javascript and CSS in a R Shiny App')

html_external_code <- includeHTML('index.html')

ui <- fluidPage(
  js_inline_code,
  js_external_code,
  html_inline_code,
  html_external_code,

  plotOutput('plot1')
)

server <- function(input, output) {
  x <- 1:10
  y <- 11:20

  output$plot1 <- renderPlot({

    plot(x, y)
    
  })
}

shinyApp(ui, server)


