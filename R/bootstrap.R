#' Generate carousel with indicators
#'
#' @param id A character
#' @param listOfImgUrls A character vector of urls
#'
#' @return
#' @export
#'
#' @examples id="carouselExampleIndicators"
#' listOfImgUrls <- list(
#'   "https://i.imgur.com/XPcc1WF.png",
#'   "https://i.imgur.com/CY2AWmB.png"
#' )
#' generate_carousel_indicators(id, listOfImgUrls)
generate_carousel_indicators <- function(id, listOfImgUrls){
  require(htmltools)
  # c_slide: initiate carousel slide
  c_slide=div(id=id,
      class="carousel slide",
      `data-ride`="carousel")

  # c_indicator: build carousel-indicators
  c_indicator = carousel_indicators(id, listOfImgUrls)

  # c_inner: build carousel-inner
  c_inner=
    div(
      class="carousel-inner",
      carousel_inner(listOfImgUrls)
    )

  # c_control: build carousel-control
  c_control = carousel_control(id)

  # Assemble
  tagAppendChildren(
    c_slide,
    c_indicator,
    c_inner,
    c_control
  )
}
carousel_indicators <- function(id, listOfImgUrls){
  tags$li(
    `data-target`=paste0("#",id)
  ) -> liTemplate
  purrr::map(
    seq_along(listOfImgUrls),
    ~{
      item <- liTemplate
      tagAppendAttributes(item,
                          "data-slide-to"=
                            (.x-1))
    }
  ) -> liGroups
  tags$ol(
    class="carousel-indicators",
    liGroups
  ) -> c_indicators
  c_indicators

  c_control = carousel_control(id)
}

carousel_control <- function(id){
  htmltools::htmlTemplate(text_=
  glue::glue('<a class="carousel-control-prev" href="#{id}" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#{id}" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>'))
}
carousel_inner <- function(listOfImgUrls){
  tagListOfImgs <- build_tagListOfImgs(
    listOfImgUrls
  )
  purrr::map(
    seq_along(tagListOfImgs[[1]]),
    ~{
      tagAppendAttributes(tagListOfImgs[[1]][[.x]], class="d-block w-100") -> tagNew
      class=ifelse(
        .x==1,
        "carousel-item active",
        "acarousel-item"
      )
      div(
        class=class,
        tagNew
      )
    }
  ) -> newTagList
 newTagList
}


