library(shiny)

js_inline_code <- tags$script(HTML('console.log("hello world shiny js")'))

js_external_code <- includeScript(path ='myscript.js')

ui <- fluidPage(
  js_inline_code,
  js_external_code
)

server <- function( input, output ){}

shinyApp( ui, server ) 
