
menu_jsLibraries <- function(){
  jsLibrary <- list()
  jsLibrary$jquery <-
    list(
      dep=htmlDependency(
        name = "jQuery",
        version = "3.5.1",
        src = "",
        head = '<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
'
      )
  )
  jsLibrary
}

