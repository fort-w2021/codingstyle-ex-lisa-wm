# PREREQUISITES ----------------------------------------------------------------

library(here)

load(here("attic", "mengen.RData"))

# DATA PRE-PROCESSING ----------------------------------------------------------

names(mengen) <- tolower(names(mengen))

# Step 1: remove irrelevant columns

mengen_small <- mengen[, c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)]

# Step 2: remove time series before 2012

mengen_ts <- data.frame(mengen[, c(16)])
mengen_ts <- mengen_ts[, -c(1:48)]

# Step 3: create additional time series with import volume in tonnes

import_ts <- mengen_ts * 1000

# Step 4: re-attach time series to data frame and create total data set

mengen_small$menge <- mengen_ts
mengen_small$volume <- import_ts
mengen_total <- mengen_small

# Step 5: remove observations with "NULL" product

mengen_total <- mengen_total[(mengen_total$produkt != "NULL"), ]

# CREATE DATA SUBSETS ----------------------------------------------------------

lebende_tiere <- 
  mengen_total[grep("WA01", mengen_total$produktnummer), ]
fleisch_schlachterzeugnisse <- 
  mengen_total[grep("WA02", mengen_total$produktnummer), ]
fische_krebstiere <- 
  mengen_total[grep("WA03", mengen_total$produktnummer), ]
milch_eier_honig <- 
  mengen_total[grep("WA04", mengen_total$produktnummer), ]
sonstige_tierische_erzeugnisse <- 
  mengen_total[grep("WA05", mengen_total$produktnummer), ]
gemuese_pflanzen_wurzeln <- 
  mengen_total[grep("WA07", mengen_total$produktnummer), ]
fruechte_nuesse <- 
  mengen_total[grep("WA08", mengen_total$produktnummer), ]
kaffe_tee_gewuerze <- 
  mengen_total[grep("WA09", mengen_total$produktnummer), ]
getreide <- 
  mengen_total[grep("WA10", mengen_total$produktnummer), ]
muellereierzeugnisse <- 
  mengen_total[grep("WA11", mengen_total$produktnummer), ]
oele_samen <- 
  mengen_total[grep("WA12", mengen_total$produktnummer), ]
schellack_gummen_harze <- 
  mengen_total[grep("WA13", mengen_total$produktnummer), ]
fette <- 
  mengen_total[grep("WA15", mengen_total$produktnummer), ]
fisch_fleisch_zub <- 
  mengen_total[grep("WA16", mengen_total$produktnummer), ]
zucker <- 
  mengen_total[grep("WA17", mengen_total$produktnummer), ]
kakao <- 
  mengen_total[grep("WA18", mengen_total$produktnummer), ]
milcherzeugnisse_zub <- 
  mengen_total[grep("WA19", mengen_total$produktnummer), ]
gemuese_fruechte_nuesse_zub <- 
  mengen_total[grep("WA20", mengen_total$produktnummer), ]
kaffee_tee_zub <- 
  mengen_total[grep("WA21", mengen_total$produktnummer), ]
getraenke_alkohol <- 
  mengen_total[grep("WA22", mengen_total$produktnummer), ]
rueckstaende_abfaelle <- 
  mengen_total[grep("WA23", mengen_total$produktnummer), ]