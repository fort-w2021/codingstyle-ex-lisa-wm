context("tinder game strong")

# OBJECTS ----------------------------------------------------------------------

# Set up all relevant combinations of inputs the functions needs to be able to
# handle

likes <- list(
  c("penguins", "FORTRAN",  "casual sex"),
  c("dogs", "yoga", "Markus Söder")
)

test_swipers <- expand.grid(
  sober = c(TRUE, FALSE),
  likes_s = likes
)

test_profiles <- expand.grid(
  has_picture = c(TRUE, FALSE),
  picture_attractive = c(TRUE, FALSE),
  rather_weird = c(TRUE, FALSE),
  likes_p = likes
)

scenarios <- merge(test_swipers, test_profiles, by = NULL) %>% 
  mutate(swipe_r = FALSE)

# swipe_r would now have to be filled w/ desired outcomes, but how so w/o
# performing the exact same steps as the swipe_right function would?

# TESTS ------------------------------------------------------------------------

test_that("tinder can finally be automated", {
  
  for (i in seq_len(nrow(scenarios))) {
    
    swiper <- list(
      sober = scenarios[i, "sober"],
      likes = unlist(scenarios[i, "likes_s"])
    )
    profile <- list(
      has_picture = scenarios[i, "has_picture"],
      picture_attractive = scenarios[i, "picture_attractive"],
      rather_weird = scenarios[i, "rather_weird"],
      likes = unlist(scenarios[i, "likes_p"])
    )
    
    result <- scenarios[i, "swipe_right"]
    
    expect_equal(swipe_right(swiper, profile), result)
    
  }
  
})

