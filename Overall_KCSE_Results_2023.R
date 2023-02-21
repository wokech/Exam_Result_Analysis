# 2023 Exam Results Analysis

# 1) Load the required data
install.packages("readxl")
library(readxl)

data <- read_excel("KCSE_2023.xlsx")
View(data)

# 2) Tidy the data

library(janitor)

library(tidyverse)

library(tidyr)

data <- data %>% clean_names()

long_data <- data %>% pivot_longer(cols=c("male", "female"),
                    names_to='Sex',
                    values_to='Number') 


###### as.factor() and fct_inorder() are very important!!!

long_data$grades <- as.factor(long_data$grades)
class(long_data$grades)
long_data$grades <- fct_inorder(long_data$grades)

ggplot(long_data, aes(fill=Sex, y=Number, x=grades)) + 
  geom_bar(position="dodge", stat="identity")
