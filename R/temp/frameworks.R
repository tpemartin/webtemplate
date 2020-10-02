
menu_frameworks <- function(){
  framework <- list()
  framework$materialize <- list(
    dep=htmlDependency(
      name = "materialize",
      version = "1.0.0",
      src = list(
        href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/"
      ),
      script = "js/materialize.min.js",
      stylesheet = "css/materialize.min.css"
    ),
    afterbodyJs=c("// materialized initiation"," M.AutoInit();")
  )
  framework
}

