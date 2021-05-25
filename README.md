
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twriTemplates

<!-- badges: start -->

[![R build
status](https://github.com/TxWRI/twriTemplates/workflows/R-CMD-check/badge.svg)](https://github.com/TxWRI/twriTemplates/actions)
<!-- badges: end -->

This package provides:

-   Rmarkdown templates for work and pdf documents that follow
    recommended brand guidance
-   ggplot theme for common design styles between projects (incomplete)

## Installation

twriTemplates lives on Github, install using the remotes package:

``` r
install.packages("remotes")
remotes::install_github("TxWRI/twriTemplates")
```

## Usage

### Prerequisites

The Rmarkdown templates assume the required fonts are installed on your
system. The `Minion Pro` and `Open Sans` fonts are used by both
templates. We aren’t licensed to distribute `Minion Pro` so it is not
bundled in this template. If you have access to Creative Cloud, both
fonts can be installed through the Creative Cloud App. Otherwise,
AgriLife provides the fonts through the [Marketing and Communications
branding
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

![Screenshot of rmarkdown template selector](inst/images/template.png)

A new .Rmd file will open with example text and guidance in the
document.

### Theme

Incomplete.
