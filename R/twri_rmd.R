#' RMD docx template for TWRI
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Development on `twri_docx()` is complete. It is recommended to use
#' `officedown::rdocx_document()` directly. This function is retained for older
#' templates that include the function, although rendered documents might be
#' inconsistent. It is suggested to update any reports to the latest version of
#' twriTemplates as `twri_docx()` may be removed in future versions.
#'
#' Loads an Rmarkdown template that will produce a Microsoft word document
#' consistent with institute brand guidance.
#'
#' @param base_format character, either `rmarkdown::word_document` or
#'   `bookdown::word_document2` (default)
#' @param tables empty list, used by [officedown::rdocx_document()]
#' @param plots empty list, used by [officedown::rdocx_document()]
#' @param lists empty list, used by [officedown::rdocx_document()]
#' @param mapstyles empty list, used by [officedown::rdocx_document()]
#' @param page_size empty list, used by [officedown::rdocx_document()]
#' @param page_margins empty list, used by [officedown::rdocx_document()]
#' @param reference_num if `TRUE` text for references to sections will be the
#'   section number. If `FALSE` the text for references to sections will be the
#'   section title. Default is `TRUE`.
#' @param toc logical defaults FALSE. The template utilizes the TOC function in
#'   Word that can be manually removed or customized.
#' @param number_sections logical
#' @param fig_captions logical
#' @param reference_docx character, specifies the template document to use.
#' @param ... additional arguments to [officedown::rdocx_document()]
#'
#' @import officedown
#' @import bookdown
#' @export
twri_docx <- function(base_format = "bookdown::word_document2",
                      tables = list(),
                      plots = list(),
                      lists = list(),
                      mapstyles = list(),
                      page_size = list(),
                      page_margins = list(),
                      reference_num = TRUE,
                      toc = FALSE,
                      number_sections = TRUE,
                      fig_captions = TRUE,
                      reference_docx = "format.docx",
                      ...) {
  lifecycle::deprecate_warn("0.2.3",
                            "twri_docx()",
                            "officedown::docx_document()")

  requireNamespace("officedown")

  officedown::rdocx_document(
    base_format = base_format,
    tables = tables,
    plots = plots,
    lists = lists,
    mapstyles = mapstyles,
    page_size = page_size,
    page_margins = page_margins,
    reference_num = FALSE,
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
