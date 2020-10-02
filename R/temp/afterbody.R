

generate_afterBodyScript <- function(list_js=list()){
  c(
    "document.addEventListener('DOMContentLoaded', function() {",
    "//insert your after body js here",
    unlist(list_js),
    "});"
    )
}
