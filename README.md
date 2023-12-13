<!-- README.md is generated from README.Rmd. Please edit that file -->

# doestyle

<!-- badges: start -->
<!-- badges: end -->

`{doestyle}` is an R package containing functions to help produce
brand-compliant figures for NSW Department of Education publications.

## Installation

Because `doestyle` is not
on yet on CRAN, it cannot be directly installed with the standard
`install.packages` function. Instead, we can use the helper package
[remotes](https://cran.r-project.org/package=remotes) to either install
from BitBucket, or from a downloaded copy of the BitBucket repository.

### Install from a downloaded copy

**Prerequisites:**

-   Install the [remotes R
    package](https://cran.r-project.org/package=remotes) with

`install.packages("remotes")`

**Steps:**

1.  Download the current doestyle repository zip file using the "Download repository" link on this page's ... context menu.
    Note the path to the downloaded file.
2.  In R, use `remotes::install_local` to install `doestyle` from the
    downloaded zip file. If you are using Windows, you will need to
    transform the path you noted, converting any backslashes (“\\”) to
    forward slashes (“/”).

<!-- -->


    remotes::install_local("C:/path/to/your_downloads_folder/doestyle-file-you-noted.zip")

For example:

![Example installation using
remotes::install\_local](https://bitbucket.org/nsw-education/doestyle/raw/93eef54df1a06528cf15dec71721eb9c541fc3e2/man/figures/install_local.gif)

At a later date, you will need to repeat both steps to update `doestyle`
to its latest version.

## Usage example

Apply the DoE colour palette to the fill aesthetic of a bar chart:


    library(ggplot2)
    # Load doestyle
    library(doestyle)

    diamonds |>
      ggplot(aes(x = cut, fill = cut)) +
      geom_bar() +
      # Use the DoE fill scale
      scale_fill_doe()

<img src="https://bitbucket.org/nsw-education/doestyle/raw/93eef54df1a06528cf15dec71721eb9c541fc3e2/man/figures/README-example-1.png" width="600px" />
