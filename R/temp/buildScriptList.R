rprojroot::is_r_package -> pj
pj$make_fix_file() -> root

script <- list()

# google login
{ ## head script (aka dependencies)
  {
    readr::read_lines(
      file.path(
        root(), "R/html/googleLogInScript.html"
      )
    ) -> googleScript

    script$googleLogIn$beforebody <- googleScript
  }
  ## Within body script
  {
    readr::read_lines(
      file.path(
        root(), "R/html/googleLogInIcon.html"
      )
    ) -> googleLogInIcon

    script$googleLogIn$withinbody <- googleLogInIcon
  }
  ## After body script
  {
    readr::read_lines(
      file.path(
        root(), "R/html/googleLogInAbScript.html"
      )
    ) -> googleLogInAbScript

    script$googleLogIn$afterbody <- googleLogInAbScript
  }

  ## Build htmlDependency
  {
  googleLoginDep <- list()
    ## Head
    {googleLoginDep$head <-
      htmltools::htmlDependency(
      name="googleLogIn",
      version="0.0.1",
      src=c(
        file="lib/googleLogIn/js"
      ),
      script="head"
    )
  }
    ## afterbody
    {}
  }
}


usethis::use_data(script, internal=T, overwrite = T)
