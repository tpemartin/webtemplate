#' Generate htmlcontext to be save_html
#'
#' @param myChoice A list. Use menu <- get_menu() to obtain menu, then construct myChoice= list( menu$optionM(), menu$optionK(),... )
#' @param .body A tagList of each body child elements other than afterbodyJs and afterbodyHtml. However, some framework such as google login requires a holder withinbody. You need to place it in your .body
#'
#' @return A shiny.tag class htmlContext ready to save_html
#' @export
#'
#' @examples none
generate_template <- function(myChoice, .body = NULL) {
  require(purrr)
  map(
    myChoice,
    ~ pluck(.x, "dep")
  ) -> allDeps
  # scripts that require document ready
  map(
    myChoice,
    ~ pluck(.x, "afterbodyJs")
  ) -> allAfterbodyJs
  require(dplyr)
  flatten(allAfterbodyJs) %>%
    reduce(paste, sep = "\n") %>%
    {
      c(
        "document.addEventListener('DOMContentLoaded', function() {",
        "//insert your after body js here",
        .,
        "});"
      )
    } %>%
    writeLines(con = "afterbody.js")

  # scripts that do not want document ready have to be in html format
  map(
    myChoice,
    ~ pluck(.x, "afterbodyHtml")
  ) %>%
    flatten() %>%
    map(
      ~ {
        htmlTemplate(
          text_ = .x
        )
      }
    ) -> allAfterbodyHtml

  map(
    myChoice,
    ~ pluck(.x, "withinbodyHtml")
  ) %>%
    flatten() %>%
    map(
      ~ {
        htmlTemplate(
          text_ = .x
        )
      }
    ) -> allwithinbodyHtml

  afterbodyJs <- includeScript("afterbody.js")
  if (is.null(.body)) {
    myBody <-
      tags$body(
        allwithinbodyHtml,
        allAfterbodyHtml,
        afterbodyJs
      )
  } else {
    append(
      .body,
      list(
        allAfterbodyHtml,
        afterbodyJs
      )
    ) -> fullBody
    fullBody <- tagList(fullBody)
    myBody <- tags$body(
      fullBody
    )
  }
  htmlDependencies(myBody) <- allDeps
  myBody
}

#' Extract withinbody html components from myChoice
#'
#' @param myChoice A list from menu<- get_menu(); myChoice <- list(menu$...(), menu$...(),...)
#'
#' @return A taglist
#' @export
#'
#' @examples none
extract_withinbodyHtml = function(myChoice){
  require(dplyr)
  purrr::map(myChoice,
      ~purrr::pluck(.x,"withinbodyHtml")) %>% #-> components
    purrr::flatten() %>% #-> flatOutcome
    purrr::map(
      ~{htmltools::htmlTemplate(
        text_=.x)}
    )-> allwithinbodyHtml
  htmltools::tagList(allwithinbodyHtml)
}

