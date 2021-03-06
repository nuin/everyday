library(ggplot2)

pdf("ch04_ex5_3.pdf")

data <- read.table("simulation4-4.csv", header=TRUE, sep=",")
df <- data.frame(table(data$X400))
colnames(df) <- c("queue_size", "frequency")
percent_labels <- paste(df$frequency, '(', round(df$frequency*100/540, 2), '%)')

ggplot(data=df) + opts(legend.position = "none") + 
  geom_bar(aes(x = queue_size, y = frequency, fill = factor(queue_size))) +
  geom_text(aes(x = queue_size, y = frequency, label = percent_labels, size=1)) +
  scale_y_continuous("frequency") +
  scale_x_discrete("queue size")

print(df)