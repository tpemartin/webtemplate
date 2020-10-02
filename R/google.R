

# helper ------------------------------------------------------------------

supply_appInfo <- function(apiKey, clientId){
  stringr::str_replace_all(
    "YOUR_API_KEY", apiKey
  )
  readr::read_lines("html/googleLogInScript.html") -> scripts
}
