# Builds a LaTeX table of mean arrests by race and gender.
# See the pivoting vignette for how to use pivot functions.
# vignette("pivot")
# Documentation for the kableExtra package is here:
# https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_pdf.pdf

read_csv(here("data/NLSY97_Incarceration02_clean.csv")) %>%
  
  # summarize arrests by race and gender
  group_by(Race, Gender) %>%
  summarize(MonthsIncarcerated = mean(MonthsIncarcerated)) %>%
  
  # pivot the values from race into columns
  pivot_wider(names_from = Race, values_from = MonthsIncarcerated) %>%
  
  # rename columns using snakecase
  rename_with(to_title_case) %>%
  
  # create the kable object. Requires booktabs and float LaTeX packages
  kbl(
    caption = "Mean Months Incarcerated in 2002 by Race and Gender",
    booktabs = TRUE,
    format = "latex",
    label = "tab:summarystats"
  ) %>%
  kable_styling(latex_options = c("striped", "HOLD_position")) %>%
  
  write_lines(here("tables/MonthsIncarcerated_by_racegender.tex"))
  