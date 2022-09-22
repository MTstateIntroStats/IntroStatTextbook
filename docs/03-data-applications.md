# Applications: Data {#data-applications}



::: {.chapterintro}
The [Preliminaries](rstudio) Chapter introduced the RStudio statistical computing environment.
In this chapter, we will explore tidy data in R---how to import and export data sets,
filter the data set into groups, and select or create new variables.
We encourage you to work through the code in this chapter in 
your own RStudio session.
:::

<!-- ## Data in R {#data-in-r} -->

R is a powerful and open source software tool for working with data. 
We use the R programming environment within the RStudio integrated
development environment (IDE), which offers a suite of additional features
in addition to the R programming console.
Throughout this text, we provide some guidance on how to use R within the
context of the statistical content that is being covered in each of the
"Applications" chapters at the end of each part.  

As educators, we see the value of teaching with modern software to
empower students to take optimal advantage of the concepts they are learning. 
Generally, we will present the R techniques in the "Applications" chapter at the
end of each part. There are times in the text when the concepts are not
distinguishable from the software, and in those cases, we have have provided the
R code within the main body of the chapter.

We start with an introduction to R, focused on how data sets are structured in
R and how the user can work with a data object in R.

## Dataframes in R

Throughout the text, we will work with many different data sets. Some data sets
are pre-loaded into R, some get loaded through R packages, and some data sets
will be created by the student. Data sets can be viewed through the RStudio
environment, and can also be investigated through various R **functions**.

::: {.onebox}
Similar to the notation for a mathematical function, an R **function** takes the form:
  
> `function_name(arguments to the function)`

The `function_name` is the name of the function, such as `mean`, `read.csv`, or `lm`.
You can access the help file for any named function by preceding it with a question mark: `?read.csv`.

The arguments to the function are the inputs to the function. These can be data sets, parameter values, or other options.
:::





In R, all functions take arguments in round parentheses (as opposed to
subsetting observations or variables from data objects which happen
with square parentheses).  

::: {.workedexample}
In the R console, type `?read.csv`. This will bring up the help file for the `read.csv()` function. What does this function do? What are the first two arguments to this function?

--------------------------------------

According to the "Description" section of the help file, the `read.csv` function
reads a data file and creates a data frame object in R, with cases corresponding
to lines and variables to fields in the file. The `read.csv` function in particular
is designed to read in `.csv` (comma separated value) data files.

The first argument is the `file` --- the name of the file or website which the data are to be read from. The second argument is `header` --- a **logical** argument (`TRUE` or `FALSE`) for whether the file contains a header row of variables or not.
The default for the function is `header = TRUE`, so if this argument isn't used,
R will assume the .csv file has a header row.
:::




Let's start by exploring a data set containing information on 50 emails
sent to David Diez's Gmail account (one of the authors of the _OpenIntro_
textbooks). The data set, \data{email50}, is built into the `openintro`
package in R and is comprised of a subset of emails from the larger `email`
data set that we'll see in Chapter \@ref(explore-categorical).
Data sets that are built into R packages can be loaded using the `data()` function.

