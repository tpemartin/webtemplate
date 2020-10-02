#' Service that generate elements under materialize framework
#'
#' @return
#' @export
#'
#' @examples none.
materializeService <- function(){
  require(htmltools)
  list(
    insert_navbar=insert_navbar,
    insert_navbarWithTabs=insert_navbarWithTabs,
    build_liGroup=build_liGroup,
    build_liGroupWithTabs=build_liGroupWithTabs,
    insert_sideNav=insert_sideNav
  )
}


insert_navbar = function(listOfLiContents){
  require(htmltools)
  build_liGroup(listOfLiContents) -> liContent
  htmlVerbose = glue::glue(
    '<nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo right">Logo</a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
    {liContent}
        </ul>
      </div>
    </nav>')
  htmltools::htmlTemplate(text_=htmlVerbose)
}

insert_navbarWithTabs = function(listOfLiContents){
  require(htmltools)
  build_liGroupWithTabs(listOfLiContents) -> liContent
  htmlVerbose = glue::glue(
    '<nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo right">Logo</a>
        <ul id="nav-mobile" class="left hide-on-med-and-down tabs">
    {liContent}
        </ul>
      </div>
    </nav>')
  htmltools::htmlTemplate(text_=htmlVerbose)
}
build_liGroup = function(listOfLiContents){
  require(htmltools)
  purrr::map(listOfLiContents,
             ~{
               tags$li(.x)
             }) -> list_of_lis
  do.call(tagList,list_of_lis)
}
build_liGroupWithTabs = function(listOfLiContents){
  require(htmltools)
  purrr::map(listOfLiContents,
             ~{
               tags$li(
                 class="tab",
                 .x)
             }) -> list_of_lis
  do.call(tagList,list_of_lis)
}
insert_sideNav = function(listOfLiContents){
  require(htmltools)
  build_liGroup(listOfLiContents) -> liContent

  htmlVerbose = glue::glue(
    '<nav>
  <ul id="slide-out" class="sidenav  sidenav-fixed">
    <li>
    <div class="user-view">
    <div class="background">
        <img src="images/office.jpg">
    </div>
      <a href="#user"><img class="circle" src="images/yuna.jpg"></a>
      <a href="#name"><span class="white-text name">John Doe</span></a>
      <a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>
    </div></li>
    {liContent}
        </ul>
    </nav>')
  htmltools::htmlTemplate(text_=htmlVerbose)
}
