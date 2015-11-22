library(jpeg)
library(colorspace)

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
