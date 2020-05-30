

set.seed(27282)
local({
  .x <- seq(0.037, 26.857, length.out=1000)  
  plotDistr(.x, dlnorm(.x, meanlog=0, sdlog=1), cdf=FALSE, xlab="x", ylab="Density", 
  main=paste("Lognormal Distribution:  Mean (log scale)=0, Standard deviation (log scale)=1"))
})
data <- read.csv("/home/python/Downloads/usedcars.csv")
View(data)

Dataset <- read.table("/home/python/Downloads/usedcars.csv", header=TRUE, sep=",", 
  na.strings="NA", dec=".", strip.white=TRUE)



library(lattice, pos=16)
xyplot(mileage ~ price | transmission, groups=model, type="p", pch=16, 
  auto.key=list(border=TRUE), par.settings=simpleTheme(pch=16), 
  scales=list(x=list(relation='same'), y=list(relation='same')), data=Dataset)
with(Dataset, Hist(year, scale="frequency", breaks="Sturges", col="darkgray"))
library(ggplot2, pos=17)
RegModel.1 <- lm(price~mileage+year, data=Dataset)
summary(RegModel.1)
Anova(RegModel.1, type="II")


oldpar <- par(oma=c(0,0,3,0), mfrow=c(2,2))
plot(RegModel.1)
par(oldpar)


library(zoo, pos=18)
library(lmtest, pos=18)
bptest(price ~ mileage + year, varformula = ~ fitted.values(RegModel.1), 
  studentize=FALSE, data=Dataset)


influencePlot(RegModel.1, id=list(method="noteworthy", n=2))
plot(predictorEffects(RegModel.1))
with(Dataset, plotMeans(price, color, error.bars="se", connect=TRUE))

