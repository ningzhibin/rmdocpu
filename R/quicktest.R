library(ggplot2)


df <- data.frame(class = rnorm(100), drv = as.character(rnorm(100)))


g <- ggplot(df, aes(class))
# Number of cars in each class:
g + geom_bar(aes(fill = drv))


