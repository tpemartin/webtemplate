#' Get menu of all possible choices
#'
#' @return
#' @export
#'
#' @examples menu <- get_menu()
get_menu <- function(){
  list(
    materialize=materialize,
    jQuery=jQuery,
    googleLogin=googleLogin
  )
}

menu <- get_menu()
myChoice = list(
  menu$materialize(),
  menu$jQuery(),
  menu$googleLogin()
)
htmlContext = generate_template(myChoice)
save_html(htmlContext, file="test.html")
