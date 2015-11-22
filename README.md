# PaletteBrew

**PaletteBrew** is a simple [Shiny] application that generates a color palette
from an arbitrary JPEG image submitted by the user.

I wrote this app to submit it as my project app for the [Developing Data
Products] class on [coursera].

The actual color palette display component used by this app is the
[palettewidget] package written by myself ([Thiago Sigrist]). I wrote it just
for this app, but if you find it cool, feel free to use it in your projects!

## Installation

This isn't a R package so there's no installation step involved, just clone the
repo.

However, you do need to install the [palettewidget] package, and to do so,
follow these simple steps:

```r
install.packages("devtools")  # if you don't already have devtools installed
devtools::install_github("sigriston/palettewidget")
```

Also install the [CRAN] dependencies `jpeg` and `colorspace` as well:

```r
install.packages("jpeg")
install.packages("colorspace")
```

## Usage

Easy like all [Shiny] apps! After cloning the repo and installing the
dependencies, just open the `PaletteBrew.Rproj` in RStudio, open one of the
`*.R` files and click on the **Run App** button.

Usage of the app is documented inside the app itself, just click on the
blue **Help Me** button!

## Credits

This application written by [Thiago Sigrist].

Uses the following dependencies:

- [palettewidget] by [Thiago Sigrist]
- [intro.js] by [Afshin Mehrabani]
- CRAN package [jpeg] by Simon Urbanek
- CRAN package [colorspace] by Ross Ihaka *et al*

## License

MIT.

[Shiny]: http://shiny.rstudio.com
[Developing Data Products]: https://class.coursera.org/devdataprod-034
[coursera]: https://www.coursera.org
[CRAN]: https://cran.r-project.org
[palettewidget]: https://github.com/sigriston/palettewidget
[Thiago Sigrist]: https://github.com/sigriston
[intro.js]: https://usablica.github.io/intro.js/
[Afshin Mehrabani]: http://afshinm.name
[jpeg]: https://cran.r-project.org/web/packages/jpeg/index.html
[colorspace]: https://cran.r-project.org/web/packages/colorspace/index.html
