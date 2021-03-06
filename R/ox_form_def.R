#' Form definitions in a dataframe
#'
#' Returns a dataframe with study form definitions from a parsed OpenClinica
#' odm1.3 .xml export file.
#'
#' @param parsed_xml An object of class \code{XMLInternalDocument}, as returned
#' by \code{XML::xmlParse()}.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' # The example odm1.3 xml file address
#' my_file <- system.file("extdata",
#'                        "odm1.3_full_example.xml",
#'                        package = "ox",
#'                        mustWork = TRUE)
#'
#' # Parsing the xml file
#' library(XML)
#' doc <- xmlParse(my_file)
#'
#' # Form definitions in a dataframe
#' form_def <- ox_form_def(doc)
#' head(form_def)
ox_form_def <- function (parsed_xml) {

  if (! "XMLInternalDocument" %in% class(parsed_xml)) {
    stop("parsed_xml should be an object of class XMLInternalDocument", call. = FALSE)
  }

  # return
  .attrs_node_and_ancestors(parsed_xml, "FormDef") %>%
    dplyr::select(form_oid = OID.2,
                  form_name = Name.1,
                  form_repeating = Repeating)

}


