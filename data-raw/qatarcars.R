library(dplyr)
library(readr)
library(haven)

# Clean data ----
qatarcars_df <- haven::read_dta(here::here(
  "inst",
  "extdata",
  "qatarcars.dta"
)) |>
  # Get rid of Stata format metadata
  haven::zap_formats() |>
  mutate(across(where(is.labelled), \(x) haven::as_factor(x))) |>
  # Stata stores way too many decimal points because of floating point numbers,
  # so we round these to more reasonable values (matching what Stata displays)
  mutate(
    across(c(length, width, height), \(x) round(x, 3)),
    across(c(economy, performance), \(x) round(x, 1))
  ) |>
  mutate(across(where(is.character), as.factor)) |>
  as.data.frame() |>
  # Get rid of dataset-level Stata metadata + fix spacing for performance label
  (\(x) {
    attributes(x)$label <- NULL
    attributes(x)$notes <- NULL
    attr(x$performance, "label") <- "Time 0-100 km/h (s)"
    x
  })()


# Add data to the package ----
usethis::use_data(qatarcars_df, internal = TRUE, overwrite = TRUE)

saveRDS(qatarcars_df, here::here("inst", "extdata", "qatarcars.rds"))

readr::write_csv(
  qatarcars_df,
  here::here("inst", "extdata", "qatarcars.csv"),
  na = ""
)
