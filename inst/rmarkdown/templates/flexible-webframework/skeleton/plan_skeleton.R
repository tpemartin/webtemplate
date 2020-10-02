# plan_skeleton------------
plan_skeleton=drake::drake_plan(
# > plan begins -----------
# >> frameworkChoice--------------
frameworkChoice = {
  menu <- get_menu()
  myChoice <- list(
    menu$materialize(),
    menu$jQuery(),
    menu$googleLogin()
  )
  myChoice
},

# >> body--------------
body = {
  tagList(
    tags$header(
    "Title"),
    tags$div(class="division"),
    tags$main(
      "Main content"
    ),
    tags$footer(
      "footer"
    )
  )
},

# >> myStyle--------------
myStyle={
  template <- webtemplate::menu_itemTemplate()
  template$dep <- 
    htmltools::htmlDependency(
      name="myStyle", 
      version="0.1",
      src="css/myStyle.css"
    )
},

# >> myJs--------------
myJs = {
  template <- webtemplate::menu_itemTemplate()
  template$afterbodyJs <- 
    htmltools::includeScript(
      "js/myJs.js"
    )
  template
},

# >> myAfterbodyHtml--------------
myAfterbodyHtml = {
  template <- webtemplate::menu_itemTemplate()
  template$afterbodyHtml <-
    htmltools::includeHTML(
      "html/myJsWithScriptTag.html"
    )
  template
},

# >> outputWeblayout--------------
outputWeblayout = {
  bodyLayout <- generate_template(
    frameworkChoice,
    .body=body
  )
  save_html(bodyLayout, file="template.html")
}

# > plan ends ------------
)

# make plan -----------------
mk_plan_skeleton = function(cachePath="/Users/martin/Github/webtemplate/.template"){
# no params in the frontmatter

library(htmltools);
library(dplyr);library(webtemplate)

library(drake)
options(rstudio_drake_cache = storr::storr_rds("/Users/martin/Github/webtemplate/.template", hash_algorithm = "xxhash64"))
make(plan_skeleton, cache=drake::drake_cache(path=cachePath))
###{r hijackHtml, afterMake=T}
hijackHtml = {
  # if you need to modify template.html after it was made, put code here.
}
###
}

vis_plan_skeleton <- function(cachePath="/Users/martin/Github/webtemplate/.template"){
# no params in the frontmatter

library(htmltools);
library(dplyr);library(webtemplate)
drake::vis_drake_graph(plan_skeleton, cache=drake::drake_cache(path=cachePath))
}
meta_plan_skeleton=
list(
cachePath="/Users/martin/Github/webtemplate/.template",
readd=function(t) {
  drake::readd(t,cache=drake::drake_cache(path="/Users/martin/Github/webtemplate/.template"))},
clean=function(t=NULL) {
  drake::clean(t,cache=drake::drake_cache(path="/Users/martin/Github/webtemplate/.template"))})

