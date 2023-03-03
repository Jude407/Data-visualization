library(readr)
WHO_COVID_19_global_table_data <- read_csv("C:/Users/LENOVO/Downloads/WHO-COVID-19-global-table-data.csv")
View(WHO_COVID_19_global_table_data)
library(tidyverse)
attach(WHO_COVID_19_global_table_data)
jude <- na.omit(WHO_COVID_19_global_table_data) #I removed all missing values and renamed the data as jude
attach(jude) #I attached my new covid-19 data without missing value
ggplot(jude, aes(y = `WHO Region`, x = `Deaths - cumulative total per 100000 population`, color = `WHO Region`)) + geom_jitter(alpha = 0.7, size = 1.5) + theme_linedraw() + labs(title = "Cummulative total deaths per 100,000 population by Region") + theme(legend.position = "none")
African_data <- jude %>% filter(`WHO Region` == "Africa") #Filtered the data to include only African countries
attach(African_data)
ggplot(African_data, aes(x = `Deaths - cumulative total`, y = Name)) + geom_point(color="blue", size = 2) + geom_segment(aes(x = 40, xend = `Deaths - cumulative total`, y = reorder(Name, `Deaths - cumulative total`), yend = reorder(Name, `Deaths - cumulative total`)), color = "lightgrey") + theme_minimal() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + labs(title = "Cummulative total deaths from covid-19 in Africa", y = "Countries", x = "Deaths - Cummulative total")

