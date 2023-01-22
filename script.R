library(haven)
library(tidyverse)
library(psych)
library(texreg)

# Read data
ces <- read_dta("2019 CES online.dta")

# Explotary analysis
table(ces$cps19_gender)
table(ces$cps19_education)
table(ces$cps19_interest_gen_1)
table(ces$cps19_yob)

# Recode gender
ces$gender <- ces$cps19_gender
ces$gender[ces$cps19_gender == 1] <- "Male"
ces$gender[ces$cps19_gender == 2] <- "Female"
ces$gender[ces$cps19_gender == 3] <- "Non-binary"
# Check
table(ces$gender, ces$cps19_gender)

# Recode education
ces$education <- ces$cps19_education
ces$education[ces$cps19_education <= 5] <- "High school or less"
ces$education[ces$cps19_education >= 6 & ces$cps19_education <= 8] <- "Some post-secondary"
ces$education[ces$cps19_education >= 9] <- "Completed post-secondary degree"
# Re-order the variable so the categories are ranked logically, from lowest to highest
ces$education <- factor(ces$education,
                        levels = c("High school or less",
                                   "Some post-secondary",
                                   "Completed post-secondary degree"))
# Check
table(ces$education, ces$cps19_education)

# Compare the average reported level of interest in politics between Males, Females, and
# Non-binary respondents 
describeBy(ces$cps19_interest_gen_1, ces$gender, fast = T)

# Bivariate linear regression analysis for:
# - gender (independent variable) & 
# - interest in politics (dependent variable)
reg1 <- lm(cps19_interest_gen_1 ~ gender, data = ces)
screenreg(reg1)

# Multivariate linear regression analysis including the covariates :
# - age in years &
# - education
reg2 <- lm(cps19_interest_gen_1 ~ gender + cps19_yob + education, data = ces)
screenreg(list(reg1, reg2))