gm <- read.csv("gasmileage.csv")
gm <- as.data.frame(gm)
names(gm)<-c("Car #", "Eng. Disp (l)", "Gas Mlg. (km / l)")


#Visualizing the data to observe any correlation graphically
plot(gm$`Eng. Disp (l)`,gm$`Gas Mlg. (km / l)`, main = "Fuel eff. vs. Eng. Displ.", col = "maroon", xlab = "Eng. Disp (l)", ylab = "Gas. Mlg (km/l)")

#Constructing a simple linear model 
fit <- lm(gm$`Gas Mlg. (km / l)` ~ gm$`Eng. Disp (l)`)

#Plotting a fit line
abline(fit, col = "red")

#Constructing a polynomial model of the relationship between factor and response
fit <- lm( gm$`Gas Mlg. (km / l)` ~ poly(gm$`Eng. Disp (l)`, 2, raw = TRUE)) 

#Plotting the nonlinear model in ordered pairs along
lines(sort(gm$`Eng. Disp (l)`),fitted(fit)[order(gm$`Eng. Disp (l)`)], type = "l", col = "blue")