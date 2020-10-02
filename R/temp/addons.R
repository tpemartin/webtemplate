addons <- list()
require(htmltools)
googleLogin <- function(){
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
  htmlTemplate(
    text_="  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
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
  )
googleLogin
}
addons$googleLogin = list(
  dep=htmlDependency(
      name="google api",
      version="1",
      src="",
      head='
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
      '
    ),
  afterbodyHtml = htmlTemplate(
  text_="  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
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
))
