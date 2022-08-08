# Preliminaries: Getting started in RStudio {.unnumbered #rstudio}



STAT 216 and this textbook use [R](https://www.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/) for statistical computing.
R and RStudio are free and open source. R is the programming language that runs computations, while RStudio is the interface in which you engage with R (called an "integrated development environment", or IDE). We will often use "R" and "RStudio" interchangeably throughout this textbook.

This preliminaries chapter will introduce you to the RStudio environment itself.
We will begin to learn how to code in RStudio in Chapter @\ref(#data-applications).


## Accessing RStudio {-}

MSU hosts its own web based version of RStudio, which can be found at: [rstudio.math.montana.edu](https://rstudio.math.montana.edu/).
When you navigate to the [MSU RStudio server](https://rstudio.math.montana.edu/), you will see the following sign-in screen:

![](00/images/sign-in.png){width=3in}

Your username is your **7-character NetID** (in the form x##x###, where x is a letter and # is a number), and your password is the password associated with your NetID. 

After logging in, you will see the RStudio working environment, displayed in Figure \@ref(fig:rstudio-env) below.

<div class="figure" style="text-align: center">
<img src="00/images/RStudio-env.png" alt="RStudio working environment." width="100%" />
<p class="caption">(\#fig:rstudio-env)RStudio working environment.</p>
</div>

All registered STAT 216 students should have access to this server starting on the first day of classes. If you are enrolled in the course, but receive the error "Incorrect or invalid username/password" when attempting to log in, take the following steps:

1. Ensure that you are using your 7-character NetID as your username. This is of the form x##x###, where x is a letter and # is a number. Your email address will not work to log into the RStudio server.  
2. Ensure that you are using the correct password that is associated with your NetID account. You can do this by logging into another site that requires your NetID (e.g., MyInfo) with the same credentials.
3. Reset your NetID password at [password.montana.edu
](http://password.montana.edu/). Your NetID password expires 180 days from the day you set it. If your password has expired, you will not be able to log into the RStudio server.

After you have tried all the steps above, if you continue to have issues logging in, please email the STAT 216 Faculty Course Supervisor [Dr.\ Stacey Hancock](mailto:stacey.hancock@montana.edu).
You may also refer to the following section for other options for accessing RStudio.

*Note that any work you save on the server will be deleted and your access will be removed after the semester ends. Thus, if you would like to save any files, export them to your own computer prior to the end of the semester.*

### Alternative options for accessing RStudio {-}

We recommend using RStudio through the MSU RStudio server, but there are other options for accessing this free software:

1. Use RStudio through an MSU [virtual machine](https://studentlabs.montana.edu/remotelabs/howto.html). We **highly recommend installing the VMware Horizon Client** if you will be using the virtual machine regularly, as using it through a web browser runs the risk of losing your work if the browser disconnects from the system (which can happen for a number of reasons).
    * Your log-in is your 7-character NetID and password.
    * Select the "MSU" domain (_not_ "GFCMSU" or "MSUNORTHERN").
    * Upon logging in, select the "CLS-STAT-REMOTE" virtual machine. You will then see an RStudio icon on the virtual desktop.  

2. Use RStudio on an MSU on-campus computer lab. 

3. Use RStudio through the [RStudio Cloud](https://rstudio.cloud/). This resource allows you to use RStudio through a web browser. It is free for use, but it does limit you to a certain number of project hours per month.

4. Download R and RStudio to your own laptop. (Note: R and RStudio will not run on iPad, notebooks, or Chromebooks.)
    a. Download and install [R](https://cloud.r-project.org/).
    b. Download and install [RStudio Desktop](https://rstudio.com/products/rstudio/).
    c. Install the `catstats` package.
    View this [tutorial video on installing R and RStudio](https://rconnect.math.montana.edu/InstallDemo/) if you would
like additional installation instructions.


## Packages {-}

Since R is open source, users can contribute "packages" (or "libraries") --- collections of R functions. There are over 16,000 available packages! In particular, we use
the [`tidyverse`](https://www.tidyverse.org/) collection of packages designed for doing data science.
STAT 216 also has its own R package called [`catstats`](https://github.com/greenwood-stat/catstats), which contains all of the functions
for running simulation-based inference in this course.

### Using packages {-}

Some packages are already installed with R and RStudio, but others (such as `tidyverse`)
first need to be installed before they can be used. You can install a package
by clicking on the "Packages" tab in RStudio and clicking the "Install" icon.
You can also install a package using the `install.packages()` command.
_If you are using the [MSU RStudio server](https://rstudio.math.montana.edu/),
all the necessary packages will already be installed._

Once a package is installed, you need to "load" the package into your RStudio session
using the `library()` command. For example, if you want to load the `tidyverse` package, you would use the following code:

```r
library(tidyverse)
```

Packages only need to be installed once, but they need to be loaded each time you start a new RStudio session. Think of installing a package as installing a light bulb, and loading a package as flipping on the switch (see Figure \@ref(fig:install-vs-library)^[Analogy and image credit to Dianne Cook of Monash University, taken from [https://hbctraining.github.io/Intro-to-R-flipped/lessons/04_introR_packages.html]().]).

<div class="figure" style="text-align: center">
<img src="00/images/RInstallvsLibrary.jpeg" alt="Installing (`install.packages()`) versus loading (`library()`) R packages." width="100%" />
<p class="caption">(\#fig:install-vs-library)Installing (`install.packages()`) versus loading (`library()`) R packages.</p>
</div>

<!-- TODO: Add image source reference: https://hbctraining.github.io/Intro-to-R-flipped/lessons/04_introR_packages.html -->


### The `catstats` package {-}

STAT 216 uses R functions from its own R package called [`catstats`](https://github.com/greenwood-stat/catstats).
This package is already installed in your RStudio environment on the [MSU RStudio server](https://rstudio.math.montana.edu/). However, you need to "load"
the package (or library) each time you start a new session using the following command:

```r
library(catstats)
```

If you are running RStudio on your own computer or laptop, you will need to first install the R packages used in this course. Most packages can be installed from directly within RStudio, but `catstats` needs to be installed from Github (since it is not yet on [CRAN](https://cran.r-project.org/)).

To use the R functions in the `catstats` package, you need to first install the `remotes` package. Functions from that package will then be used to install `catstats` from Github. In the RStudio console, run the following commands:

```r
install.packages("remotes")
remotes::install_github("greenwood-stat/catstats")
```
If, during the installation, it gives you an option to update the more
recent versions of packages, type `1` (to choose to install All),
then type Yes if it asks if you want to install.

Note that the `catstats` package will install all of the packages needed to run code in this textbook,
so you will not need to load other packages (e.g., `tidyverse`) once you load `catstats` into your R session.


## Projects {-}

The RStudio workflow operates best by the use of "Projects". Think of a "Project" as its own R session with its own folder. You should create a separate project for each activity or assignment in this course that requires the use of R:

1. In the top right corner, you will see a dropdown menu next to "Project" that currently says "(None)". Click on this menu and choose "New Project". 

<img src="00/images/open-project2.png" width="100%" style="display: block; margin: auto;" />

OR Click on the "File" menu in the top left and select "New Project".
    
<img src="00/images/open-project.png" width="100%" style="display: block; margin: auto;" />


2. A "New Project Wizard" window should pop up. Click "New Directory".
<img src="00/images/new-project-step1.png" width="70%" style="display: block; margin: auto;" />



|          Then click "New Project".

<img src="00/images/new-project-step2.png" width="70%" style="display: block; margin: auto;" />


3. Give your project directory a name (e.g., Assignment1). _Do not use spaces or other characters in the name._ 
    - Click "Browse" and choose a location where you would like to save your project. If you click on the "Home" button, it will leave the location as "~", as shown below. Alternatively, you can create a new folder to store your project. Note that this location is on your server account, not on your computer. 
    - Leave all other boxes unchecked, and click "Create Project". 

<img src="00/images/new-project-step3.png" width="70%" style="display: block; margin: auto;" />

You should notice the project name appear as a folder under the "Files" window in the bottom right. If you click on that folder, you will see the project file (with an .Rproj extension). Save any script files, data sets, or other files related to this project in the same folder.

## R script files {-}

You can type directly into the Console after the `>` symbol to run R code:

    > 3+5
    [1] 8

However, if you would like to save your code for future use, we write our R commands in an R **script file**. A script file is just a text file with the extension .R.

In your RStudio environment, click the "New File" option under the "File" menu, and select "R Script".

![](00/images/new-script.png){width=3in}

A window in the top left of the RStudio environment will appear. This is your script file!

### Try it! {-}

1. Open a new R script file.
2. Type the following commands in the file:

```r
3+5
sqrt(10)
```

3. Highlight the two lines you just typed. Click the "Run" button, which looks like a blank page with a green right arrow.

![](00/images/run.png){width=5in}

Both your code and the output from the code should appear in the Console window.

```
#> [1] 8
#> [1] 3.16
```

To save your script file, click the Save icon, or go to File -> Save. Browse to the location where you'd like to save the file (which should be the same folder as the current Project file), name the file, and click Save. The name of the R script file should have changed to the name you chose (e.g., MyFirstScript.R), and the file should appear in your list of files in the bottom right.

<img src="00/images/save-script.png" width="100%" style="display: block; margin: auto;" />


## Loading data {-}

RStudio can load data from a variety of sources, including .txt, .csv, or .xlsx files, and can even load data from a website. For all of the activities and assignments in this course, you will be loading a data set from the Stat 216 website. The code for loading these data sets will be included in a provided R script file. For example, the following code will load the "Current Population Survey" data set for Activity 3, and save it in an object called "CPS".


```r
CPS <- read.csv("https://math.montana.edu/courses/s216/data/cps.csv")
```

After running this line of code, you will see the object `CPS` appear in your "Environment" list, with the information that the data set contains 534 observations and 11 variables measured on those observations.

<img src="00/images/cps-object.png" width="60%" style="display: block; margin: auto;" />

Clicking on the name `CPS` or typing the command `View(CPS)` opens a new window that displays the data set.

<img src="00/images/cps-view.png" width="70%" style="display: block; margin: auto;" />

For your course project, you will have your own data set file which you will need to import into RStudio. To read a data set file into RStudio when using the MSU server, you first need to upload the data set into your project. Once the data set is in your server account files, you can use the "Import Dataset" button to import the data set from that location.

### Try it! {-}

First, download any of the data sets shown on the [Stat 216 webpage](https://math.montana.edu/courses/s216/#data), and save it to your computer. The website will note the extension of the file (e.g., .txt, .csv, .xlsx).

1. In RStudio, click the "Upload" button under the "Files" tab in the bottom right.

<img src="00/images/upload.png" width="50%" style="display: block; margin: auto;" />

a. Click the "Browse" button and navigate to the location on the *server* where you would like to save the data set.
b. Click "Choose File", and navigate to where you saved the data set on *your computer*. Click on the data set file name, click "Choose for Upload", then click "OK".

2. Under the "Environment" tab, click "Import Dataset".

<img src="00/images/import-data.png" width="60%" style="display: block; margin: auto;" />

A drop-down menu will appear, and you can choose the type of file in which your data is stored. Common formats include text files (e.g., .csv, .txt) --- select "From Text (readr)" --- and Excel spreadsheets (.xlsx) --- select "From Excel".

3. Click "Browse", and navigate to the location on the *server* where the data was uploaded. RStudio will show you a data preview --- each observation should be a single row, and each variable should be a single column. Then click "Import".


You will see the data object appear in the "Environment" (its name will be whatever the filename was), and RStudio will open a window to view the data set.

## Exporting files {-}

Since you will be working in RStudio on a server, and not on your local computer, if you would like to use any of the files generated in RStudio, you first need to export them.

### Exporting R script files {-}

You can export any of the R script files saved in your server files (or any other type of file) by checking the box next to the file, then clicking "More", and "Export". It will ask you to specify a name for the file. Then click "Download".

<img src="00/images/export-script.png" width="60%" style="display: block; margin: auto;" />

### Try it! {-}

Try exporting the R script file you created above.

### Exporting plots {-}

To export a plot, we first need to create a plot. 

### Try it! {-}

1. Copy and paste the following code into your script file; then highlight the code and click Run. (You will see this code in Activity 3!)


```r
library(tidyverse) 

myopia <- read.csv("https://math.montana.edu/courses/s216/data/ChildrenLightSight.csv") 

myopia %>% 
  ggplot(aes(y = Light)) +
  geom_bar(stat = "count") +
  labs(title = "Frequency Bar Plot of Level of Myopia",
       x = "Frequency",
       y = "Level of Myopia")  +
  coord_flip()
```

A bar plot should appear under the "Plots" tab.

2. Click the "Export" button, and then you can choose to export the plot either as an image file (e.g., .png, .jpeg), a pdf file, or to copy to the clipboard (e.g., for pasting into a Word document).

<img src="00/images/myopia.png" width="60%" style="display: block; margin: auto;" />

If you are saving the plot to your computer (rather than copying the plot), a window will pop up with various options. Choose the directory on *your computer* where you would like to save the file, give your plot a name, change the dimensions if desired, and click Save.

## Home {-}

In the RStudio environment, next to your NetID in the top right corner is a "home" icon. Click this icon, and it will take you to your dashboard.

<img src="00/images/home.png" width="100%" style="display: block; margin: auto;" />

From here, you can see how many sessions you have running under the "Sessions" title, and you will see your list of projects under the "Projects" title. You can click on any of these sessions or projects to return to that session/project.

## Troubleshooting {-}

One of the most frustrating things about learning and using R is when an error message pops up. Sometimes the error message is descriptive, but sometimes it is cryptic. Most times, the error message will include the line of code in which the mistake was made.

Here are some tips on what to do when this happens:

1. Do you have any missing parentheses? Check that all opening parentheses have an associated ending parenthesis.
1. Did you forget a comma?
1. Is something in quotes that shouldn't be? Is something not in quotes that should be?
1. Did you type the variable or object name correctly? R is case sensitive, so the case of the letters needs to match correctly.
1. If you were trying to run an entire script file, try running it line-by-line to see where the error happens.
1. If you are trying to run an R function, pull up the help file for that function to make sure all the arguments are specified correctly. E.g., Type `?lm` to see the help file for the `lm` function.
1. Copy-and-paste the error message, then input that message _in quotes_ into Google. Searching the phrase in quotes will make sure that specific error shows up in the top results.
1. Visit your instructor's office hours or the Math Learning Center, share your screen to show the error, and we can help troubleshoot with you.

Some common error messages and their reasons include:

* **"could not find function"**. This error occurs when an R package is not loaded properly or due to misspelling of the function or data set name. Remember, with every R session, you need to "load" the required packages using the `library` command, e.g., The code `library(catstats)` will load the `catstats` package.
* **"object not found"** or **"error in eval"**. This error occurs when the particular object in question does not exist or is empty.
* **"non-numeric argument to a binary operator"**. This error may occur when you're trying to run a function that requires a numerical vector (e.g., `mean`), but you input a character vector.

Remember, even experienced R users still get errors! It's all part of the learning process.

## Extra references {-}

There are many websites designed to provide help on how to use R and RStudio, but it is sometimes hard to find help at the right level. Here are some additional recommended websites for getting started in R and RStudio in STAT 216:

* [RStudio IDE Cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf): For an annotated picture of the RStudio environment, coding keyboard shortcuts, and probably more than you want to know about the features of RStudio, refer to this two-page "cheatsheet". RStudio produces many of these cheatsheets. The [Data visualization with `ggplot2` cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf) is also helpful in this course.

* [Using RStudio](http://homepages.gac.edu/~anienow2/MCS_142/R/index.html): This is the RStudio help pages for the introductory statistics course at Gustavus Adolphus College. Like MSU, students use RStudio through a server; however, they use R Markdown documents, which are slightly more involved than the R script files we use in STAT 216. These pages have some tips on how to get started, and brief instructions for creating tables, statistics, plots, and theory-based tests.

* _R for Data Science_: This book by Hadley Wickham (the creator of `tidyverse` and many other R packages and resources), has much more content than we need, but some of the sections are particularly helpful:
    - [What is RStudio and the tidyverse?](https://r4ds.had.co.nz/introduction.html#rstudio)
    - [How do I run R code?](https://r4ds.had.co.nz/introduction.html#running-r-code)
    - [What are R scripts?](https://r4ds.had.co.nz/workflow-scripts.html)
    - [Data visualization with `ggplot`](https://r4ds.had.co.nz/data-visualisation.html#data-visualisation)

* [_ModernDive: Statistical Inference via Data Science_ --- Chapter 1: Getting Started with Data in R](https://moderndive.com/1-getting-started.html): Though this textbook is at a slightly higher level that STAT 216, its first chapter gives a great explanation of what exactly R and RStudio do, explaining the differences between point-and-click interfaces and an "interpreted language" like R. Chapter 2 of this book gives a detailed overview of data visualization methods using the `ggplot2` R package.

* [R Data](http://varianceexplained.org/RData/): A free "course" that includes videos with interactive elements. Topics include: variables and data structures, visualizing data using the `ggplot2` R package, statistical tests, and data wrangling. The videos on visualizing data will be particularly helpful during the first few activities in the course.

* Chester Ismay has a great argument for why we should use R. If you're wondering why STAT 216 uses R and RStudio instead of other statistical software, [read this short chapter](https://bookdown.org/chesterismay/rbasics/2-whyR.html).


