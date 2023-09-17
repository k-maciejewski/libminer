#' R Library Summary
#'
#' Provide a brief summary of package libraries on machine
#'
#' @param sizes logical indicating whether or not to calculate library sizes
#' Default `FALSE`
#'
#' @return A `data.frame` containing count of packages per library and location
#'  of user libraries
#' @export
#'
#' @examples
#' lib_summary()

lib_summary <- function(sizes = F) {

  # check conditions up front so if it fails it does so immediately
  # defensive coding

  if(!is.logical(sizes)){
    stop("'sizes' must be TRUE or FALSE")
  }

  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = F)
  names(pkg_df) <- c("Library", "n_packages")

  if (sizes){
    pkg_df$lib_size <- sapply(
      pkg_df$Library,
      function(x) {
        sum(fs::file_size(fs::dir_ls(x, recurse = T)))
      }
    )
  }

  pkg_df
}
