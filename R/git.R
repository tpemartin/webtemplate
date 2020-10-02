library(gitignore); library(dplyr); library(stringr)
gi_fetch_templates("R") %>%
  gi_write_gitignore()

gi_fetch_templates("R") -> newLines
stringr::str_split(newLines, "\n") -> newLines

newLines[[1]] %>%
  stringr::str_detect("^#", negate = T) -> pickNonComment
(newLines[[1]]!="") -> pickNonEmpty
newLines[[1]][pickNonComment & pickNonEmpty] -> ignorePattern

newLines %>% View()

command2RemoveFile <- 'git rm --cached {file}'
command2RemoveFolder <- 'git rm -r --cached {folder}'

for(.x in seq_along(ignorePattern)){
  #.x=1
  if(stringr::str_detect(ignorePattern[[.x]],"/$")){
    folder=ignorePattern[[.x]]
    system(glue::glue(command2RemoveFolder))
  } else {
    file=ignorePattern[[.x]]
    system(glue::glue(command2RemoveFile))
  }
}
