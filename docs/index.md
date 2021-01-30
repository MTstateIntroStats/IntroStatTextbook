--- 
title: "Montana State Introductory Statistics with R"
subtitle: "Spring 2021"
author: "Nicole Carnegie, Stacey Hancock, Elijah Meyer, Jade Schmidt, Melinda Yager"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib, eoce.bib]
biblio-style: apalike
link-citations: yes
github-repo: MTstateIntroStats/IntroStatTextbook
description: "Open resources textbook for Stat 216 at Montana State University"
monofont: "Source Code Pro"
header-includes:
- \usepackage{subfig}
---

# Welcome {-}
 
We hope readers will take away three ideas from this book in addition to forming a foundation of statistical thinking and methods.

1. Statistics is an applied field with a wide range of practical applications.
2. You don't have to be a math guru to learn from interesting, real data.
3. Data are messy, and statistical tools are imperfect. However, when you understand the strengths and weaknesses of these tools, you can use them to learn interesting things about the world.


## Textbook overview {-}

This textbook accompanies the curriculum for STAT 216: Introduction to Statistics at Montana State University. The syllabus and other course information can be found
on the [course webpage](https://math.montana.edu/courses/s216/index.html). Detailed learning outcomes for the course can be found [here](https://github.com/MTstateIntroStats/IntroStatTextbook/blob/master/learning_outcomes.md).

1. **Introduction to data.** Data structures, variables, and basic data collection techniques.
2. **Exploratory data analysis.** Data visualization and summarization for one and two variables, with a taste of probability.
3. **Correlation and regression.** Visualizing, describing, and quantifying relationships between two quantitative variables.
4. **Multivariable models.** Descriptive summaries for quantifying the relationship between many variables.
5. **Inference for categorical data.** Inference for one or two proportions using simulation and randomization techniques as well as the normal distribution.
6. **Inference for quantitative data.** Inference for one or two means using simulation and randomization techniques as well as the $t$-distribution.
7. **Inference for regression.** Inference for a regression slope or correlation using simulation and randomization techniques as well as the $t$-distribution.

## STAT 216 Coursepack {-}

Each week, you will work through an in-class activity with your team mates and the guidance of your instructor. These activities, as well as reading guides to guide you in taking notes on the required readings and videos, are included in the _STAT 216 Coursepack_. This course requires you to purchase a printed copy of the _STAT 216 Coursepack_ and bring it with you to class each day. 

The coursepack is available for purchase through the [MSU Bookstore](https://www.msubookstore.org/). You may purchase the coursepack in person, or you may purchase online and have the coursepack shipped to you. The coursepack will be available in the MSU Bookstore on the first day of classes. Chapter 1 of the coursepack is provided here if you do not have the coursepack by your first day of class.

* [STAT 216 Coursepack: Chapter 1](Coursepack-Ch1.pdf)


## Statistical computing {.unnumbered #stat-computing}

STAT 216 and this textbook use [`R`](https://www.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/) for statistical computing. `R` and RStudio are free and open source. `R` is the programming language that runs computations, while RStudio is the interface in which you engage with `R` (called an "integrated development environment", or IDE).

Since `R` is open source, users can contribute "packages" --- collections of `R` functions. There are over 16,000 available packages! In particular, we use
the [`tidyverse`](https://www.tidyverse.org/) collection of packages designed for doing data science.
STAT 216 also has its own `R` package called [`catstats`](https://github.com/greenwood-stat/catstats), which contains all of the functions
for running simulation-based inference in this course.

### Accessing RStudio {-}

MSU hosts its own web based version of RStudio, which can be found at: [rstudio.math.montana.edu](https://rstudio.math.montana.edu/). 

<!-- The information below is repeated in computing chapter. -->

Your username is your 7-character NetID (in the form x##x###, where x is a letter and # is a number), and your password is the password associated with your NetID. 

All registered Stat 216 students should have access to this server. If you are enrolled in the course, but receive the error "Incorrect or invalid username/password" when attempting to log in, take the following steps:

1. Ensure that you are using your 7-character NetID as your username. This is of the form x##x###, where x is a letter and # is a number. Your email address will not work to log into the RStudio server.  
2. Ensure that you are using the correct password that is associated with your NetID account. You can do this by logging into another site that requires your NetID (e.g., MyInfo) with the same credentials.
3. Reset your NetID password at [password.montana.edu
](http://password.montana.edu/). Your NetID password expires 180 days from the day you set it. If your password has expired, you will not be able to log into the RStudio server.

After you have tried all the steps above, if you continue to have issues logging in, please email Stat 216 Faculty Course Supervisor [Dr.\ Stacey Hancock](mailto:stacey.hancock@montana.edu).
You may also refer to the following section for other options for accessing RStudio.

*Note that any work you save on the server will be deleted, and your access will be removed after the semester ends. Thus, if you would like to save any files, export them to your own computer prior to the end of the semester.*

### Other options for accessing RStudio {-}

We recommend using RStudio through the MSU RStudio server, but there are other options for accessing this free software:

1. Use RStudio through an MSU [virtual machine](https://studentlabs.montana.edu/remotelabs/howto.html). Enter your 7-character NetID and password, then select "MSU" from the drop-down menu (_not_ "GFCMSU" or "MSUNORTHERN"). Upon logging in, select the "CLS-STAT-REMOTE" virtual machine. You will then see an RStudio icon on the virtual desktop.

2. Use RStudio on an MSU on-campus computer lab. 

3. Use RStudio through the [RStudio Cloud](https://login.rstudio.cloud/register?redirect=https%3A%2F%2Fclient.login.rstudio.cloud%2Foauth%2Flogin%3Fshow_auth%3D0%26show_login%3D1%26show_setup%3D1). This resource allows you to use RStudio through a web browser. It is free for use, but it does limit you to a certain number of project hours per month.

4. Download `R` and RStudio to your own laptop. (Note: `R` and RStudio will not run on iPad, notebooks, or Chromebooks.)

a. Download and install [R](https://cloud.r-project.org/).
b. Download and install [RStudio Desktop](https://rstudio.com/products/rstudio/).
c. Install the `catstats` package.

View this [tutorial video on installing R and RStudio](https://greenwood-stat.shinyapps.io/InstallDemo/) if you would
like additional installation instructions.


### Installing `catstats` {-}

**You only need to read this section if you are running RStudio on your own laptop**, in which case you need to install the `R` packages used in this course.

To use the `R` functions in the `catstats` package, you need to first install the `remotes` package,
and then install `catstats` from Github.

In the RStudio console, run the following commands:

```r
install.packages("remotes")
remotes::install_github("greenwood-stat/catstats")
```
If during the installation, it gives you an option to update the more
recent versions of packages, type `1` (to choose to install All),
then type Yes if it asks if you want to install.

You only need to run the installation commands once, but you will need to load
the `catstats` package each time you restart RStudio using the following command:

```r
library(catstats)
```

Note that the `catstats` package will install all of the packages needed to run code in this textbook,
so you will not need to load other packages (e.g., `openintro`) once you load `catstats` into your `R` session.

## About the authors {-}

### Montana State University Authors {-}

[Nicole Carnegie](https://math.montana.edu/directory/faculty/2040044/nicole-carnegie){target="_blank"} <br>
Associate Professor of Statistics <br>
nicole.carnegie@montana.edu <br>

<br>

[Stacey Hancock](http://www.math.montana.edu/shancock/){target="_blank"}  <br>
Assistant Professor of Statistics <br>
stacey.hancock@montana.edu <br>

<br>

Elijah Meyer <br>
PhD Statistics Graduate Student <br>
elijah.meyer@montana.edu <br>

<br>
[Jade Schmidt](http://www.math.montana.edu/directory/faculty/1524571/jade-schmidt){target="_blank"} <br>
Student Success Coordinator for Statistics <br>
jade.schmidt2@montana.edu <br>

<br>
[Melinda Yager](http://www.math.montana.edu/directory/faculty/1582830/melinda-yager){target="_blank"} <br>
Assistant Coordinator for Statistics <br>
melinda.yager@montana.edu <br>

<br>

### OpenIntro Authors {-}

[Mine Çetinkaya-Rundel](http://mine-cr.com/) <br>
mine@openintro.org <br>
University of Edinburgh, Duke University, RStudio <br>

<br>

[Johanna Hardin](https://research.pomona.edu/johardin/) <br>
jo@openintro.org <br>
Pomona College <br>

## Acknowledgements {-}

This resource is largely a derivative of the 1st and 2nd
editions of the OpenIntro textbook
[_Introductory Statistics with Randomization and Simulation_](https://www.openintro.org/),
without which this
effort would not have been possible. The authors would
also like to thank the Montana State University Library,
who generously funded this project.

## Licensing {-}

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />

This resource is released under a [Creative Commons BY-NC-SA 4.0 license](https://creativecommons.org/licenses/by-nc-sa/4.0/) unless otherwise noted. 

Visit the following link for guidelines when the textbook's source files are modified and/or shared, and for additional copyright information:

[http://www.openintro.org/perm/stat2nd_v1.txt](http://www.openintro.org/perm/stat2nd_v1.txt)
 
To cite this resource please use:
 
Carnegie, N., Hancock, S., Meyer, E., Schmidt, J., and Yager, M. (2021). *Montana State Introductory Statistics with R*. Montana State University. [https://mtstateintrostats.github.io/IntroStatTextbook/](https://mtstateintrostats.github.io/IntroStatTextbook/). Adapted from Çetinkaya-Rundel, M. and Hardin, J. (2021). _Introduction to Modern Statistics_. OpenIntro. [https://openintro-ims.netlify.app/](https://openintro-ims.netlify.app/).
