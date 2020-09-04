#' Create a R Markdown with file system that supports Materialized Web framework
#'
#' @return No return. Simply a file system
#' @export
#'
#' @examples none.
create_materializedFramework <- function(){
  downloadUrl <- "https://www.dropbox.com/s/oz385kxex63yoa6/MaterializedFramework.zip?dl=1"
  download_unzip(downloadUrl)
}


# helpers -----------------------------------------------------------------


download_unzip <- function(downloadUrl){
  filename <- stringr::str_remove(basename(downloadUrl),"\\?[:graph:]+$")

  download.file(
    url=downloadUrl,
    destfile=filename
  )

  unzip(
    zipfile=filename
  )

  unlink(filename)
}

