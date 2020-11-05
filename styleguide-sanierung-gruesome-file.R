### DATENSATZ BEREINIGEN UND GESAMTDATENSATZ ERSTELLEN.
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
load("attic/mengen.RData")
# Schritt 1. Mengen und Preise jeweils um nicht benoetigte Spalten ausserhalb der Zeitreihe
# reduzieren. Hierdurch 8 statt 16 Spalten.
Mengen_spaltenreduziert<-Mengen[,c(2,3,4,5,6,7,8,9,10,11,12)]
# Schritt 2. Spalten nicht benoetigter Zeitpunkte (vor 2012) aus Zeitreihe entfernen. 
Mengen_Zeitreihe<-data.frame(Mengen[,c(16)])
Mengen_Zeitreihe<-Mengen_Zeitreihe[,-c(1:48)]
# Schritt 3. Dritte Zeitreihe Importvolumen als Menge in Tonnen erstellen.
Importvolumen_Zeitreihe<-Mengen_Zeitreihe*1000
# Schritt 4. Alle drei Zeitreihen wieder in Form eines Dataframe an die Identifier-
# Spalten anbinden und so einen Gesamtdatensatz erstellen. Datensatz enthaelt damit
# 11 Spalten, wobei die letzten 3 Dataframes mit je 65 Variablen sind.
Mengen_spaltenreduziert$Menge<-Mengen_Zeitreihe
Mengen_spaltenreduziert$Volumen<-Importvolumen_Zeitreihe
Gesamtdatensatz<-Mengen_spaltenreduziert
# Schritt 5. Gesamtdatensatz um Nullzeilen bereinigen. Dadurch 59.183 statt 60.784 Beobachtungen.
Gesamtdatensatz<-Gesamtdatensatz[(Gesamtdatensatz$Produkt!="NULL"),]

### AUS GESAMTDATENSATZ TEILDATENSAETZE ERSTELLEN.
Lebende_Tiere<-Gesamtdatensatz[grep("WA01",Gesamtdatensatz$Produktnummer),]
Fleisch_Schlachterzeugnisse<-Gesamtdatensatz[grep("WA02",Gesamtdatensatz$Produktnummer),]
Fische_Krebstiere<-Gesamtdatensatz[grep("WA03",Gesamtdatensatz$Produktnummer),]
Milch_Eier_Honig<-Gesamtdatensatz[grep("WA04",Gesamtdatensatz$Produktnummer),]
Sonstige_Tierische_Erzeugnisse<-Gesamtdatensatz[grep("WA05",Gesamtdatensatz$Produktnummer),]
Gemuese_Pflanzen_Wurzeln<-Gesamtdatensatz[grep("WA07",Gesamtdatensatz$Produktnummer),]
Fruechte_Nuesse<-Gesamtdatensatz[grep("WA08",Gesamtdatensatz$Produktnummer),]
Kaffe_Tee_Gewuerze<-Gesamtdatensatz[grep("WA09",Gesamtdatensatz$Produktnummer),]
Getreide<-Gesamtdatensatz[grep("WA10",Gesamtdatensatz$Produktnummer),]
Muellereierzeugnisse<-Gesamtdatensatz[grep("WA11",Gesamtdatensatz$Produktnummer),]
Oele_Samen<-Gesamtdatensatz[grep("WA12",Gesamtdatensatz$Produktnummer),]
Schellack_Gummen_Harze<-Gesamtdatensatz[grep("WA13",Gesamtdatensatz$Produktnummer),]
Fette<-Gesamtdatensatz[grep("WA15",Gesamtdatensatz$Produktnummer),]
Fisch_Fleisch_Zub<-Gesamtdatensatz[grep("WA16",Gesamtdatensatz$Produktnummer),]
Zucker<-Gesamtdatensatz[grep("WA17",Gesamtdatensatz$Produktnummer),]
Kakao<-Gesamtdatensatz[grep("WA18",Gesamtdatensatz$Produktnummer),]
Milcherzeugnisse_Zub<-Gesamtdatensatz[grep("WA19",Gesamtdatensatz$Produktnummer),]
Gemuese_Fruechte_Nuesse_Zub<-Gesamtdatensatz[grep("WA20",Gesamtdatensatz$Produktnummer),]
Kaffee_Tee_Zub<-Gesamtdatensatz[grep("WA21",Gesamtdatensatz$Produktnummer),]
Getraenke_Alkohol<-Gesamtdatensatz[grep("WA22",Gesamtdatensatz$Produktnummer),]
Rueckst?nde_Abfaelle<-Gesamtdatensatz[grep("WA23",Gesamtdatensatz$Produktnummer),]