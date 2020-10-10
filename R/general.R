#' Get the root path of the project
#'
#' @return A character
#' @export
#'
#' @examples get_root()
get_root = function(){
  rprojroot::is_rstudio_project -> pj
  pj$make_fix_file() -> root
  root()
}
build_tagListOfImgs <- function(listOfSrcs){
  purrr::map(
    listOfSrcs,
    ~htmltools::img(
      src=.x
    )
  ) -> listOfImgs
  htmltools::tagList(listOfImgs)
}

# build_tagListOfImgs(
#   list(
#     "https://i.imgur.com/XPcc1WF.png",
#     "https://i.imgur.com/CY2AWmB.png"
#   )
# )
