library(nortest)
#Generating two samples of data
#100 points of data each
#Same standard deviation
#Different values of mean (of sampling distribution)
x<-read.csv(file = "x1x2.csv")
x1<-x[,2]
x2<-x[,3]

#Setting the global value of significance 
alpha = 0.1

#Histograms
hist(x1, col = rgb(0.1,0.5,0.1,0.25), 
     xlim = c(7,15),
     breaks = 100, 
     main = "Histogram of x1 and x2", 
     xlab = "x1, x2")

abline(v=10, col = "orange")

hist(x2, col = rgb(0.5,0.1,0.5,0.25), 
     xlim = c(7,15),breaks = 100, 
     add = T)

abline(v=12, col = "purple")

#Running normality tests (just to be sure)
ad1<-ad.test(x1)
ad2<-ad.test(x2)

#F-test to compare two or more variances
v1<-var.test(x1,x2)

if(ad1$p.value >=alpha & ad2$p.value>=alpha){
  if(v1$p.value>=alpha){
    #Running a 2-sample t-test
    for (i in c(-2,-1,0,1,2)){
      temp<-t.test(x=x1,y=x2,paired = FALSE,var.equal = TRUE,alternative = "two.sided",conf.level = 1-alpha, mu = i )
      cat("Difference= ",i,"; p-value:",temp$p.value,"\n")  
    }
    
  }
}
