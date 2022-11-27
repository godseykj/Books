library(ggplot2)
library(dplyr)

books <- read.csv("Books2022.csv")
books$num <- seq(1:length(books$Title))

#11/17/22
plot1 <- ggplot(books, aes(x = num, y = Words, fill = Genre)) +
  geom_bar(stat="identity") +
  geom_text(aes(label = Title, size = Words), color = "black", position = position_stack(vjust = 0.5), angle = 90) +
  scale_radius(range = c(3.5, 9)) +
  labs(x = "") +
  theme_classic()
plot1
#ggsave(filename = "plot1.png", plot = plot1, width = 2560, height = 1440, units= "px", dpi = "screen")

#11/26/22
data2 <- books %>% 
  arrange(desc(Words)) %>% 
  filter(Genre == "Fiction") %>% 
  mutate(num = seq(1:nrow(books %>% filter(Genre == "Fiction"))), start = Words, end = -Words)

plot2 <- ggplot(data2, aes(y = num)) +
  geom_segment(aes(x = end, xend = start, y = num +0.45, yend = num +0.45)) +
  geom_segment(aes(x = end, xend = start, y = num - 0.45, yend = num - 0.45)) +
  geom_segment(aes(x = end, xend = end, y = num +0.45, yend = num - 0.45)) +
  geom_segment(aes(x = start, xend = start, y = num + 0.45, yend = num - 0.45)) +
  geom_text(aes(x = (end+start)/2, label = Title), size = 6, color = "black", hjust = 0.5) +
  labs(x = "", y = "", title = "Fiction Books") +
  theme_classic() +
  theme(axis.text = element_blank(), axis.line = element_blank(), legend.position = "none", plot.title = element_text(hjust = 0.5))
      
plot2  
#ggsave(filename = "plot2.png", plot = plot2, width = 2560, height = 1440, units= "px", dpi = "screen")