::: {.data}
The `email50` data can be found in the [openintro](http://openintrostat.github.io/openintro/reference/index.html) package: `email50`^[The `email` data set found in the `openintro` package defines the variable `spam` as 0 (not spam) or 1 (spam), and `format` as 0 (not HTML) or 1 (HTML). When variables are defined in this way---coded as the numbers 0 and 1 rather than the category names---they are called **indicator variables*** or **dummy variables**. In this section of the textbook, we have re-coded `spam` to be the variable `type`, which takes on values "not spam" or "spam", and we have re-coded the variable `format` to take on values "not HTML" or "HTML".].

Load these data into your RStudio session using the following commands:

`library(openintro)`  
`data(email50)`  

:::

We can use the `glimpse()` function to see the variables included in the data set
and their data type. Or, we could use the `head()` function to see the first
few rows of the data set.


```r
data(email50)
glimpse(email50)
#> Rows: 50
#> Columns: 21
#> $ spam         <fct> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, …
#> $ to_multiple  <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, …
#> $ from         <fct> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
#> $ cc           <int> 0, 0, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, …
#> $ sent_email   <fct> 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, …
#> $ time         <dttm> 2012-01-04 06:19:16, 2012-02-16 13:10:06, 2012-01-04 08:…
#> $ image        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ attach       <dbl> 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, 0, …
#> $ dollar       <dbl> 0, 0, 0, 0, 9, 0, 0, 0, 0, 23, 4, 0, 3, 2, 0, 0, 0, 0, 0,…
#> $ winner       <fct> no, no, no, no, no, no, no, no, no, no, no, no, yes, no, …
#> $ inherit      <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ viagra       <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ password     <dbl> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 8, …
#> $ num_char     <dbl> 21.705, 7.011, 0.631, 2.454, 41.623, 0.057, 0.809, 5.229,…
#> $ line_breaks  <int> 551, 183, 28, 61, 1088, 5, 17, 88, 242, 578, 1167, 198, 7…
#> $ format       <fct> 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, …
#> $ re_subj      <fct> 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, …
#> $ exclaim_subj <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ urgent_subj  <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ exclaim_mess <dbl> 8, 1, 2, 1, 43, 0, 0, 2, 22, 3, 13, 1, 2, 2, 21, 10, 0, 0…
#> $ number       <fct> small, big, none, small, small, small, small, small, smal…
```


```r
head(email50) 
#> # A tibble: 6 × 21
#>   spam  to_multiple from     cc sent_e…¹ time                image attach dollar
#>   <fct> <fct>       <fct> <int> <fct>    <dttm>              <dbl>  <dbl>  <dbl>
#> 1 0     0           1         0 1        2012-01-04 06:19:16     0      0      0
#> 2 0     0           1         0 0        2012-02-16 13:10:06     0      0      0
#> 3 1     0           1         4 0        2012-01-04 08:36:23     0      2      0
#> 4 0     0           1         0 0        2012-01-04 10:49:52     0      0      0
#> 5 0     0           1         0 0        2012-01-27 02:34:45     0      0      9
#> 6 0     0           1         0 0        2012-01-17 10:31:57     0      0      0
#> # … with 12 more variables: winner <fct>, inherit <dbl>, viagra <dbl>,
#> #   password <dbl>, num_char <dbl>, line_breaks <int>, format <fct>,
#> #   re_subj <fct>, exclaim_subj <dbl>, urgent_subj <fct>, exclaim_mess <dbl>,
#> #   number <fct>, and abbreviated variable name ¹​sent_email
#> # ℹ Use `colnames()` to see all variable names
```




Sometimes it is necessary to extract a column or a row from a data set. 
In R, the `$` operator can be used to extract a column from a data set. 
For example, `data$variable` would extract the `variable` column from the `data` dataframe.
When extracted, these columns can be thought of as vectors. With these vectors, if you desired to pull off a specific entry, you could use square brackets (`[ ]`), with the index (number) of the entry you wish to extract in the brackets. 
For example, `data$variable[2]` would extract the second entry (row) of the `variable` column. 

Because a dataframe can be (roughly) thought of as a set of many different vectors, you can extract rows and columns from a dataframe using matrix notation (e.g. `[row, column]`). 
For example `data[i,j]` will extract the entry in row $i$ and column $j$;
`data[i, ]` will extract the $i^{th}$ row, and `data[ , j]` will extract the $j^{th}$ column.
Notice, when extracting an  entire row (or column), you do not need to specify the columns (or rows) you would like, which is why the second entry does not contain a number. 


```r
email50$num_char # The num_char variable column
#>  [1] 21.705  7.011  0.631  2.454 41.623  0.057  0.809  5.229  9.277 17.170
#> [11] 64.401 10.368 42.793  0.451 29.233  9.794  2.139  0.130  4.945 11.533
#> [21]  5.682  6.768  0.086  3.070 26.520 26.255  5.259  2.780  5.864  9.928
#> [31] 25.209  6.563 24.599 25.757  0.409 11.223  3.778  1.493 10.613  0.493
#> [41]  4.415 14.156  9.491 24.837  0.684 13.502  2.789  1.169  8.937 15.829
email50[47,3] # The entry in the 47th row and 3rd column
#> # A tibble: 1 × 1
#>   from 
#>   <fct>
#> 1 1
email50[47,] # The 47th row
#> # A tibble: 1 × 21
#>   spam  to_multiple from     cc sent_e…¹ time                image attach dollar
#>   <fct> <fct>       <fct> <int> <fct>    <dttm>              <dbl>  <dbl>  <dbl>
#> 1 0     1           1         0 0        2012-03-06 07:10:00     0      0      0
#> # … with 12 more variables: winner <fct>, inherit <dbl>, viagra <dbl>,
#> #   password <dbl>, num_char <dbl>, line_breaks <int>, format <fct>,
#> #   re_subj <fct>, exclaim_subj <dbl>, urgent_subj <fct>, exclaim_mess <dbl>,
#> #   number <fct>, and abbreviated variable name ¹​sent_email
#> # ℹ Use `colnames()` to see all variable names
```



## Tidy structure of data {#datastruc}

For plotting, analyses, model building, etc., the data should be structured according to certain principles.   
Hadley Wickham provides a thorough discussion and advice for cleaning up the data in @wickham2014.

::: {.onebox}
**Tidy data.**

A data set in which the rows are the observational units and the columns are the variables.  
The key is that *every* row is a case and *every* column is a variable.  
No exceptions.
:::

Creating tidy data is often not trivial! However, data sets provided in this course will always be provided in the tidy data form.





## Using the pipe to chain

Within R (really within any type of computing language, Python, SQL, Java, etc.), it is important to understand how to build data using the patterns of the language.  

In R, the syntax `<-` is called the **assignment** character; it is used to store the output of some function or set of operations in what we call an **object**. Some things to consider:

* `object_name <- anything` is a way of *assigning* `anything` to the new `object_name`.
* `object_name <- function_name(data_table, arguments)` is a way of using a function to create a new object.
* `object_name <- data_table %>% function_name(arguments)` uses *chaining syntax* called the **pipe operator** (`%>%`) as an extension of the ideas of functions.  








The pipe syntax (`%>%`) takes a data frame (or data table) and sends it to the argument of a function.  The mapping goes to the first available argument in the function.  
For example:

`x %>% f(y)` is the same as `f(x, y)`

` y %>% f(x, ., z)` is the same as `f(x,y,z)`

In chaining, the value on the left side of `%>%` becomes the *first argument* to the function on the right side. This can be extended to multiple lines of code:

``` 
object_name <- data_table %>%
                    function_name(arguments) %>% 
                    another_function_name(other_arguments)
```

This is called extended chaining.  

Some properties of the pipe syntax (`%>%`) to keep in mind:

* `%>%` is never at the front of the line, it is always connecting one idea with the continuation of that idea on the next line.

* The spot to the left of the first `%>%` is always a data table.

* The pipe syntax should be read as *then*, `%>%`.


Pipes are used commonly with functions in the `dplyr` package
(included in the `tidyverse` package) and they allow us to
sequentially build data wrangling operations.
Pipes are also helpful when creating data visualizations in the `ggplot2` package.

## A data wrangling example

Consider the built-in data set `hsb2` --- the "High School and Beyond" survey.  
Two hundred observations were randomly sampled from the
"High School and Beyond" survey, a survey conducted on high
school seniors by the National Center of Education Statistics.
Of interest is the proportion of students at each of the
two types of school, `public` and `private`.

First, load the data into your R session:


```r
data(hsb2) # Load the data
```

We use the `table` command to tabulate how many of each type
of school are in the data set.  Notice that the same result is
produced by the `$` command with `table` and the chaining
syntax done with `%>%`.


```r
table(hsb2$schtyp) 
#> 
#>  public private 
#>     168      32
```
is equivalent to

```r
hsb2 %>%
  select(schtyp) %>% # Select the schtyp variable
  table()
#> schtyp
#>  public private 
#>     168      32
```



In the code above, the `select()` function selected the `schtyp`
variable (column) from the `hsb2` data set.
Since data set is the first argument to the `select()` function
(examine the help file by typing `?select`), we only need to
include the second argument to `select()`---the variable we would
like to select.

### Filtering {-}
What if we are interested only in `public` schools?
First, we should take note of another piece of R syntax:
the double equal sign: `==`. 
This is the logical test for "is equal to". 
In other words, we first determine if school type is equal
to public for each of the observations in the data set and
`filter` for those where this is true.


```r
# Filter for public schools
hsb2_public <- hsb2 %>%  # Save final result as hsb2_public
  filter(schtyp == "public")  # Only include observations
                              # where the variable schtyp
                              # is equal to "public"
```
  
We can read this as: "take the `hsb2` data frame and `pipe` it
into the `filter` function. Filter the data for
`cases where school type is equal to public`. Then,
`assign` the resulting data frame to a new object
called `hsb2 underscore public`."  
  


### Mutating {-}
Suppose we are not interested in the actual reading score
of students, but instead whether their reading score is below
average or at or above average. 
First, we need to calculate the average reading score with
the `mean()` function. 
This will give us the mean value, 52.23.
However, in order to be able to refer back to this value later on,
we might want to store it as an object that we can refer to by name.


```r
# Calculate average reading score and show the value
mean(hsb2$read)
#> [1] 52.2
```

So instead of just printing the result, let’s save it as
a new object called `avg_read`.


```r
# Calculate average reading score and store as avg_read
avg_read <- mean(hsb2$read)
```

Next we need to determine whether each student is below or at
or above average. For example, a reading score of 57 is above
average, so is 68, but 44 is below. 
Obviously, going through each record like this would be tedious
and error prone.

Instead we can create this new variable with the `mutate()`
function from the `dplyr` package.

We start with the data frame, `hsb2`, and pipe it into
`mutate()`, to create a new variable called `read_cat` (`cat` for `cat`egorical). 
Note that we are using a new variable name here in order
to not overwrite the existing reading score variable.
The new variable `read_cat` will be a column in the
existing data frame `hsb2`.



```r
hsb2 <- hsb2 %>% mutate(read_cat = 
                          ifelse(read < avg_read, 
                                 "below average", 
                                 "at or above average"
                                 )
                        )
```

The decision criteria for this new variable is based on a
TRUE/FALSE question: if the reading score of the student
is below the average reading score, label "below average",
otherwise, label "at or above average".

This can be accomplished using the `ifelse()` function in R.
Look at its helpfile by typing `?ifelse` into the R console window.

* The first argument of the function is the logical test.

* The second argument is what to do if the result of the logical test is TRUE, in other words, if the student’s score is below the average score.

* The last argument is what to do if the result is FALSE.



## Terms {-}

We introduced the following terms in the chapter. 
If you're not sure what some of these terms mean, we recommend you go back in the text and review their definitions.
We are purposefully presenting them in alphabetical order, instead of in order of appearance, so they will be a little more challenging to locate. 
However you should be able to easily spot them as **bolded text**.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<tbody>
  <tr>
   <td style="text-align:left;"> assignment </td>
   <td style="text-align:left;"> object </td>
   <td style="text-align:left;"> tidy data </td>
  </tr>
  <tr>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> pipe operator </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>


## R functions {-}

The following R functions were introduced in this chapter.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<tbody>
  <tr>
   <td style="text-align:left;"> %&gt;% </td>
   <td style="text-align:left;"> `filter()` </td>
   <td style="text-align:left;"> `read.csv()` </td>
  </tr>
  <tr>
   <td style="text-align:left;"> `[ , ]` </td>
   <td style="text-align:left;"> `glimpse()` </td>
   <td style="text-align:left;"> `select()` </td>
  </tr>
  <tr>
   <td style="text-align:left;"> `==` </td>
   <td style="text-align:left;"> `head()` </td>
   <td style="text-align:left;"> `table()` </td>
  </tr>
  <tr>
   <td style="text-align:left;"> `$` </td>
   <td style="text-align:left;"> `ifelse()` </td>
   <td style="text-align:left;"> &lt;- </td>
  </tr>
  <tr>
   <td style="text-align:left;"> `data()` </td>
   <td style="text-align:left;"> `mutate()` </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>

