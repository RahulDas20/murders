library(tidyverse)
library(dslabs)

path <- system.file("extdata", package = "dslabs")

filename <- file.path(path,"fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
wide_data
new_tidy_data <- gather(wide_data, year, fertility, -country, convert = TRUE)

new_tidy_data %>%
  ggplot(aes(year,fertility)) +
  geom_point(aes(color=country))

new_wide_data <- 