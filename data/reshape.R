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

new_wide_data <- new_tidy_data %>% spread(year, fertility)
new_wide_data


filename <- "life-expectancy-and-fertility-two-countries-example.csv"
filename <- file.path(path,filename)

raw_dat <- read_csv(filename)
raw_dat


dat <- raw_dat %>% gather(key,value, -country)
dat %>% separate(key,c("year","variable_name"),"_")
new <- dat %>% separate(key, c("year", "variable_name"))
