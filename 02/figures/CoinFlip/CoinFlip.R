num <- 0
props <- NULL
n <- 1000

for(i in 1:n){
	flip <- sample(0:1, 1)
	if(flip == 1){
		# If heads
		num <- num+1
	} 
	props[i] <- num/i
}

plot(1:n, props, type="l", ylim=c(0,1), xlab="Number of tosses", ylab="Long-run proportion of heads", main="Coin Flip Simulation")
abline(h=0.5, lty=3, col="red")