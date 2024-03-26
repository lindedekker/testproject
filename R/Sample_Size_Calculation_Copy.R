# load required package
library(powerSurvEpi)

# functions for power- and sample size calculation for non-binary covariates.
powerEpiCont.default()
ssizeEpiCont.default()

# load database
setwd("C:/Users/ldekke11/OneDrive - Prinses Maxima Centrum/PhD Project/Courses/Writing_Reproducible_Code/testproject/data/raw")
cohort <- read.csv("cohort_for_course_WritingReproducibleCode.csv", header = TRUE)

### Power Calculation ###

# create function for power calculation
power_function <- function(x) {
  power <- powerEpiCont.default(
    n = n,
    theta = thetha,
    sigma2 = sigma2,
    psi = psi,
    rho2 = rho2,
    alpha = 0.05
  )
  print(c(x, power))
}

# change input
n <- 103
theta <- 2.0 # numeric postulated hazard ratio
sigma2 <- var() # numeric variance of the covariate of interest
psi <- # numeric proportion of subjects died of the disease of interest
  rho2 <-
  ### Sample Size Calculation###

  # create function for sample size calculation for continuous predictor
  samplesize_function <- function(x) {
    sample_size <- ssizeEpiCont.default(
      power = 0.806, # postulated power
      theta = theta,
      sigma2 = sigma2,
      psi = mean(cohort[[x]] == 1), # proportion of subjects with an event
      rho2 = sqrt(cor(predictor, cohort[[x]])),
      alpha = 0.05 # type I error rate
    )
    print(c(x, sample_size$n))
  }

# change input
predictor <- cohort$AUC_Clo
theta <- 4.8 # Hazard ratio (HR) for the continuous predictor
sigma2 <- var(predictor) # variance of the covariate of interest

sample_sizes <- lapply(colnames(cohort)[3:11], samplesize_function) 


### Sample Size Calculation ###

alpha <- 0.05 # Significance level
power <- 0.806 # Desired power
theta <- 4.8 # Hazard ratio (HR) for the continuous predictor

# Sample size for continuous covariate FluAUC
var.X1 <- "FluAUCtotal"
sample_sizes <- lapply(colnames(cohort)[3:10], function(x) {
  sample_size <- ssizeEpiCont(
    formula = cohort$FluAUCtotal ~ cohort[[x]],
    dat = cohort,
    var.X1,
    var.failureFlag = x,
    power,
    theta,
    alpha = alpha
  )
  print(c(x, sample_size$n))
})


# Sample size for continuous covariate CloAUC
var.X1 <- "AUC_Clo"
sample_sizes <- lapply(colnames(cohort)[3:10], function(x) {
  sample_size <- ssizeEpiCont(
    formula = cohort$AUC_Clo ~ cohort[[x]],
    dat = cohort,
    var.X1,
    var.failureFlag = x,
    power,
    theta,
    alpha = alpha
  )
  print(c(x, sample_size$n))
})
