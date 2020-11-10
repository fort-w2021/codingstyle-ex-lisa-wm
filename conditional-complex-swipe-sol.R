# PREREQUISITES ----------------------------------------------------------------

library(here)
library(tidyverse)
library(testthat)

# SWIPE FUNCTION ---------------------------------------------------------------

#' Decide whether to swipe right (express interest) or left (express 
#' disinterest)on somebody's profile.
#'
#' @param swiper List object representing somebody swiping left or right in a 
#' dating app
#' @param profile List object representing the profile of the person who is 
#' being swiped left or right
#' @return TRUE/FALSE

swipe_right <- function(swiper, profile) {
  
  if(!profile[["has_picture"]]) {
    stop("can't decide without a picture.")
  }
  
  if(!profile[["picture_attractive"]]) {
    return(FALSE)
  }
  
  if(!swiper[["sober"]]) {
    return(TRUE)
  }
  
  if(profile[["rather_weird"]]) {
    return(FALSE)
  }
  
  if(all(is.na(profile[["likes"]]))) {
    stop("can't decide without informative profile.")
  }

  if (any(swiper[["likes"]] %in% profile[["likes"]])) {
    return(TRUE)
  }
  
  FALSE
  
}

# TESTS ------------------------------------------------------------------------

# Not working (see test file): how can I test for all possible combinations
# w/o essentially applying the function itself first?
# Somewhat circular conclusion here...

source(here("test-conditional-complex-swipe-sol.R"))

# Primitive tests

test_swipers <- list(
  sober_swiper = list(
    sober = TRUE, 
    likes = c("penguins", "FORTRAN",  "casual sex")),
  drunk_swiper = list(
    sober = FALSE, 
    likes = c("dogs", "yoga", "Markus Söder")))

test_profiles <- list(
  hot_1 = list(
    has_picture = TRUE, 
    picture_attractive = TRUE,
    rather_weird = FALSE, 
    likes = "penguins"),
  hot_2 = list(
    has_picture = TRUE, 
    picture_attractive = TRUE,
    rather_weird = FALSE, 
    likes = "Pokemon"),
  hotweird = list(
    has_picture = TRUE, 
    picture_attractive = TRUE,
    rather_weird = TRUE, 
    likes = "penguins"),
  nothot_1 = list(
    has_picture = TRUE, 
    picture_attractive = FALSE,
    rather_weird = FALSE, 
    likes = "Markus Söder"),
  nothot_2 = list(
    has_picture = TRUE, 
    picture_attractive = FALSE,
    rather_weird = FALSE, 
    likes = "cats"),
  no_pic = list(
    has_picture = FALSE, 
    picture_attractive = NA,
    likes = c("hamsters", "yoga"))
)


for(swiper in names(test_swipers)) {
  
  for(profile in names(test_profiles)) {
    
    cat("Does", swiper, "swipe right on", profile, "?",
        try(swipe_right(
          test_swipers[[swiper]],
          test_profiles[[profile]]), 
          silent = TRUE),
        "\n")
  }
}