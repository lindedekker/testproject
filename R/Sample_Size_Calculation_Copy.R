# load required package
library(powerSurvEpi)

# functions for power- and sample size calculation for non-binary covariates.
ssizeEpiCont.default()
powerEpiCont.default()

# load database
setwd("C:/Users/ldekke11/OneDrive - Prinses Maxima Centrum/PhD Project/Courses/Writing_Reproducible_Code/testproject/data/raw")
cohort <- read.csv("cohort_for_course_WritingReproducibleCode.csv", header = TRUE)

### Sample Size Calculation ###

# create function for sample size calculation for continuous predictor
samplesize_function <- function(x) {
  sample_size <- ssizeEpiCont.default(
    power = 0.806,
    theta = theta,
    sigma2 = var(predictor),
    psi = mean(cohort[[x]] == 1),
    rho2 = sqrt(cor(predictor, cohort[[x]])),
    alpha = 0.05
  )
  print(c(x, sample_size))
  #' paste the outcome variable and its corresponding sample size needed
  #' 
  #' @usage x = outcome variable of interest
  #' predictor = covariate of interest
  #' theta = postulated hazard ratio for the covariate of interest
}
docstring(samplesize_function)

# change input
predictor <- cohort$AUC_Clo
theta <- 4.8 

# calculate sample size for each outcome variable
sample_sizes <- lapply(colnames(cohort)[3:10], samplesize_function)
# in case of NaN: cor() is negative. Can be solved by sqrt(x+0i).

### Power Calculation ###

# create function for power calculation
power_function <- function(x) {
  power <- powerEpiCont.default(
    n = n,
    theta = theta,
    sigma2 = var(predictor),
    psi = mean(cohort[[x]] == 1),
    rho2 = sqrt(cor(predictor, cohort[[x]])),
    alpha = 0.05
  )
  print(c(x, power))
  #' paste the outcome variable and its corresponding power
  #' 
  #' @usage x = outcome variable of interest
  #' predictor = covariate of interest
  #' theta = hazard ratio for the covariate of interest
  #' n = number of subjects included
}
docstring(power_function)

# change input
predictor <- cohort$AUC_Clo 
n <- 103 
theta <- 2.0 

# calculate power for each outcome variable
power_calculation <- lapply(colnames(cohort)[3:10], power_function)
# in case of NaN: cor() is negative. Can be solved by sqrt(x+0i).
