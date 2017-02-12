x1 <- rnorm(10^4, 10, 1)
x2 <- rnorm(10^4, 10.5, 1)
df = cbind.data.frame(x1, x2)
write.csv(df, "x1x2.csv")
