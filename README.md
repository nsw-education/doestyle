<!-- README.md is generated from README.Rmd. Please edit that file -->

# doestyle

<!-- badges: start -->
<!-- badges: end -->

`{doestyle}` is a collection of functions to help produce
brand-compliant figures for NSW Department of Education publications.

## Installation

You can install the development version of doestyle from its Azure
Devops git repository.

From your terminal:

``` bash
git clone https://doestyle@dev.azure.com/doestyle/doestyle/_git/doestyle ~/doestyle
```

… and then from `R`:

``` r
remotes::install_local("~/doestyle")
```

Note that this will leave a checked-out copy of this repository in your
home directory, which you may want to clean up (again from your
terminal):

``` bash
rm -rf ~/doestyle
```

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

![Example diamond plot with DoE
fill](man/figures/README-fig-example.png)
