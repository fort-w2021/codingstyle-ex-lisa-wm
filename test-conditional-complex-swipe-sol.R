context("tinder game strong")

# OBJECTS ----------------------------------------------------------------------

# Set up all relevant combinations of inputs the functions needs to be able to
# handle

# But bit of a circular conclusion - putting in the desired output is just
# equivalent to applying the function itself.........

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
  mutate(swipe_right = FALSE)

scenarios <- scenarios %>% 
  mutate(swipe_right = ifelse(
    
  ))

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

