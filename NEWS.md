# twriTemplates 0.2.3

## Minor changes

* add pkgdown template for other packages
* use pkgdown to document package
* add contributors

# twriTemplates 0.2.2

## Major changes

* `twri_docx()` is depreciated, the docx template now calls officedown directly.

## Minor bug fixes

* twri-docx template includes new chunk options for formatting table and figure 
captions provided by officedown. (#11)
* fix issue with citations causing pdf build failures.

# twriTemplates 0.2.1

## New features

* ggplot2_box_legend creates boxplot legend.

## Minor bug fixes

* fixed issue where gridlines overlapped axis lines (#8)
* fix latex error when chunk code is not displayed (#7)


# twriTemplates 0.2.0

* Initial package release.
* Includes two rmarkdown templates for word and pdf document creation.
* Includes two ggplot2 themes for print and presentation graphics.
* Unit testing handled by testthat
* Github actions used for r-cmd-check

