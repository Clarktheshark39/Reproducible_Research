## Download the data:
URL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(URL, "~/Desktop/Coursera/GitHub/ReproducibleResearchProject2/StormData.csv.bz2")
storm <- read.csv(bzfile("StormData.csv.bz2"), header = TRUE)

## Questions
# Across the United States, which types of events (as indicated in the 𝙴𝚅𝚃𝚈𝙿𝙴 variable) are
# most harmful with respect to population health?