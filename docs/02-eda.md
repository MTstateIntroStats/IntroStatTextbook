# Exploratory Data Analysis {#eda}

\BeginKnitrBlock{chapterintro}<div class="chapterintro">This chapter focuses on the mechanics and construction of summary statistics and graphs.
We use statistical software for generating the summaries and graphs presented in this chapter and book.
However, since this might be your first exposure to these concepts, we take our time in this chapter to detail how to create them.
Mastery of the content presented in this chapter will be crucial for understanding the methods and techniques introduced in rest of the book.</div>\EndKnitrBlock{chapterintro}

## Examining quantitative data {#quantitative-data}

In this section we will explore techniques for summarizing quantitative variables.
For example, consider the `loan_amount` variable from the `loan50` data set, which represents the loan size for all 50 loans in the data set.
This variable is quantitative since we can sensibly discuss the numerical difference of the size of two loans.
On the other hand, area codes and zip codes are not quantitative, but rather they are categorical variables.

Throughout this section and the next, we will apply these methods using the `loan50` and `county` data sets, which were introduced in Section \@ref(data-basics).
If you'd like to review the variables from either data set, see Tables \@ref(tab:loan50Variables) and \@ref(tab:countyVariables).

\BeginKnitrBlock{data}<div class="data">The [`county`](http://openintrostat.github.io/usdata/reference/county.html) data can be found in the [usdata](http://openintrostat.github.io/usdata) package.</div>\EndKnitrBlock{data}

\BeginKnitrBlock{data}<div class="data">The [`loan50`](http://openintrostat.github.io/openintro/reference/loan50.html) data can be found in the [openintro](http://openintrostat.github.io/openintro) package.</div>\EndKnitrBlock{data}

### Scatterplots for paired data {#scatterplots}

\index{data!loan50|(}

A **scatterplot** provides a case-by-case view of data for two quantitative variables.
In Figure \@ref(fig:county-multi-unit-homeownership), a scatterplot was used to examine the homeownership rate against the fraction of housing units that were part of multi-unit properties (e.g. apartments) in the `county` data set.
Another scatterplot is shown in Figure \@ref(fig:loan50-amount-income), comparing the total income of a borrower `total_income` and the amount they borrowed `loan_amount` for the `loan50` data set.
In any scatterplot, each point represents a single case.
Since there are 50 cases in `loan50`, there are 50 points in Figure \@ref(fig:loan50-amount-income).



When examining scatterplots, we describe four features:

1. **Form** - If you were to trace the trend of the points,
   would the trend be _linear_ or _nonlinear_?
2. **Direction** - As values on the _x_-axis increase, do the _y_-values
  tend to  increase (_positive_) or do they decrease (_negative_)?
3. **Strength** - How closely to the points follow a trend?
4. **Unusual observations** or **outliers**- Are there any unusual observations
   that do not seem to match the overall pattern of the scatterplot?




<div class="figure" style="text-align: center">
<img src="02-eda_files/figure-html/loan50-amount-income-1.png" alt="A scatterplot of `loan_amount` versus `total_income` for the `loan50` data set." width="70%" />
<p class="caption">(\#fig:loan50-amount-income)A scatterplot of `loan_amount` versus `total_income` for the `loan50` data set.</p>
</div>

Looking at Figure \@ref(fig:loan50-amount-income), we see that there are many 
borrowers with income below \$100,000 on the left side of the graph, while there 
are a handful of borrowers with income above \$250,000. The loan amounts vary from
below \$10,000 to around \$40,000. The data seem to have a _linear_ form, though
the relationship between the two variables is quite _weak_. The direction is
_positive_ -- as total income increases, the loan amount also tends to increase --
and there may be a few unusual observations in the higher income range,
though since the relationship is weak, it is hard to tell.

<div class="figure" style="text-align: center">
<img src="02-eda_files/figure-html/median-hh-income-poverty-1.png" alt="A scatterplot of the median household income against the poverty rate for the `county` dataset. Data are from 2017. A statistical model has also been fit to the data and is shown as a dashed line." width="70%" />
<p class="caption">(\#fig:median-hh-income-poverty)A scatterplot of the median household income against the poverty rate for the `county` dataset. Data are from 2017. A statistical model has also been fit to the data and is shown as a dashed line.</p>
</div>


\BeginKnitrBlock{example}<div class="example">Figure \@ref(fig:median-hh-income-poverty) shows a plot of median household income against the poverty rate for `r nrow(county)` counties.
What can be said about the relationship between these variables?

---

The relationship is evidently **nonlinear**, as highlighted by the dashed line. This is different from previous scatterplots we have seen, which show relationships that do not show much, if any, curvature in the trend.
The relationship is moderate to strong, the direction is negative,
and there does not appear to be any unusual observations.</div>\EndKnitrBlock{example}



\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">What do scatterplots reveal about the data, and how are they useful?^[Answers may vary. Scatterplots are helpful in quickly spotting associations relating variables, whether those associations come in the form of simple trends or whether those relationships are more complex.]</div>\EndKnitrBlock{guidedpractice}

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">Describe two variables that would have a horseshoe-shaped association in a scatterplot ($\cap$ or $\frown$)^[Consider the case where your vertical axis represents something "good" and your horizontal axis represents something that is only good in moderation. Health and water consumption fit this description: we require some water to survive, but consume too much and it become toxic and can kill a person.]</div>\EndKnitrBlock{guidedpractice}


### Dot plots and the mean {#dotplots}

Sometimes we are interested in the distribution of a single variable. 
In these cases, a dot plot provides the most basic of displays.
A **dot plot** is a one-variable scatterplot; an example using the interest rate of 50 loans is shown in Figure \@ref(fig:loan-int-rate-dotplot).




```
#> `stat_bindot()` using `bins = 30`. Pick better value with `binwidth`.
```

<div class="figure" style="text-align: center">
<img src="02-eda_files/figure-html/loan-int-rate-dotplot-1.png" alt="A dot plot of `interest_rate` for the `loan50` dataset. The rates have been rounded to the nearest percent in this plot, and the distribution's mean is shown as a red triangle." width="70%" />
<p class="caption">(\#fig:loan-int-rate-dotplot)A dot plot of `interest_rate` for the `loan50` dataset. The rates have been rounded to the nearest percent in this plot, and the distribution's mean is shown as a red triangle.</p>
</div>

The **mean**, often called the **average** is a common way to measure the center of a **distribution** of data. 
To compute the mean interest rate, we add up all the interest rates and divide by the number of observations.





The sample mean is often labeled $\bar{x}$.
The letter $x$ is being used as a generic placeholder for the variable of interest and the bar over the $x$ communicates we're looking at the average interest rate, which for these 50 loans is 11.57%.
It's useful to think of the mean as the balancing point of the distribution, and it's shown as a triangle in Figure \@ref(fig:loan-int-rate-dotplot).

\BeginKnitrBlock{onebox}<div class="onebox">**Mean.**
The sample mean can be calculated as the sum of the observed values divided by the number of observations:

\[ \bar{x} = \frac{x_1 + x_2 + \cdots + x_n}{n} \]</div>\EndKnitrBlock{onebox}

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">Examine the equation for the mean. What does $x_1$ correspond to? And $x_2$ Can you infer a general meaning to what $n_i$ might represent?^[$x_1$ corresponds to the interest rate for the first loan in the sample, $x_2$ to the second loan's interest rate, and $x_i$ corresponds to the interest rate for the $i^{th}$ loan in the data set. For example, if $i = 4$, then we're examining $x_4$, which refers to the fourth observation in the data set.]</div>\EndKnitrBlock{guidedpractice}

\BeginKnitrBlock{guidedpractice}<div class="guidedpractice">What was $n$ in this sample of loans?^[The sample size was $n = 50$.]</div>\EndKnitrBlock{guidedpractice}

The `loan50` data set represents a sample from a larger population of loans made through Lending Club.
We could compute a mean for this population in the same way as the sample mean.
However, the population mean has a special label: $\mu$.
The symbol $\mu$ is the Greek letter *mu* and represents the average of all observations in the population.
Sometimes a subscript, such as $_x$, is used to represent which variable the population mean refers to, e.g. $\mu_x$.
Often times it is too expensive to measure the population mean precisely, so we often estimate $\mu$ using the sample mean, $\bar{x}$.

\BeginKnitrBlock{pronunciation}<div class="pronunciation">The Greek letter $\mu$ is pronounced *mu*, listen to the pronunciation [here](https://youtu.be/PStgY5AcEIw?t=47).</div>\EndKnitrBlock{pronunciation}

\BeginKnitrBlock{example}<div class="example">The average interest rate across all loans in the population can be estimated using the sample data. Based on the sample of 50 loans, what would be a reasonable estimate of $\mu_x$, the mean interest rate for all loans in the full data set?

---
  
The sample mean, `r round(loan50_mean_intrest_rate, 2)`, provides a rough estimate of $\mu_x$. While it is not perfect, this is our single best guess **point estimate**\index{point estimate} of the average interest rate of all the loans in the population under study. In Chapter \@ref(inference-foundations) and beyond, we will develop tools to characterize the accuracy of point estimates, like the sample mean. As you might have guessed, point estimates based on larger samples tend to be more accurate than those based on smaller samples.</div>\EndKnitrBlock{example}



The mean is useful because it allows us to rescale or standardize a metric into something more easily interpretable and comparable. 
Suppose we would like to understand if a new drug is more effective at treating asthma attacks than the standard drug. 
A trial of 1500 adults is set up, where 500 receive the new drug, and 1000 receive a standard drug in the control group:

<table>
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:center;"> New drug </th>
   <th style="text-align:center;"> Standard drug </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Number of patients </td>
   <td style="text-align:center;"> 500 </td>
   <td style="text-align:center;"> 1000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total asthma attacks </td>
   <td style="text-align:center;"> 200 </td>
   <td style="text-align:center;"> 300 </td>
  </tr>
</tbody>
</table>

Comparing the raw counts of 200 to 300 asthma attacks would make it appear that the new drug is better, but this is an artifact of the imbalanced group sizes.
Instead, we should look at the average number of asthma attacks per patient in each group:

- New drug: $200 / 500 = 0.4$ asthma attacks per patient
- Standard drug: $300 / 1000 = 0.3$ asthma attacks per patient

The standard drug has a lower average number of asthma attacks per patient than the average in the treatment group.

\BeginKnitrBlock{example}<div class="example">Provide another examples where the mean is useful for making comparisons.

---
  
Emilio opened a food truck last year where he sells burritos, and his business has stabilized over the last 3 months.
Over that 3 month period, he has made $11,000 while working 625 hours.
Emilio's average hourly earnings provides a useful statistic for evaluating whether his venture is, at least from a financial perspective, worth it:

\[ \frac{\$11000}{625\text{ hours}} = \$17.60\text{ per hour} \]
  
By knowing his average hourly wage,
Emilio now has put his earnings into a standard unit that is easier to compare with many other jobs that he might consider.</div>\EndKnitrBlock{example}

\BeginKnitrBlock{example}<div class="example">Suppose we want to compute the average income per person in the US. To do so, we might first think to take the mean of the per capita incomes across the 3,142 counties in the \data{county} data set. What would be a better approach?

---
  
The `county` data set is special in that each county actually represents many individual people.
If we were to simply average across the `income` variable, we would be treating counties with 5,000 and 5,000,000 residents equally in the calculations.
Instead, we should compute the total income for each county, add up all the counties' totals, and then divide by the number of people in all the counties.
If we completed these steps with the \data{county} data, we would find that the per capita income for the US is $30,861.
Had we computed the *simple* mean of per capita income across counties, the result would have been just $26,093!

This example used what is called a **weighted mean**.
For more information on this topic, check out the following online supplement regarding [weighted means](https://www.openintro.org/go/?id=stat_extra_weighted_mean).</div>\EndKnitrBlock{example}




### Boxplots and the five-number summary {#boxplots}



### Histograms and density plots {#histograms}


### Examining variability {#variability}


### Comparing distributions {#distributions}

- center, shape (symmetric, skewed, normal), spread, outliers
- side-by-side boxplots, stacked dotplots/histograms

## Examining categorical data {#categorical-data}

Like numerical data, categorical data can also be organized
and analyzed. This section introduces tables and other basic
tools for categorical data that are used throughout this book.
The `email` data set contains information
on 3,921 emails. In this section, we will examine whether the
presence of numbers, small or large, in an email provides any
useful value in classifying email as spam or not spam.

### Contingency tables and bar plots

<span style='color: red;'>-one cat variable plot
- Define frequencies/counts and relative frequencies/proportions
- Two-way/contingency tables 
- Bayes theorem with tables and trees - conditional vs unconditional probabilities</span>

Table \@ref(tab:emailTable) summarizes two variables:
`Type` (spam or not spam) and `Number`. `Number` is a
categorical variable that describes whether an email
contains no numbers, only small numbers (values under 1 million),
or at least one big number (a value of 1 million or more).
A table that summarizes data for two categorical variables
in this way is called a **contingency table** or **two-way table**.
Each value in the table represents the number of times, or **frequency**
a particular combination of variable outcomes occurred.
For example, the value 149 corresponds to the number of emails
in the data set that are spam _and_ had no number listed in the email.
Row and column totals are also included.
The **row totals** provide the total counts across each row
(e.g., $149 + 168 + 50 = 367$), and **column totals** are total
counts down each column.

A table for a single variable is called a **frequency table**. Table
\@ref(tab:emailTableNumber) is a frequency table for the `Number` variable.
If we replaced the counts with percentages or proportions,
the table would be called a **relative frequency table**.



<table>
<caption>(\#tab:emailTable)Contingency table of `Type` and `Number` variables.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> none </th>
   <th style="text-align:right;"> small </th>
   <th style="text-align:right;"> big </th>
   <th style="text-align:right;"> Total </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> spam </td>
   <td style="text-align:right;"> 149 </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 367 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> not spam </td>
   <td style="text-align:right;"> 400 </td>
   <td style="text-align:right;"> 2659 </td>
   <td style="text-align:right;"> 495 </td>
   <td style="text-align:right;"> 3554 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 549 </td>
   <td style="text-align:right;"> 2827 </td>
   <td style="text-align:right;"> 545 </td>
   <td style="text-align:right;"> 3921 </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:emailTableNumber)Frequency table of `Number` variable.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> none </th>
   <th style="text-align:right;"> small </th>
   <th style="text-align:right;"> big </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 549 </td>
   <td style="text-align:right;"> 2827 </td>
   <td style="text-align:right;"> 545 </td>
  </tr>
</tbody>
</table>

#### Segmented bar and mosaic plots
- two cat plot

### Why not pie charts?



