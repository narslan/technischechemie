assign("x", c(0,1,2,4))
assign("y", c(0.0122, 0.1284, 0.23679, 0.38613))
fitxy<-lm(y ~ x)
summary(fitxy)
 t.test(x,y,alternative = c("two.sided", "less", "greater"), conf.level = 0.95)