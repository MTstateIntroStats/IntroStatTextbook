# function to draw normal curve with area shaded ------------------------------------

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

# extra packages (add alphabetically) ------------------------------------------
suppressMessages(library(catstats))
suppressMessages(library(gapminder))
suppressMessages(library(ggraph))
suppressMessages(library(igraph))
suppressMessages(library(mosaic))
suppressMessages(library(plotly))
suppressMessages(library(RColorBrewer))

################## Update from ims repo from here down -
# _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

# packages ---------------------------------------------------------------------

suppressMessages(library(broom))
suppressMessages(library(caret)) # new
suppressMessages(library(gghighlight))
suppressMessages(library(ggmosaic))
suppressMessages(library(ggpubr))
suppressMessages(library(ggrepel)) # new
suppressMessages(library(ggridges))
suppressMessages(library(glue)) # new
suppressMessages(library(gridExtra))
suppressMessages(library(infer))
suppressMessages(library(janitor))
suppressMessages(library(kableExtra))
suppressMessages(library(knitr))
suppressMessages(library(maps))
suppressMessages(library(openintro))
suppressMessages(library(palmerpenguins)) # new
suppressMessages(library(patchwork))
suppressMessages(library(quantreg)) # new
suppressMessages(library(scales))
suppressMessages(library(skimr))
suppressMessages(library(survival)) # new
suppressMessages(library(tidymodels)) # new
suppressMessages(library(tidyverse))
suppressMessages(library(waffle)) # new

# knitr chunk options ----------------------------------------------------------

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  message = FALSE,
  warning = FALSE,
  #cache = TRUE,
  echo = FALSE, # hide code unless otherwise noted in chunk options
  out.width = "70%",
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

# kableExtra options -----------------------------------------------------------

options(kableExtra.html.bsTable = TRUE)

# dplyr options ----------------------------------------------------------------

options(dplyr.print_min = 6, dplyr.print_max = 6)

# ggplot2 theme ----------------------------------------------------------------
# to be replaced with theme_openintro...

theme_set(theme_minimal(base_size = 14))

# function to print terms ------------------------------------------------------

make_terms_table <- function(x, n_cols = 4){
  x <- sort(x) %>% unique()
  n_rows <- (length(x) / n_cols) %>% ceiling()
  desired_length <- n_rows * n_cols
  x_updated <- c(x, rep("", (desired_length - length(x))))
  matrix(x_updated, nrow = n_rows) %>%
    kable()
}

# function: caption helper -----------------------------------------------------

caption_helper <- function(txt) {
  if (knitr::is_latex_output())
    stringr::str_replace_all(txt, "([^`]*)`(.*?)`", "\\1\\\\texttt{\\2}") %>%
    stringr::str_replace_all("_", "\\\\_")
  else
    txt
}

