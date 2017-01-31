## Practice plotting project Reproducible Research.
setwd("C:/Users/cporter01/Downloads")
payments <- read.csv("_e143dff6e844c7af8da2a4e71d7c054d_payments.csv")

## Use base plotting to plot: What is the relationship between mean covered charges (Average.Covered.Charges) and mean total 
## payments (Average.Total.Payments) in New York?

png('pracRRplot1.png')
plot(payments$Average.Covered.Charges, payments$Average.Total.Payments, xlab = "Average Covered Charges", 
     ylab = "Average Total Payments", col = adjustcolor(col = "dodgerblue", alpha.f = 1/5), pch = 19)
title(main = "Covered Charges vs Total Payments (New York)")
abline(lm(payments$Average.Total.Payments ~ payments$Average.Covered.Charges), col = "red", lwd = 2)
dev.off()

## Use base plotting to plot: How does the relationship between mean covered charges (Average.Covered.Charges) and mean total 
## payments (Average.Total.Payments) vary by medical condition (DRG.Definition) and the state in which care was received 
## (Provider.State)?

## Using ggplot2...not supposed to use that :\

table(payments$DRG.Definition)
## 194 - SIMPLE PNEUMONIA & PLEURISY W CC 
## 292 - HEART FAILURE & SHOCK W CC 
## 392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC 
## 641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC 
## 690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC 
## 871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC 

payments$DRG.Definition1 <- factor(payments$DRG.Definition, labels = c("Pneumonia", "Heart Fail.", "Gastroent", "Disorders", 
                                                                       "Infections", "Sepsis"))

ggplot(payments, aes(x = Average.Total.Payments, y = Average.Covered.Charges)) +
  geom_point(color = "dodgerblue", alpha = 1/5) +
  facet_grid(payments$DRG.Definition1 ~ payments$Provider.State) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

## Base plotting attempt. Could do it with multiple plots...it would just take 36 calls to the plot function...

DRG.194 <- subset(payments, DRG.Definition == "194 - SIMPLE PNEUMONIA & PLEURISY W CC")
DRG.392 <- subset(payments, DRG.Definition == "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MC")
DRG.641 <- subset(payments, DRG.Definition == "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC")
DRG.292 <- subset(payments, DRG.Definition == "292 - HEART FAILURE & SHOCK W CC")
DRG.690 <- subset(payments, DRG.Definition == "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC")
DRG.871 <- subset(payments, DRG.Definition == "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC")


png('pracRRplot2.png')
par(mfrow = c(6, 6))
plot(payments$Average.Covered.Charges, payments$Average.Total.Payments, xlab = "Average Covered Charges", 
     ylab = "Average Total Payments", col = adjustcolor(col = "dodgerblue", alpha.f = 1/5), pch = 19)
title(main = "Covered Charges vs Total Payments (New York)")
dev.off()


