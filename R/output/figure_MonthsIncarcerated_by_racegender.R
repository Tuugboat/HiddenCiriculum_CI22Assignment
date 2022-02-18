# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_Incarceration02_clean.csv")) %>%
  group_by(Race, Gender) %>%
  summarize(MonthsIncarcerated = mean(MonthsIncarcerated)) %>%
  ggplot(aes(Race, MonthsIncarcerated, fill = Gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    #facet_wrap(~Race, nrow = 1) +
    labs(
      x = "Race", 
      y = "Average Months Incarcerated", 
      fill = "Gender",
      title = "Mean Months Spent Incarcerated in 2002 by Race and Gender") +
      scale_x_discrete(labels = label_wrap_gen()) +
    scale_fill_economist() +
    theme_minimal()

ggsave(here("figures/MonthsIncarcerated_by_racegender.png"), bg="white", width=8, height=4.5)
