# Activate `showtext` and check for presence of Public Sans font family

[`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)
uses `showtext` to allow R graphics devices to render the Public Sans
font family. Use `check_font_families()` to check that Public Sans is
available and to activate `showtext`.

## Usage

``` r
check_font_families()
```

## Value

`check_font_families()` does not have a return value and is called for
its side effects.

## See also

[`showtext::showtext_auto()`](https://rdrr.io/pkg/showtext/man/showtext_auto.html)
and [Public Sans](https://digitalnsw.github.io/public-sans/).
