#read in some data
schools <- read_csv("https://data.nsw.gov.au/data/dataset/78c10ea3-8d04-4c9c-b255-bbf8547e37e7/resource/3e6d5f6a-055c-440d-a690-fc0537c31095/download/master_dataset.csv",
                    col_types = cols(
                      .default = col_guess(),
                      LBOTE_pct = col_double(),
                      Indigenous_pct = col_double()
                    ))


#typical use of 'theme_doe' and 'scale_fill_doe'
schools |>
  filter(str_detect(Principal_network, "Connected Communities")) |>
  ggplot(aes(x = Principal_network, fill = Level_of_schooling)) +
  geom_bar(colour = "black", position = position_dodge(preserve = "single")) +
  theme_doe() +
  labs(y = "Schools", x = "") +
  scale_fill_doe()


#modify angle and colour of axis.text, and orientation of legend, by adding arguments to the call to 'theme_doe'
schools |>
  filter(str_detect(Principal_network, "Connected Communities")) |>
  ggplot(aes(x = Principal_network, fill = Level_of_schooling)) +
  geom_bar(colour = "black", position = position_dodge(preserve = "single")) +
  theme_doe(axis.text.x = element_text(color = 'blue', angle = 15, hjust = 0.75, vjust = 1), #add angle to x-axis labels
            axis.title.y = element_text(color = 'blue', angle = 0), #rotate y-axis title
            legend.direction = "vertical") + #stack legend text vertically
  labs(y = "Schools", x = "") +
  scale_fill_doe()
