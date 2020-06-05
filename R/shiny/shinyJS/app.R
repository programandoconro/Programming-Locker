library(shiny)

# inline Javascript code.

js_code <- tags$script(HTML('console.log("hello world shiny js")'))

ui <- fluidPage(
js_code
)

server <- function( input, output ){}

shinyApp( ui, server ) 
