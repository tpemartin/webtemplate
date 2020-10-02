# google login
googleLoginTemplate <- function(){
  ## head script (aka dependencies)
  {
    dependency <-
      htmltools::htmlDependency(
      name="googleLogin",
      version="0.0.1",
      src=c(file="js"),
      script = "googleLoginHead.js"
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
      apiKey, clientId, env=googleLoginEnv){
      readLines("js/googleLoginHead.js") -> lines
      stringr::str_replace_all(
        lines,
        'YOUR_API_KEY', apiKey) -> lines
      stringr::str_replace_all(
        lines,
        'YOUR_CLIENT_ID', clientId
      ) -> lines
      writeLines(lines,"js/googleLoginHead.js")
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

