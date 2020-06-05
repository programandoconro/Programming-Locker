# Using HTML, Javascript and CSS in a Shiny R application.
library(shiny);

js_inline_code <- tags$script(HTML('console.log("hello world shiny js")'));

js_external_code <- includeScript(path = 'myscript.js');

html_inline_code <- h1('Using HTML, Javascript and CSS in a R Shiny App');

html_external_code <- includeHTML('index.html');

ui <- fluidPage(

  js_inline_code,
  js_external_code,
  html_inline_code,
  html_external_code,

# inline css for the button size.
  tags$head(
    tags$style(
      type = 'text/css', ".slider-animate-button { font-size: 40pt; }")),

  sliderInput(inputId = "value",
                  label = "N size:",
                  min = 1,
                  max = 5000,
                  value = 1,
                  animate = animationOptions(interval = 100, loop = TRUE)
                  ),
  
  plotOutput('plot1')
);

server <- function(input, output) {

  output$plot1 <- renderPlot({
    x <- 1:input$value;
    y <- runif(NROW(x));

    plot(x, y,
    ylab = 'Random Probability',
    xlab = 'N size',
    pch = 19,
    col = input$value);
    
  });
}

shinyApp(ui, server);


