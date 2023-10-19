
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twriTemplates

<!-- badges: start -->

[![twriTemplates status
badge](https://txwri.r-universe.dev/badges/twriTemplates)](https://txwri.r-universe.dev)
[![R build
status](https://github.com/TxWRI/twriTemplates/workflows/R-CMD-check/badge.svg)](https://github.com/TxWRI/twriTemplates/actions)
[![codecov](https://codecov.io/gh/TxWRI/twriTemplates/branch/main/graph/badge.svg?token=THDM1CMA83)](https://app.codecov.io/gh/TxWRI/twriTemplates)
<!-- badges: end -->

This package provides:

- Rmarkdown templates for MS Word and pdf documents that follow
  recommended brand guidance
- ggplot themes for common design styles between projects
- custom pkgdown template for TWRI packages

## Installation

The easiest way to install twriTemplates is through the r-universe
repository:

``` r
options(repos = c(
  txwri = 'https://txwri.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'))
install.packages("twriTemplates")
```

twriTemplates also lives on Github and can be built from source using:

``` r
install.packages("remotes")
remotes::install_github("TxWRI/twriTemplates")
```

## Usage

### Prerequisites

The Rmarkdown templates assume the required fonts are installed on your
system. The `Minion Pro` font among others are used by the various
templates and themes. We aren’t licensed to distribute some of the
fonts. Install all the fonts AgriLife provides at the [Marketing and
Communications branding
website](https://agrilife.tamu.edu/marketing-and-communications/resources/branding-agrilife/).

In order to use the pdf template, please install the tinytex package:

``` r
install.packages("tinytex")
tinytex::install_tinytex()
tinytex::is_tinytex()
```

Make sure the last function returns `TRUE`.

### Templates

Create a new Rmarkdown document, select “From Template”, and the TWRI
PDF template and TWRI doc template will be available in the list.

<figure>
<img src="inst/images/template.png"
alt="Screenshot of rmarkdown template selector" />
<figcaption aria-hidden="true">Screenshot of rmarkdown template
selector</figcaption>
</figure>

A new .Rmd file will open with example text and guidance in the
document.

### Theme

ggplot themes are provided for print and powerpoint presentation. The
main difference is that the fonts on the presentation styled theme are
scaled larger to facilitate reading from the back row in an auditorium.
There is also a function to add TWRI branding to your plots.

``` r
library(twriTemplates)
#> See https://github.com/TxWRI/twriTemplates for more details, use the Issues tab if you have questions.
library(ggplot2)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

## report theme
p1 <- dissolved_oxygen %>%
  mutate(station_id = as.factor(station_id)) %>%
  ggplot(aes(station_id, 
             min_do, 
             fill = station_id, 
             color = station_id)) +
  geom_boxplot(alpha = 0.5) +
  geom_jitter(alpha = 0.9, width = 0.1, height = 0) +
  theme_TWRI_print() +
  scale_color_discrete_twri(name = "Station ID") +
  scale_fill_discrete_twri(name = "Station ID") +
  labs(x = "Station ID", 
       y = "Dissolved Oxygen, Min [mg/L]", 
       title = "24-hr Minimum Dissolved Oxygen, Tres Palacios River",
       caption = "Source: TCEQ SWQM")
p1
```

<img src="man/figures/README-reporttheme-1.png" width="100%" />

``` r
## presentation theme
## suggested export size is 10 inches wide by 7.5 inches tall.
p2 <- dissolved_oxygen %>%
  mutate(station_id = as.factor(station_id)) %>%
  ggplot(aes(x = min_do, 
             fill = station_id, 
             color = station_id)) +
  geom_histogram(alpha = 0.5) +
  facet_wrap(~station_id) +
  theme_TWRI_pres() +
  scale_color_discrete_twri(name = "Station ID") +
  scale_fill_discrete_twri(name = "Station ID") +
  labs(x = "Dissolved Oxygen, Min [mg/L]",
       y = "n measurements",
       title = "24-hr Minimum Dissolved Oxygen, Tres Palacios River",
       caption = "Source: TCEQ SWQM") +
  theme(legend.position = "none")
p2
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

<img src="man/figures/README-prestheme-1.png" width="100%" />

``` r
add_TWRI_logo(p2, scale = 0.2)
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

<img src="man/figures/README-logo-1.png" width="100%" />

### pkgdown

add/edit \_pkgdown.yaml in the package root directory:

``` yaml
template:
  package: twriTemplates
  bootstrap: 5

navbar:
  type: dark
  bg: dark
  structure:
    right: [search, github]
```

add the following to the DESCRIPTION:

    Config/Needs/website: TxWRI/twriTemplates
