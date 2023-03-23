# Mini-Project 7 Validation

# clear workspace
rm(list = ls())

# load packages
library(tidyverse)
library(magrittr)

# load data
data <- read.csv('C:/filename.csv') # data should be 50 obs. x 4 variables
data$participant <- factor(data$participant) # make participant variable a factor
table(data$participant) # should be 10 repeats per participant


# LINE PLOT ----
# reshape the data into long format so that there are 4 columns: participant, time, feature (rr or rr_fft), and value
data_long <- data %>% gather() # data_long should be 100 obs. x 4 variables

# line plot
ggplot(data_long, aes()) +
  ggtitle("Figure 1: Line Plot") 

# BAR PLOT ----
# find the mean and standard deviation within each participant-feature
summary <- data_long %>% group_by() %>% summarize() # summary should be 10 obs. x 4 variables

# bar plot
ggplot(summary, aes()) +
  ggtitle("Figure 2: Bar Plot") +

  
# SCATTER PLOT ----
# fit linear model to data, y = rr_fft, x = rr)
fit <- lm(data$rr_fft ~ data$rr)

# combine text for equation
eq <- substitute(italic(y) == a + b %.% italic(x)*", "~~italic(r)^2~"="~r2, 
                 list(a = format(unname(coef(fit)[1]), digits = 2),
                      b = format(unname(coef(fit)[2]), digits = 2),
                      r2 = format(summary(fit)$r.squared, digits = 2)))
text <- as.character(as.expression(eq));

# scatter plot
ggplot(data, aes()) +
  ggtitle("Figure 3: Scatter Plot") +
  annotate("text", x = 30, y = 30, label = text, parse = TRUE) 


# BLAND-ALTMAN PLOT ----
# caclulate and save the differences between the two measures and the averages of the two measures
data %<>% mutate()

# Bland-Altman plot
ggplot(data, aes()) +
  ggtitle("Figure 4: Bland-Altman Plot") 


# BOX PLOT ----
# box plot
ggplot(data, aes()) +
  ggtitle("Figure 5: Box Plot") 
