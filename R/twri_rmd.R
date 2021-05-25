#' RMD Word Template for TWRI
#'
#' Loads an Rmarkdown template that will produce a Microsoft word document
#' consistent with institute brand guidance.
#'
#' @param base_format character, either "rmarkdown::word_document" or
#'   "bookdown::word_document2" (default)
#' @param toc logical defaults FALSE. The template utilizes the TOC function in
#'   Word that can be manually removed or customized.
#' @param number_sections logical
#' @param fig_captions logical
#' @param reference_docx character, specifies the template document to use.
#' @param ... additional arguments to \@code{rdocx_document}
#'
#' @import officedown
#' @import bookdown
#' @export
twri_docx <- function(base_format = "bookdown::word_document2",
                     toc = FALSE,
                     number_sections = TRUE,
                     fig_captions = TRUE,
                     reference_docx = "format.docx",
                     ...) {

  officedown::rdocx_document(
    base_format = base_format,
    toc = toc,
    number_sections = number_sections,
    fig_caption = fig_captions,
    reference_docx = reference_docx,
    ...
  )
}



#' RMD PDF Template for TWRI
#'
#' Loads an Rmarkdown template that will produce a pdf document
#' consistent with institute brand guidance.
#'
#' @param toc Logical
#' @param toc_depth numeric
#' @param number_sections logical
#' @param latex_engine character, one of "pdflatex", "lualatex", or "xelatex"
#' @param ... arguments passed to pdf_document
#' @export
#'
twri_pdf <-function(toc = TRUE,
                    toc_depth = 2,
                    number_sections = TRUE,
                    latex_engine = "lualatex",
                    ...) {

  #pandoc_args <- "--lua-filter=lua_filters/scholarly-metadata.lua --lua-filter=lua_filters/author-info-blocks.lua"

  bookdown::pdf_document2(toc = toc,
                          toc_depth = toc_depth,
                          number_sections = number_sections,
                          latex_engine = latex_engine,
                          ...)
}
