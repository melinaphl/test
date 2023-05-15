library(tidyverse)
library(tibble)
library(dyplr)
umsatz <- read.csv("https://raw.githubusercontent.com/opencampus-sh/einfuehrung-in-data-science-und-ml/main/umsatzdaten_gekuerzt.csv")
kiwo <- read.csv("https://raw.githubusercontent.com/opencampus-sh/einfuehrung-in-data-science-und-ml/main/kiwo.csv")

kiwo$Datum <- as.Date(levels(kiwo$Datum)[as.integer(kiwo$Datum)])
umsatz$Datum <- as.Date(levels(umsatz$Datum)[as.integer(umsatz$Datum)])
#zusammenführung datensätze nur mit übereinstimmenden Datum
merged_df <- merge(kiwo, umsatz, by = c("Datum"))
#zusammenführung fehlende Werte mit NA ersetzt
merged2_df <- merge(kiwo, umsatz, by = "Datum", all = TRUE)

#dyplr
innerdf <- inner_join(kiwo, umsatz)
#alle umsatzdaten bleiben erhalten spalte kiwo wird extra hinzugefügt 
leftdf <- left_join(umsatz,kiwo)

umsatz_kiwo <-leftdf
write.csv(umsatz_kiwo, "data.csv", row.names = FALSE)
