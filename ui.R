# ui.R

library(shiny)
library(palettewidget)

shinyUI(fluidPage(

  # include CSS and JS for intro.js for documentation
  tags$head(
    tags$link(rel = "stylesheet", href = "css/introjs.min.css"),
    tags$script(src = "js/intro.min.js"),
    tags$script(src = "js/documentation.js")
  ),

  titlePanel("PaletteBrew"),

  sidebarLayout(
    sidebarPanel(
      fileInput("jpegFile",
                "Submit a JPEG image",
                accept = "image/jpeg"),
      conditionalPanel(
        condition = "output.hasImage",
        sliderInput("kclus", "Number of colors", 2, 6, 3),
        actionButton("goButton", "Process Image")
      ),
      tags$button(
        id = "helpMe",
        class = "btn btn-primary",
        style = "margin-top: 15px",
        span(class = "glyphicon glyphicon-question-sign"),
        onClick = "startIntro()",
        "Help me"
      )
    ),

    mainPanel(
      div(class = "panel panel-default",
          div(class = "panel-heading",
              h3(class = "panel-title", "Image preview")),
          div(class = "panel-body",
              imageOutput("jpegImage",
                          height = "300px"))),
      div(id = "results-panel", class = "panel panel-primary",
          div(class = "panel-heading",
              h3(class = "panel-title", "Your color palette")),
          div(class = "panel-body",
              palettewidgetOutput("pal")))
    )
  )
))
