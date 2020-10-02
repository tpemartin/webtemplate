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

#' Get an empty template to fill up for html dependency
#'
#' @return
#' @export
#'
#' @examples none
get_depTemplate <- function(){
  list(
    dep=list(),
    afterbodyJs=list(),
    afterbodyHtml=list(),
    withinbodyHtml=list(),
    functions=list()
  )
}

# helpers -----------------------------------------------------------------

menu_itemTemplate <- function(){
  list(
    dep=list(),
    afterbodyJs=list(),
    afterbodyHtml=list(),
    withinbodyHtml=list(),
    functions=list()
  )
}

bootstrap <- function(){
  bt <- menu_itemTemplate()
  bt$dep <-
    htmltools::htmlDependency(
      name="bootstrap",
      version="4.0",
      src=list(
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0"),
      stylesheet = "css/bootstrap.min.css",
      script = "js/bootstrap.min.js"
    )
  jq <- jQuery()
  popper <- popperJs()
  list(
    bt, jq, popper
  )
}
popperJs <- function(){
  menu <- menu_itemTemplate()
  menu$dep <-
    htmlDependency(
      name="popper",
      version="1.12.9",
      src=list(
        href="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9"
      ),
      script = "umd/popper.min.js"
    )
  menu
}

materialize <- function(){
  require(htmltools)
  materialize <- menu_itemTemplate()
  materialize$dep <-
    htmlDependency(
      name = "materialize",
      version = "1.0.0",
      src = list(
        href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/"
      ),
      script = "js/materialize.min.js",
      stylesheet = "css/materialize.min.css",
      head=' <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">'
    )
  materialize$afterbodyJs <-
    "//materialize auto initi start
  M.AutoInit();
  //materialize auto init end"
  materialize$functions <- materializeService()
  materialize
}
googleLogin <- function(){
  require(htmltools)

  googleLogin <- menu_itemTemplate()
  googleLogin$dep <- htmlDependency(
    name="google api",
    version="1",
    src="",
    head='
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
      '
  )
  googleLogin$afterbodyHtml <-
    "  <script>
    var user;
    function onSuccess(googleUser) {
       user=googleUser;
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      window.localStorage.setItem(\"googleUserId\",Ca);
      window.localStorage.setItem(\"user\",user)
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>

  <script src=\"https://apis.google.com/js/platform.js?onload=renderButton\" async defer></script>"

  googleLogin$withinbodyHtml <- list(
    "<!--google login button-->
    <div id=\"my-signin2\"></div>
    "
  )
  googleLogin
}
jQuery <- function(){
  require(htmltools)

  jQuery <- menu_itemTemplate()
  jQuery$dep <- htmlDependency(
    name = "jQuery",
    version = "3.5.1",
    src = "",
    head = '<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
'
  )
  jQuery
}




