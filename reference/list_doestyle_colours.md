# List valid NSW or DoE colours and their hex values

List valid NSW or DoE colours and their hex values

## Usage

``` r
list_doestyle_colours()
```

## Value

A tibble containing the names of valid colours and their hex values.

## Examples

``` r
list_doestyle_colours()
#> # A tibble: 51 × 2
#>    colour_name hex_value
#>    <chr>       <colour> 
#>  1 grey-01     • #22272B
#>  2 grey-02     • #495054
#>  3 grey-03     • #CDD3D6
#>  4 grey-04     • #EBEBEB
#>  5 green-01    • #004000
#>  6 green-02    • #00AA45
#>  7 green-03    • #A8EDB3
#>  8 green-04    • #DBFADF
#>  9 teal-01     • #0B3F47
#> 10 teal-02     • #2E808E
#> # ℹ 41 more rows
list_doestyle_colours() |> print(n = 50)
#> # A tibble: 51 × 2
#>    colour_name hex_value
#>    <chr>       <colour> 
#>  1 grey-01     • #22272B
#>  2 grey-02     • #495054
#>  3 grey-03     • #CDD3D6
#>  4 grey-04     • #EBEBEB
#>  5 green-01    • #004000
#>  6 green-02    • #00AA45
#>  7 green-03    • #A8EDB3
#>  8 green-04    • #DBFADF
#>  9 teal-01     • #0B3F47
#> 10 teal-02     • #2E808E
#> 11 teal-03     • #8CDBE5
#> 12 teal-04     • #D1EEEA
#> 13 blue-01     • #002664
#> 14 blue-02     • #146CFD
#> 15 blue-03     • #8CE0FF
#> 16 blue-04     • #CBEDFD
#> 17 purple-01   • #441170
#> 18 purple-02   • #8055F1
#> 19 purple-03   • #CEBFFF
#> 20 purple-04   • #E6E1FD
#> 21 fuchsia-01  • #65004D
#> 22 fuchsia-02  • #D912AE
#> 23 fuchsia-03  • #F4B5E6
#> 24 fuchsia-04  • #FDDEF2
#> 25 red-01      • #630019
#> 26 red-02      • #D7153A
#> 27 red-03      • #FFB8C1
#> 28 red-04      • #FFE6EA
#> 29 orange-01   • #941B00
#> 30 orange-02   • #F3631B
#> 31 orange-03   • #FFCE99
#> 32 orange-04   • #FDEDDF
#> 33 yellow-01   • #694800
#> 34 yellow-02   • #FAAF05
#> 35 yellow-03   • #FDE79A
#> 36 yellow-04   • #FFF4CF
#> 37 brown-01    • #523719
#> 38 brown-02    • #B68D5D
#> 39 brown-03    • #E8D0B5
#> 40 brown-04    • #EDE3D7
#> 41 black       • #000000
#> 42 white       • #FFFFFF
#> 43 off-white   • #F2F2F2
#> 44 grey-2%     • #FAFAFA
#> 45 grey-10%    • #E5E5E5
#> 46 grey-15%    • #D9D9D9
#> 47 grey-30%    • #B3B3B3
#> 48 grey-60%    • #666666
#> 49 dark-grey   • #333333
#> 50 label-blue  • #15397F
#> # ℹ 1 more row
```
