# Palettes provided by `doestyle`

A list of palettes, organised by type.

## Usage

``` r
doe_palettes
```

## Format

An object of class `palettes_palette` (inherits from `vctrs_list_of`,
`vctrs_vctr`, `list`) of length 6.

## Details

- Qualitative: designed to show differences between nominal classes

- Sequential: designed to show differences in ordered data that progress
  in value from low to high (or vice versa)

- Diverging: designed to show differences in ordered data that progress
  away from a central value to extremes at either end of a scale

Palettes can be accessed by their type and name.

## Examples

``` r
# Examine one palette at a time
doe_palettes$default
#> <palettes_colour[12]>
#> • #002664
#> • #D7153A
#> • #8CE0FF
#> • #FFB8C1
#> • #22272B
#> • #146CFD
#> • #630019
#> • #495054
#> • #CBEDFD
#> • #FFE6EA
#> • #CDD3D6
#> • #EBEBEB
doe_palettes$seq.blues
#> <palettes_colour[4]>
#> • #CBEDFD
#> • #8CE0FF
#> • #146CFD
#> • #002664

# List all palettes and their colours
print(doe_palettes)
#> <palettes_palette[6]>
#> $default
#> <palettes_colour[12]>
#> • #002664
#> • #D7153A
#> • #8CE0FF
#> • #FFB8C1
#> • #22272B
#> • #146CFD
#> • #630019
#> • #495054
#> • #CBEDFD
#> • #FFE6EA
#> • #CDD3D6
#> • #EBEBEB
#> 
#> $qual.doe
#> <palettes_colour[12]>
#> • #002664
#> • #D7153A
#> • #8CE0FF
#> • #FFB8C1
#> • #22272B
#> • #146CFD
#> • #630019
#> • #495054
#> • #CBEDFD
#> • #FFE6EA
#> • #CDD3D6
#> • #EBEBEB
#> 
#> $seq.blues
#> <palettes_colour[4]>
#> • #CBEDFD
#> • #8CE0FF
#> • #146CFD
#> • #002664
#> 
#> $seq.reds
#> <palettes_colour[4]>
#> • #FFE6EA
#> • #FFB8C1
#> • #D7153A
#> • #630019
#> 
#> $seq.greys
#> <palettes_colour[4]>
#> • #EBEBEB
#> • #CDD3D6
#> • #495054
#> • #22272B
#> 
#> $div.red_blue
#> <palettes_colour[7]>
#> • #630019
#> • #D7153A
#> • #FFB8C1
#> • #EBEBEB
#> • #8CE0FF
#> • #146CFD
#> • #002664
#> 

# If you've loaded `palettes`, visualise the available palettes
library(palettes)
plot(doe_palettes)
```
