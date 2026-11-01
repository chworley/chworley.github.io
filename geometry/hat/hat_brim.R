pdf("brim.pdf",8.5,11)

par(mar=c(0,0,0,0))
plot(0,0,"n",xlim=c(-4.25,4.25),c(-5.5,5.5),axes = FALSE, 
     xlab = "", 
     ylab = "", 
     frame.plot = FALSE,
     xaxs = "i", # "i" style cuts off internal padding on axes
     yaxs = "i")

# abline(h=-3)
abline(v=-3)

# for(rr in seq(3,7.125,1/8)){
#   th = seq(0,2*pi,pi/1000)
#   x1 = c(rr*cos(th))
#   y1 = c(rr*5/4*sin(th))
#   lines(x1-3.5,y1-4.5,lwd=0.8,col="grey",lty=2)
#   
#   th = seq(0,pi/2,pi/1000)
#   x1 = c(rr*cos(th))
#   y1 = c(rr*5/4*sin(th))
#   lines(x1-3.5,y1-4.5,lwd=1,col="grey")
# }


r1 = 3+5/16
r2 = r1/4*5

r3 = r1+2
r4 = r2+2

th = seq(0,2*pi,pi/1000)
x1 = c(r1*cos(th),rev(r3*cos(th)))
y1 = c(r2*sin(th),rev(r4*sin(th)))
polygon(y1-3,x1,lwd=0.8,border="grey",lty=2)

th = seq(0,pi,pi/1000)
x1 = c(r1*cos(th),rev(r3*cos(th)))
y1 = c(r2*sin(th),rev(r4*sin(th)))
polygon(y1-3,x1,lwd=1,border="black",lty=1)



dev.off()


