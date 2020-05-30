library(ggplot2)
library(dplyr)

usedcars <- read.csv("/home/python/Downloads/usedcars.csv", stringsAsFactors = FALSE)


View(usedcars)
summary(usedcars)

g <- ggplot(data = usedcars,
aes(year, price))

g + geom_line() + facet_wrap(~usedcars$model, ncol = 1) +
xlab('') + ylab('')


x <- usedcars %>%
group_by(color) %>%
count() %>%
arrange(desc(color))
x

g <- ggplot(x, aes(color, n))
g + geom_col()
