delayedAssign("qatarcars", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(qatarcars:::qatarcars_df)
  } else {
    qatarcars:::qatarcars_df
  }
}))
