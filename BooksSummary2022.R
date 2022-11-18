library(ggplot2)

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
ggsave(filename = "plot1.png", plot = plot1, width = 2560, height = 1440, units= "px", dpi = "screen")
