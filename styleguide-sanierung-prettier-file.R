# PREREQUISITES ----------------------------------------------------------------

library(tidyverse)
library(here)

load(here("attic", "mengen.RData"))

# DATA PRE-PROCESSING ----------------------------------------------------------

# Remove irrelevant columns as well as time series before 2012 (time series is 
# data frame within "mengen" data frame); compute import volume in tonnes

names(mengen) <- tolower(names(mengen))

mengen_attr <- mengen %>% 
  select(-c(starts_with("prioindex_"), "mengen"))

mengen_ts <- mengen$mengen %>% 
  select(-starts_with(c("2008", "2009", "2010", "2011")))

mengen_small <- mengen_attr %>% 
  mutate(
    mengen = mengen_ts,
    import_volume = mengen * 1000
    )

# Remove observations where product is "NULL"

mengen_small <- mengen_small %>% 
  filter(produkt != "NULL")

# Why the heck would we create all these subsets, just filter where needed

mengen_small %>% 
  filter(substr(produktnummer, 1, 4) == "WA01")

# ...

