assign("x", c(0, 0.5, 1, 2, 3))
assign("y", c( 0.0534,0.0827, 0.1350, 0.1808,0.1793))

assign("z",c(0.0495,0.0825,0.1325,0.1814,0.1810))



fitxy<-lm(z ~ x)
summary(fitxy)
 # t.test(x,y,alternative = c("two.sided", "less", "greater"), conf.level = 0.95)