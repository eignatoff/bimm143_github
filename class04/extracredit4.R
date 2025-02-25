source("http://thegrantlab.org/misc/cdc.R")
tail(cdc$weight,20)

library(ggplot2)
plot(x = cdc$height, y= cdc$weight)
cor(cdc$height, cdc$weight)

#convert pounds to kg
weight_kg <- cdc$weight * 0.454

# Create height.m
height_m <- cdc$height * 0.0254

bmi <- (weight_kg/height_m^2)
plot (x=cdc$height,y = bmi)
cor(cdc$height,bmi)

sum(bmi >= 30)

height100 <- cdc[1:100, "height"]
weight100 <- cdc[1:100, "weight"]
plot(x=height100, y=weight100)

cdc$bmi <- bmi 
subsampled_by_bmi <- cdc[cdc$bmi >= 30, ]
table(subsampled_by_bmi$gender)