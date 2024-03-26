# Install and load required packages
#install.packages("powerSurvEpi")
library(powerSurvEpi) #https://cran.r-project.org/web/packages/powerSurvEpi/powerSurvEpi.pdf

#load outcome database 
setwd("C:/Users/ldekke11/OneDrive - Prinses Maxima Centrum/PhD Project/Clofarabine last analysis/Analysis 2022/Databases/Other")
cohort <-read.csv("cohort_for_course_WritingReproducibleCode.csv", header = TRUE)

#functions for power calculation and sample size calculation for non-binary covariates. QUESTION: WHEN TO USE "normal" AND WHEN "default" ???
powerEpiCont()
powerEpiCont.default()
ssizeEpiCont()
ssizeEpiCont.default()

###Power Calculations###
#HR THAT COMES OUT OF SURVIVAL ANALYSES RESULTS IN VERY LOW POWER ???
powerEpiCont(formula = cohort$AUC_Clo ~ cohort$OS, 
             dat = cohort, 
             var.X1 = "AUC_Clo", 
             var.failureFlag = "OS", 
             n = 103, 
             theta = 1.3163, 
             alpha = 0.05)

powerEpiCont(formula = cohort$FluAUCtotal ~ cohort$OS, 
             dat = cohort, 
             var.X1 = "FluAUCtotal", 
             var.failureFlag = "EFS_correct", 
             n = 103, 
             theta = 1.05974, 
             alpha = 0.05)

###Sample Size Calculation###

alpha <- 0.05  # Significance level
power <- 0.806  # Desired power
theta <- 4.8 # Hazard ratio (HR) for the continuous predictor --> HOW TO DETERMINE THIS? SAMPLE SIZE NEEDED HIGHLY DEPENDS ON THIS

#Sample size for continuous covariate FluAUC ---> DO I USE THE CORRECT var.failureFlag?
var.X1 <- "FluAUCtotal"
sample_sizes <- lapply(colnames(cohort)[3:10], function(x) {
  sample_size <- ssizeEpiCont(formula = cohort$FluAUCtotal ~ cohort[[x]],
               dat = cohort,
               var.X1,
               var.failureFlag = x,
               power,
               theta,
               alpha = alpha)
  print(c(x,sample_size$n, sample_size$rho2, sample_size$sigma2, sample_size$psi))
})


#Sample size for continuous covariate CloAUC ---> DO I USE THE CORRECT var.failureFlag?
var.X1 <- "AUC_Clo"
sample_sizes <- lapply(colnames(cohort)[3:10], function(x) {
  sample_size <- ssizeEpiCont(formula = cohort$AUC_Clo ~ cohort[[x]],
                              dat = cohort,
                              var.X1,
                              var.failureFlag = x,
                              power,
                              theta,
                              alpha = alpha)
  print(c(x,sample_size$n, sample_size$rho2, sample_size$sigma2, sample_size$psi))
})

#n = the total number of subjects required.
#rho2 = square of the correlation between X1 and X2. --> WHAT IS THIS CORRELATION? BETWEEN CONTINUOUS AND BINARY COVARIATE ??? 
#sigma2 = variance of the covariate of interest.
#psi = proportion of subjects died of the disease of interest.
