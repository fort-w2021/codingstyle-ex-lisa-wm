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

source(here("test-conditional-complex-swipe-sol.R"))

