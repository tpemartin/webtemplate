#' Generate a google login environment, with preprocessing function to tailor developer app
#'
#' @return
#' @export
#'
#' @examples none
googleLoginModule <- function(){
  ## head script (aka dependencies)
  {
    # "https://fonts.googleapis.com/css?family=Roboto"
    # "https://apis.google.com/js/api:client.js"
    dependency1 <-
      htmltools::htmlDependency(
        name="google_apis",
        version="0.0.1",
        src=c(href="https://apis.google.com/js"),
        # script can not contain folder. it causes infinite loop in libdir
        script="api:client.js",
        head='<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">'
      )
    dependency2 <-
      htmltools::htmlDependency(
        name="google_login",
        version="0.0.1",
        src=c(file="./js"),
        script = "googleLoginHead.js")

    dependency3 <-
      htmlDependency(
        name="google_login_icon",
        version="0.0.1",
        src=c(file="./css"),
        # stylesheet can not contain folder. it causes infinite loop in libdir
        stylesheet = "googleLogin.css"
      )
    dependency <-
      list(
        dependency1,
        dependency2,
        dependency3
      )
  }
  ## Within body script
  {
    withinbody <-
      htmltools::includeHTML('html/googleLoginWithinbody.html')
    ## 依原始文件來決定用includeHTML, includeScript, etc.
  }
  ## After body script
  {
    afterbody <-
      htmltools::includeHTML(
        'html/googleLoginAfterbody.html')
    ## 依原始文件來決定用includeHTML, includeScript, etc.
  }

  ## preprocessing
  {
    preprocessing = function(
      clientId, env=googleLoginEnv){
      readLines("js/googleLoginHead.js") -> lines
      stringr::str_replace_all(
        lines,
        'clientId', clientId
      ) -> lines
      writeLines(lines,"js/googleLoginHead.js")
      # You can change dep, afterbody, etc setting via env$... call

      # No longer need preprocessing after processing
      # env$preprocessing <- NULL
      invisible(env)
    }

  }

  ## Collect together and contain inside an environment
  {
    googleLoginEnv <- new.env()
    googleLoginEnv$dependency = dependency
    googleLoginEnv$withinbody = withinbody
    googleLoginEnv$afterbody = afterbody
    googleLoginEnv$preprocessing = preprocessing
  }
  return(googleLoginEnv)
}

