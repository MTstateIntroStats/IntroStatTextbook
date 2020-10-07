drawnormal = function(m=0, s=1, xlabel="Z", maintitle="",shade=FALSE,dir="lower",x=0,
                      six.sigma=TRUE,lwd=1,cex.axis=1.8,cex.main=2,cex.lab=2,
                      col="blue", from = m-3*s, to = m+3*s,...){
  # Function to draw normal curve and shade in probability.
  # m = mean
  # s = standard deviation
  # xlabel = label for x-axis
  # maintitle = main title for plot
  # shade = TRUE --> shade in a probability; FALSE --> do not shade
  # dir = "lower", "upper", "between", or "tails"; used if shade=TRUE
  # x = value for desired probability (1 number if dir = "lower or "upper";
  #	vector of two numbers in numerical order if dir = "between" or "tails")
  # six.sigma = logical to determine if tick marks should be at 1, 2, and 3 SD
  if(six.sigma==TRUE){
    curve(dnorm(x,m,s),from,to,xlab=xlabel,
          ylab="",main=maintitle,yaxt="n",
          cex.axis=cex.axis,lwd=lwd,cex.main=cex.main,cex.lab=cex.lab,
          xaxp=round(c(m-3*s,m+3*s,6),2), bty = "n")
  }
  if(six.sigma==FALSE){
    curve(dnorm(x,m,s),from,to,xlab=xlabel,
          ylab="",main=maintitle,yaxt="n",
          cex.axis=cex.axis,lwd=lwd,cex.main=cex.main,cex.lab=cex.lab,
          bty = "n")
  }
  if(shade==TRUE){
    if(dir=="lower"){
      xvals=seq(m-4*s,x,length=50)
      dvals=dnorm(xvals,m,s)
      polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col=col)
    }
    if(dir=="upper"){
      xvals=seq(x,m+4*s,length=50)
      dvals=dnorm(xvals,m,s)
      polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col=col)
    }
    if(dir=="between"){
      xvals=seq(x[1],x[2],length=50)
      dvals=dnorm(xvals,m,s)
      polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col=col)
    }
    if(dir=="tails"){
      xvals=seq(m-4*s,x[1],length=50)
      dvals=dnorm(xvals,m,s)
      polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col=col)
      xvals=seq(x[2],m+4*s,length=50)
      dvals=dnorm(xvals,m,s)
      polygon(c(xvals,rev(xvals)),c(rep(0,50),rev(dvals)),col=col)
    }
  }
}


drawnormal(21, 5, xlabel="ACT Score", shade = TRUE, x = 27, dir = "lower")
drawnormal(0, 1, xlabel="Z Score", shade = TRUE, x = 1.2, dir = "lower")
