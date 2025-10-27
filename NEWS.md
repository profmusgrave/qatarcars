# qatarcars (development version)

- Made some minor corrections to the data based on reviewer feedback (dropped one BMW, reclassified eight cars, and added six new cars)
- Updated canonical URL to original .dta file to <https://qatarcars.georgetown.domains/qatarcars.dta>
- Added reference/citation information to DESCRIPTION and inst/CITATION
- Fix badges in README
- Added functions for converting from QAR to USD and EUR:
  - From QAR: `qar_to_usd()` and `qar_to_eur()`
  - From USD: `usd_to_qar()` and `usd_to_eur()`
  - From EUR: `eur_to_qar()` and `eur_to_usd()`
- Added functions for converting between SI and US customary units:
  - Distance: `m_to_ft()` and `ft_to_m()`
  - Mass: `kg_to_lbs()` and `lbs_to_kg()`
  - Volume: `l_to_cuft()` and `cuft_to_l()`
  - Economy: `lp100km_to_mpg()` and `mpg_to_lp100km()`
  - Performance: `kmh100_to_mph60()` and `mph60_to_kmh100()`
- Added Qatari maroon color as `qatar_maroon`

# qatarcars 1.0.0

- Initial CRAN submission.
