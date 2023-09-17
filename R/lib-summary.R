#' R Library Summary
#'
#' Provide a brief summary of package libraries on machine
#'
#' @return A `data.frame` containing count of packages per library and location
#'  of user libraries
#' @export
#'
#' @examples
#' lib_summary()

lib_summary <- function() {
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = F)
  names(pkg_df) <- c("Library", "n_packages")
  pkg_df
}
