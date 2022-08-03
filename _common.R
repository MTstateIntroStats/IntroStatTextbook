## Specific to MSU version: ##
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

# extra packages for MSU version (add alphabetically) ------------------------------------------
suppressMessages(library(catstats))
suppressMessages(library(gapminder))
suppressMessages(library(ggraph))
suppressMessages(library(igraph))
suppressMessages(library(mosaic))
suppressMessages(library(plotly))
suppressMessages(library(RColorBrewer))

# packages that are loaded in exercises files in IMS
suppressMessages(library(cherryblossom))
suppressMessages(library(ggimage))
suppressMessages(library(lubridate))
suppressMessages(library(measurements))
suppressMessages(library(nycflights13))
suppressMessages(library(Stat2Data))
suppressMessages(library(tools))
suppressMessages(library(ukbabynames))
suppressMessages(library(unvotes))

## Copied from IMS: ##

################## Update from ims repo from here down -
# _common.R based on R4DS: https://github.com/hadley/r4ds/blob/master/_common.R
set.seed(25)
options(digits = 3)

# packages ---------------------------------------------------------------------

suppressMessages(library(caret))
suppressMessages(library(gghighlight))
suppressMessages(library(ggmosaic))
suppressMessages(library(ggpubr))
suppressMessages(library(ggrepel))
suppressMessages(library(ggridges))
suppressMessages(library(glue))
suppressMessages(library(gridExtra))
suppressMessages(library(infer))
suppressMessages(library(janitor))
suppressMessages(library(kableExtra))
suppressMessages(library(knitr))
suppressMessages(library(maps))
suppressMessages(library(openintro))
suppressMessages(library(palmerpenguins))
suppressMessages(library(patchwork))
suppressMessages(library(quantreg))
suppressMessages(library(scales))
suppressMessages(library(skimr))
suppressMessages(library(survival))
suppressMessages(library(tidymodels))
suppressMessages(library(tidyverse))
suppressMessages(library(waffle)) # Need package version >= 1.0.1
# Github install: https://github.com/hrbrmstr/waffle

# knitr chunk options ----------------------------------------------------------

knitr::opts_chunk$set(
  #eval = FALSE,
  comment = "#>",
  collapse = TRUE,
  message = FALSE,
  warning = FALSE,
  cache = FALSE, # only use TRUE for quick testing!
  echo = FALSE, # hide code unless otherwise noted in chunk options
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold",
  dpi = 300,
  fig.pos = "h"
)

if (knitr::is_html_output()) {
  knitr::opts_chunk$set(out.width = "90%")
} else if (knitr::is_latex_output()) {
  knitr::opts_chunk$set(out.width = "80%")
}

# knit options -----------------------------------------------------------------

options(knitr.kable.NA = "")

# kableExtra options -----------------------------------------------------------

options(kableExtra.html.bsTable = TRUE)

# dplyr options ----------------------------------------------------------------

options(dplyr.print_min = 6, dplyr.print_max = 6)

# ggplot2 theme and colors -----------------------------------------------------

if (knitr::is_html_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 13))
} else if (knitr::is_latex_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 11))
}

ggplot2::update_geom_defaults("point", list(color = openintro::IMSCOL["blue","full"],
                                            fill = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("bar", list(fill = openintro::IMSCOL["blue","full"],
                                          color = "#FFFFFF"))
ggplot2::update_geom_defaults("col", list(fill = openintro::IMSCOL["blue","full"],
                                          color = "#FFFFFF"))
ggplot2::update_geom_defaults("boxplot", list(color = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("density", list(color = openintro::IMSCOL["blue","full"]))
ggplot2::update_geom_defaults("line", list(color = openintro::IMSCOL["gray", "full"]))
ggplot2::update_geom_defaults("smooth", list(color = openintro::IMSCOL["gray", "full"]))
ggplot2::update_geom_defaults("dotplot", list(color = openintro::IMSCOL["blue","full"],
                                              fill = openintro::IMSCOL["blue","full"]))

# function: caption helper -----------------------------------------------------

caption_helper <- function(txt) {
  if (knitr::is_latex_output())
    stringr::str_replace_all(txt, "([^`]*)`(.*?)`", "\\1\\\\texttt{\\2}") %>%
    stringr::str_replace_all("_", "\\\\_")
  else
    txt
}

# function: make terms table ---------------------------------------------------

make_terms_table <- function(x, n_cols = 3){
  x <- sort(x) %>% unique()
  n_rows <- (length(x) / n_cols) %>% ceiling()
  desired_length <- n_rows * n_cols
  x_updated <- c(x, rep("", (desired_length - length(x))))
  matrix(x_updated, nrow = n_rows) %>%
    kbl(booktabs = TRUE, linesep = "") %>%
    kable_styling(bootstrap_options = c("striped", "condensed"),
                  latex_options = "striped",
                  full_width = TRUE)
}

# for foundation chapters ------------------------------------------------------

inference_method_summary_table <- tribble(
  ~question,
  ~randomization,
  ~bootstrapping,
  ~mathematical,
  "What does it do?",
  "Shuffles the explanatory variable to mimic the natural variability  found in a randomized experiment",
  "Resamples (with replacement) from the observed data to mimic the sampling variability found by collecting data from a population",
  "Uses theory (primarily the Central Limit Theorem) to describe the hypothetical variability resulting from either repeated randomized experiments or random samples",
  "What is the random process described?",
  "Randomized experiment",
  "Random sampling from a population",
  "Randomized experiment or random sampling",
  "What other random processes can be approximated?",
  "Can also be used to describe random sampling in an observational model",
  "Can also be used to describe random allocation in an experiment",
  "Randomized experiment or random sampling",
  "What is it best for?",
  "Hypothesis testing (can also be used for confidence intervals, but not covered in this text).",
  "Confidence intervals (can also be used for bootstrap hypothesis testing for one proportion as well).",
  "Quick analyses through, for example, calculating a Z score.",
  "What physical object represents the simulation process?",
  "Shuffling cards",
  "Pulling marbles from a bag with replacement",
  "Not applicable",
  "What are the technical conditions?",
  "Independence",
  "Independence, large n",
  "Independence, large n"
)
