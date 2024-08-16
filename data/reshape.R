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

#gather changes the wide data into tidy data
dat <- raw_dat %>% gather(key,value, -country)


#separate is used when we need to separate a variable into 2
dat %>% separate(key,c("year","variable_name"),"_")

new <- dat %>% separate(key, c("year", "variable_name"))

#if any part of the new variable name has 2 parts we have to write
var_name <- c("year","first_variable_name","second_variable_name")
dat %>% separate(key, var_name, fill = "right")


dat %>% separate(key, c("year","variable_name"), extra = "merge")
