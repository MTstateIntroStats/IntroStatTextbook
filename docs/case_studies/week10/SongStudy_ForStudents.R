library(tidyverse)
SongData %>%
  ggplot(aes(x = Year, y = Duration))+
  geom_boxplot()+
  labs(title="Difference In Song Duration by Year", y="Duration", x="Year")

t.test(Duration ~ Year, data = SongData , var.equal = TRUE)