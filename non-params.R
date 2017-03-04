#Exploring Weibull distributions of different scale

#Setting up shape and scale params
shape <- 3
scale1 <- 2
scale2<-scale1*1.5

#Setting up datasets
x<-rweibull(1000000,shape,scale1)
xprime<-rweibull(1000000,shape,scale2)


library(nortest)
paste("Normality test p-values: Sample 'x' ",ad.test(x)$p.value, " Sample 'xprime': ", ad.test(xprime)$p.value)

#Histograms of x and xprime
hist(x, breaks = length(x)/10, border = rgb(0.9,0.2,0.2,0.2), col = rgb(0.9,0.2,0.2,0.2), main = paste("Weibull Distribution different scale parameters: ",scale1,", ", scale2))
hist(xprime, breaks = length(xprime)/10, border = rgb(0.2,0.9,0.2,0.05), col = rgb(0.2,0.2,0.9,0.2), add = T)
abline (v = median(x), col = "blue")
abline (v = median(xprime), col = "red")

#Wilcoxon test for x and xprime
wilcox.test(x,xprime, conf.level = 0.95)
paste("Median 1: ", median(x),"Median 2: ", median(xprime))