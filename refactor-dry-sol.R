# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# WEEK 1 EX REFACTOR-DRY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# PREREQUISITES ----------------------------------------------------------------

# Working directory

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Packages

library(tidyverse)

# UTILITY FUNCTIONS ------------------------------------------------------------

# Function to compute 95% confidence interval based on normal distribution
# Quantile/significance level could be added as an argument

compute_confint <- function(x) {
  
  # Perform at least basic input checks
  # NA case could be handled less lazily, obviously
  
  if(!is.numeric(x)) {
    warning("x must be numeric")
    return(NA)
  }
  
  if(sum(is.na(x) > 0)) {
    warning("x contains missing values")
    return(NA)
  }
  
  mean_x <- mean(x)
  sd_x <- sd(x)
  n_x <- length(x)
  half_width_x <- 1.96 * sd_x / sqrt(n_x)

  c(mean_x - half_width_x, mean_x + half_width_x)
  
}

# COMPUTATIONS -----------------------------------------------------------------

x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
v <- z^2
my_random_variables <- list(x, y, z, v)

lapply(my_random_variables, compute_confint)
