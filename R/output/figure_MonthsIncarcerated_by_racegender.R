# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_Incarceration02_clean.csv")) %>%
  group_by(Race, Gender) %>%
  summarize(MonthsIncarcerated = mean(MonthsIncarcerated)) %>%
  ggplot(aes(Gender, MonthsIncarcerated, fill = Gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(~Race) +
    labs(
      x = "Race", 
      y = "Average Months Incarcerated", 
      fill = "Gender",
      title = "Mean Months Spent Incarcerated in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/MonthsIncarcerated_by_racegender.png"), bg="white", width=8, height=4.5)
