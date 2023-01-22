# 2019 Canadian Election Study Analysis

## OBJECTIVES
- Analyzed the relationships between different background characteristics (gender, age, level of education) and interest in politics from the 2019 Canadian Election Study
- Conducted bivariate and multivariate linear regression analyses to determine the relationship between gender and interest in politics


## LANGUAGE
- R
- Packages: haven, tidyverse, psych, textreg

## DATA
2019 Canadian Election Study (CES) dataset: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DUS88V

## FINDINGS
### Average reported level of interest in politics between Males, Females, and Non-binary 
On the scale from 0 to 10, on average, males express the most interest in politics with a mean of 6.98, while females express the least with a mean of 6.07, however, they still score above the middle point of the scale. Respondents who identify as non-binary fall in the middle with a mean of 6.46 in comparison to the other two genders.

### Bivariate linear regression analyses between gender and interest in politics
On average, the self-reported level of interest in politics among males and females differs by 0.91 units. This result is statistically significant, as the probability of making a Type I error (i.e., rejecting the null hypothesis of no difference when in fact there is none) is less than 0.01%. Additionally, non-binary respondents also self-report a higher level of interest in politics than females, although the difference is less than half of the gender difference observed when comparing males and females. This difference is also statistically significant, with a probability of making a Type I error of less than 0.01%. Although these differences may be small, they are meaningful as they capture a shift of 0.4 to 0.9 units in self-reported interest in politics. At the lower end, this represents approximately 4% of the length of the full scale, which is small but not trivial. Therefore, we can be confident that we are not incorrectly rejecting the null hypothesis.
==============================
                  Model 1     
------------------------------
(Intercept)           6.07 ***
                     (0.02)   
genderMale            0.91 ***
                     (0.03)   
genderNon-binary      0.40 ** 
                     (0.15)   
------------------------------
R^2                   0.03    
Adj. R^2              0.03    
Num. obs.         35409       
==============================
*** p < 0.001; ** p < 0.01; * p < 0.05

### Multivariate linear regression analyses between gender and interest in politics, with covariates age in years and
education
Upon including controls for education and age, the estimated gender gap in self-reported level of interest in politics changes. However, despite these changes, the regression coefficients for our gender comparisons remain statistically significant. This indicates that the gender differences observed are not solely a result of differences in respondents' education or age. Specifically, the gender gap between men and women slightly decreases when controlling for these variables, but the gap between men and non-binary individuals increases. While the estimates of the gender gap may change, our ultimate conclusion that males report the highest level of interest in politics remains unchanged.
