<!-- README.md is generated from README.Rmd. Please edit that file -->

# doestyle

<!-- badges: start -->
<!-- badges: end -->

`{doestyle}` is a collection of functions to help produce
brand-compliant figures for NSW Department of Education publications.

## Installation

You can install the development version of doestyle from its Azure
Devops git repository.

First, ensure that you have `remotes` installed:

``` r
install.packages("remotes")
```

… then use `remotes` to install `doestyle` from its git repository:

``` r
remotes::install_git("https://doestyle@dev.azure.com/doestyle/doestyle/_git/doestyle")
```

The same command can be used update `doestyle` to its latest version.

## Example

Apply the DoE colour palette to the fill aesthetic of a bar chart:

``` r
library(ggplot2)
library(doestyle)

diamonds |>
  ggplot(aes(x = cut, fill = cut)) +
  geom_bar() +
  # Use the DoE fill scale
  scale_fill_doe()
```

    #> Warning: package 'ggplot2' was built under R version 4.2.3

![Example diamond plot with DoE
fill](man/figures/README-fig-example.png)
