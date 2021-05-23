#
# descobre quais colunas são compostas somente de NA
#

# from
# https://stackoverflow.com/questions/15968494/how-to-delete-columns-that-contain-only-nas
#

remove.colunas.vazias <- function(df_) {
  no.empty.cols <- df_ %>% select_if( ~ !all(is.na(.)))
  
  return(no.empty.cols)
}
