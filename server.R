# server.R

library(shiny)
library(jpeg)
library(colorspace)
library(palettewidget)

computeClusters <- function(jpegImg, k) {
  jpegImg_xy <- data.frame(
    x = c(col(jpegImg)),
    y = c(row(jpegImg)),
    col = c(as.matrix(jpegImg)),
    stringsAsFactors = FALSE
  )

  rgbColors <- hex2RGB(jpegImg_xy$col)
  jpegImg_rgb <- cbind(jpegImg_xy[, c("x", "y")], rgbColors@coords)
  kmeans(jpegImg_rgb[, c("R", "G", "B")], k)
}

getPalette <- function(clusters) {
  clus_ord <- order(clusters$size, decreasing = TRUE)
  ctrs <- clusters$centers[clus_ord,]
  # hex color array
  ctrs <- sRGB(ctrs)
  hexcolors <- hex(ctrs)
  names(hexcolors) <- NULL
  hexcolors
}

shinyServer(function(input, output, session) {

  rv <- reactiveValues(
    jpegImg = NULL
  )

  output$hasImage <- reactive({
    !is.null(rv$jpegImg)
  })
  outputOptions(output, "hasImage", suspendWhenHidden = FALSE)

  output$jpegImage <- renderImage({
    jf <- input$jpegFile
    if (!is.null(jf)) {
      rv$jpegImg <- as.raster(readJPEG(jf$datapath))
      list(
        src = jf$datapath,
        contentType = "image/jpeg",
        height = 300
      )
    } else {
      list(src = "")
    }
  })

  clusters <- eventReactive(input$goButton, {
    kclus <- input$kclus

    if (!is.null(rv$jpegImg)) {
      computeClusters(rv$jpegImg, kclus)
    } else {
      NULL
    }
  })

  output$pal <- renderPalettewidget({
    clusters <- clusters()
    hexcolors <- NULL
    if (!is.null(clusters)) {
      hexcolors <- getPalette(clusters)
    }
    palettewidget(hexcolors, displayNames = TRUE)
  })
})
