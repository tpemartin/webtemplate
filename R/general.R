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
