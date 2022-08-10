# Montana State Introductory Statistics with R Extended Outline: Fall 2022

## Notes

- Italicized sections are new (to be modeled off of IMS); non-italicized sections are the same from previous version
- The "Applications: X" chapters will be the chapters where we teach students how to use R and catstats for the content covered in that part of the book.
- Each non-"Applications: X" chapter ends with a "Chapter review" containing the following _unnumbered_ subsections:
	* Summary (summary paragraph)
	* Terms (automatically generated - same blurb ahead of terms for all chapters)
	* Key ideas (bulleted list of key ideas; no introductory paragraph)

# Outline

### Welcome {.unnumbered}

(includes copyright and licensing)

### Authors {.unnumbered} (all sections unnumbered)

- Montana State University Authors
- OpenIntro Authors

### Preface {.unnumbered} (all sections unnumbered)

- Textbook overview
	* Examples and exercises
	* Data sets and their sources
- STAT 216 Coursepack
- Acknowledgments

### Preliminaries: Getting started in RStudio {.unnumbered #rstudio} (all sections unnumbered)

- Accessing RStudio
	* Alternative options for accessing RStudio
- Packages
	* Using packages
	* The `catstats` package
- Projects
- R script files
	* Try it!
- Loading data
	* Try it!
- Exporting files
	* Exporting R script files
	* Try it!
	* Exporting plots
	* Try it!
- Home
- Troubleshooting
- Extra references


## Part 1: Introduction to data

### 1. Hello data {#data-hello}

- 1.1 Case study: using stents to prevent strokes {#basic-stents-strokes}
- 1.2 Data basics {#data-basics}
	* 1.2.1 Observations, variables, and data frames
	* 1.2.2 Types of variables {#variable-types}
	* 1.2.3 Relationships between variables {#variable-relations}
	* 1.2.4 Explanatory and response variables
	* 1.2.5 Introducing observational studies and experiments
- 1.3 Chapter review {#chp1-review}

### 2. Study design {#data-design}

- 2.1 Sampling principles and strategies {#sampling-principles-strategies}
	* 2.1.1 Populations and samples
	* _2.1.2 Parameters and statistics_
	* 2.1.3 Anecdotal evidence
	* 2.1.4 Sampling from a population
	* 2.1.5 Four sampling methods (special topic) {#samp-methods}
- 2.2 Observational studies
- 2.3 Experiments
	* 2.3.1 Principles of experimental design
	* 2.3.2 Reducing bias in human experiments {#reducing-bias-human-experiments}
- 2.4 Scope of inference
- 2.5 Chapter review {#chp2-review}

### 3. Applications: Data {#data-applications}


## Part 2: Exploratory data analysis

### 4. Exploring categorical data {#explore-categorical}

- 4.1 Contingency tables and conditional proportions
	* 4.1.1 Row and column proportions
	* 4.1.2 Sample proportions and population proportions
- 4.2 Bar plots and mosaic plots
- 4.3 Why not pie charts?
- 4.4 Simpson's paradox {#simpson}
- 4.5 Chapter review {#chp4-review}


### 5. Exploring quantitative data {#explore-numerical}

- 5.1 Scatterplots for paired data {#scatterplots}
- 5.2 Dot plots and the mean {#dotplots}
- 5.3 Histograms and shape {#histograms}
- 5.4 Variance and standard deviation {#variance-sd}
- 5.5 Boxplots, quartiles, and the median
- 5.6 Describing and comparing quantitative distributions
- 5.7 Robust statistics
- 5.8 Transforming data (special topic)
- 5.9 Mapping data (special topic)
- 5.10 Chapter review {#chp5-review}


### 6. Correlation and regression {#explore-regression}

- 6.1 Fitting a line, residuals, and correlation {#fit-line-res-cor}
	* 6.1.1 Fitting a line to data
	* 6.1.2 Using linear regression to predict possum head lengths
	* 6.1.3 Residuals
	* 6.1.4 Describing linear relationships with correlation
- 6.2 Least squares regression {#least-squares-regression}
	* 6.2.1 Gift aid for freshman at Elmhurst College
	* 6.2.2 An objective measure for finding the best line
	* 6.2.3 Finding and interpreting the least squares line
	* 6.2.4 Extrapolation is treacherous
	* 6.2.5 Describing the strength of a fit
	* 6.2.6 Categorical predictors with two levels (special topic){#categprical-predictor-two-levels}
- 6.3 Outliers in linear regression {#outliers-in-regression}
	* 6.3.1 Types of outliers
- 6.4 Chapter review {#chp6-review} - Additional sections after Summary subsection:
	* Data visualization summary (tree diagram to decide on appropriate visualization)
	* Summary measures
	* Notation summary
	

### 7. Multivariable models {#explore-mult-reg}

- 7.1 Gapminder world
- 7.2 Simpson's paradox revisited
- 7.3 Multiple regression (special topic) {#regression-multiple-predictors}
	* 7.3.1 Indicator and categorical predictors {#ind-and-cat-predictors}
	* 7.3.2 Many predictors in a model
- 7.4 Chapter review {#chp7-review}

### 8. Applications: Explore {#explore-applications}



## Part 3: Foundations of inference

### 9. Hypothesis testing with randomization {#foundations-randomization}

Modeled after [Chapter 11](https://openintro-ims.netlify.app/foundations-randomization.html) in IMS

- 9.1 Motivating example: Martian alphabet {#Martian}
	* _9.1.1 Observed data_
	* _9.1.2 Variability of the statistic_
	* _9.1.3 Observed statistic vs. null statistics_
- _9.2 Case study: Sex discriminatinon (modeled after [Section 11.1](https://openintro-ims.netlify.app/foundations-randomization.html#caseStudySexDiscrimination) of IMS - previously in our two-proportion section)_  {#caseStudySexDiscrimination}
	* _9.1.1 Observed data_
	* _9.1.2 Variability of the statistic_
	* _9.1.3 Observed statistic vs. null statistics_
- 9.3 Hypothesis testing {#HypothesisTesting}
	* 9.3.1 The US court system
	* 9.3.2 p-value and statistical significance {#p-value-stat-signif}
- 9.4 Chapter review {#chp9-review}

### 10. Confidence intervals with bootstrapping {#foundations-bootstrapping}

Modeled after [Chapter 12](https://openintro-ims.netlify.app/foundations-bootstrapping.html)
 in IMS

- 10.1 _Case study: Medical consultant_ (model after [Section 12.1](https://openintro-ims.netlify.app/foundations-bootstrapping.html#case-study-med-consult) of IMS - previously in our one-proportion section) {#case-study-med-consult}
	* _10.2.1 Observed data_
	* _10.2.2 Variability of the statistic_
- 10.3 Confidence intervals {#ConfidenceIntervals}
	* _Plausible range of values for the population parameter_
	* _Bootstrap confidence interval_
- 10.4 Case study: Medical consultant revisited {#case-study-med-consult-test}
- 10.4 Chapter review {#chp10-review}


### 11. Inference with mathematical models {#foundations-mathematical}

- _11.1 Central Limit Theorem_ (take from current "Variability in a statistic" section in "Foundations of inference" subsection of categorical inference) {#CLTsection}
- 11.2 Normal distributions {#normal}
	* 11.2.1 Normal distribution model
	* 11.2.2 Standardizing with Z-scores
	* 11.2.3 Normal probability calculations in R
	* 11.2.4 Normal probability examples
	* 11.2.5 68-95-99.7 rule
- _11.3 Quantifying the variability of a statistic_ (model after [Section 13.3](https://openintro-ims.netlify.app/foundations-mathematical.html#quantifying-the-variability-of-a-statistic) of IMS)
	* _11.3.1 Standard error_
	* _11.3.2 Margin of error_ {#moe}
- 11.3 _Martian alphabet revisited_
- 11.4 _Case study (test): Medical consultant_ (model after [Section 13.5](https://openintro-ims.netlify.app/foundations-mathematical.html#casemed) of IMS)
	* _11.4.1 Observed data_
	* _11.4.2 Variability of the statistic_
	* _11.4.3 Observed statistic vs. null statistics_
	* _11.4.4 Conditions for applying the normal model_ 
- _11.5 Case study (interval): Stents_ (model after [Section 13.6](https://openintro-ims.netlify.app/foundations-mathematical.html#casestent))
	* _11.5.1 Observed data_
	* _11.5.2 Variability of the statistic_
	* _11.5.3 Interpreting confidence intervals_
- 11.6 Chapter review {#chp11-review}

### 12. Errors, power, and practical importance {#foundations-errors}

Merge our material with [Chapter 14](https://openintro-ims.netlify.app/decerr.html) of IMS {#decerr}

- 12.1 Decision errors {#decerr}
- 12.2 Significance level
- 12.3 Two-sided hypotheses {#two-sided-tests}
- _12.4 Controlling the Type 1 error rate_
- 12.5 Power
- 12.6 Statistical significance vs. practical importance
- 12.7 Chapter review {#chp12-review}

### 13. Applications: Foundations  {#foundations-applications}



## Part 4: Inference for categorical data

### 14. Inference for a single proportion {#inference-one-prop}

These sections are quite different from [IMS Ch. 16](https://openintro-ims.netlify.app/inference-one-prop.html); may want to revise in future.

- 14.1 Simulation-based test for $H_0: \pi = \pi_0$ (Note: IMS does a "parametric bootstrap test" and doesn't cover a bootstrap CI) {#one-prop-null-boot}
	* Steps 1 and 2: Hypotheses and test statistic {.unnumbered}
	* Steps 3 and 4: Null distribution and p-value {.unnumbered}
	* Step 5: Conclusion {.unnumbered}
- 14.2 Bootstrap confidence interval for $\pi$ {#boot-ci-prop}
- 14.3 Theory-based inferential methods for $\pi$ {#theory-prop}
	* 14.3.1 Evaluating the two conditions required for modeling $\hat{p}$ using theory-based methods
	* 14.3.2 Hypothesis test for $H_0: \pi = \pi_0$ {#payday-lenders}
	* 14.3.3 Confidence interval for $\pi$
		- $z^{\star}$ and the confidence level {.unnumbered}
		- Using R to find $z^{\star}$ {.unnumbered}
	* 14.3.4 Violating conditions
- 14.4 Chapter review {#chp14-review}

### 15. Inference for comparing two proportions {#inference-two-props}

These sections are quite different from [IMS Ch. 17](https://openintro-ims.netlify.app/inference-two-props.html); may want to revise in future.


- 15.1 Randomization test for $H_0: \pi_1 - \pi_2 = 0$ {#two-prop-errors}
	* 15.1.1 Case study: Sex discrimination revisited {#caseStudySexDiscrimination-revisited} - need to revise
		- Steps 1 and 2: Hypotheses and test statistic {.unnumbered}
		- Steps 3 and 4: Null distribution and p-value {.unnumbered}
		- Step 5: Conclusion {.unnumbered}
	* 15.1.2 Case study: CPR and blood thinner {#cpr}
		- Steps 1 and 2: Hypotheses and test statistic {.unnumbered}
		- Steps 3 and 4: Null distribution and p-value {.unnumbered}
		- Step 5: Conclusion {.unnumbered}
	* 15.1.3 Case study: Opportunity cost {#caseStudyOpportunityCost}
		- Steps 1 and 2: Hypotheses and test statistic {.unnumbered}
		- Steps 3 and 4: Null distribution and p-value {.unnumbered}
		- Step 5: Conclusion {.unnumbered}
	* 15.1.4 Case study: Malaria vaccine {#caseStudyMalaria}
		- Steps 1 and 2: Hypotheses and test statistic {.unnumbered}
		- Steps 3 and 4: Null distribution and p-value {.unnumbered}
		- Step 5: Conclusion {.unnumbered}
- 15.2 Bootstrap confidence interval for $\pi_1 - \pi_2$ {#two-prop-boot-ci}
	* 15.2.1 Observed data
	* 15.2.2 Variability of the statistic
	* 15.2.3 What does 95% mean?
- 15.3 Theory-based inferential methods for $\pi_1 - \pi_2$ {#math-2prop}
	* 15.3.1 Evaluating the two conditions required for modeling $\pi_1 - \pi_2$ using theory-based methods
	* 15.3.2 Confidence interval for $\pi_1 - \pi_2$
	* 15.3.3 Hypothesis test for $H_0: \pi_1 - \pi_2 = 0$
- 15.4 Chapter review {#chp15-review} - Additional section after Summary subsection:
	* Summary of z-procedures


### 16. Applications: Infer categorical {#inference-categ-applications}

## Part 5: Inference for quantitative data

### 17. Inference for a single mean

- 17.1 Bootstrap confidence interval for $\mu$
	* 17.1.1 Observed data
	* 17.1.2 Variability of the statistic
	* 17.1.3 Bootstrap percentile confidence interval for $\sigma$ (special topic)
	* 17.1.4 Bootstrapping is not a solution to small sample sizes!
- 17.2 Shifted bootstrap test for $H_0: \mu = \mu_0$ {#one-mean-null-boot}
	* 17.2.1 Observed data
	* 17.2.2 Shifted bootstrapped null distribution
- 17.3 Theory-based inferential methods for $\mu$ {#one-mean-math}
	* 17.3.1 Evaluating the two conditions required for modeling $\bar{x}$ using theory-based methods
	* 17.3.2 Introducing the $t$-distribution
	* 17.3.3 One sample $t$-confidence intervals
		- Observed data
	* 17.3.4 One sample $t$-tests
- 17.4 Chapter review {#chp17-review}

### 18. Inference for comparing paired means {#inference-paired-means}

- 18.1 Shifted bootstrap test for $H_0: \mu_d = 0$
	* 18.1.1 Observed data
	* 18.1.2 Variability of the statistic
	* 18.1.3 Observed statistic vs. null value
- 18.2 Bootstrap confidence interval for $\mu_d$
	* 18.2.1 Observed data
	* 18.2.2 Variability of the statistic
- 18.3 Theory-based inferential methods for $\mu_d$ {#paired-mean-math}
	* 18.3.1 Observed data
	* 18.3.2 Variability of the statistic
	* 18.3.3 Observed statistic vs. null statistics
- 18.4 Chapter review {#chp18-review}

### 19. Inference for comparing two independent means {#inference-two-means}

- 19.1 Randomization test for $H_0: \mu_1 - \mu_2 = 0$ {#rand2mean}
	* 19.1.1 Observed data
	* 19.1.2 Variability of the statistic
	* 19.1.3 Observed statistic vs. null value
- 19.2 Bootstrap confidence interval for $\mu_1 - \mu_2$ {#boot-ci-diff-means}
	* 19.2.1 Observed data
	* 19.2.2 Variability of the statistic
- 19.3 Theory-based inferential methods for $\mu_1 - \mu_2$ {#math2samp}
	* 19.3.1 $t$-test for $\mu_1 - \mu_2$
		- Observed data
		- Variability of the statistic
		- Observed statistic vs. null value
	* 19.3.3 $t$ confidence interval for $\mu_1 - \mu_2$
- 19.4 Chapter review {#chp19-review} - Additional section after Summary subsection:
	* Summary of t-procedures


### 20. Applications: Infer quantitative {#inference-num-applications}

## Part 6: Inference for regression

### 21. Inference for correlation and slope {#inference-reg}

- 21.1 Case study: Sandwich store
	* 21.1.1 Observed data
	* 21.1.2 Variability in the statistic
- 21.2 Randomization test for $H_0: \beta_1= 0$ {#randslope}
	* 21.2.1 Observed data
	* 21.2.2 Variability of the statistic
	* 21.2.3 Observed statistic vs. null value
- 21.3 Bootstrap confidence interval for $\beta_1$ {#bootbeta1}
	* 21.3.1 Observed data
	* 21.3.2 Variability of the statistic
- 21.4 Theory-based inferential methods for $\beta_1$ {#mathslope}
	* 21.4.1 Case study: Midterm elections and unemployment
	* 21.4.2 Understanding regression output from software
	* 21.4.3 Intuition vs. formal inference
	* 21.4.4 Theory-based confidence interval for a regression coefficient
- 21.5 Checking regression model conditions {#tech-cond-linmod}
		- What are the technical conditions?
		- Why do we need technical conditions?
	* 21.5.1 **L**inearity
	* 21.5.2 **I**ndependence
	* 21.5.3 **N**ormality
	* 21.5.4 **E**qual variability
- 22.5 Chapter review {#chp21-review}

### 22. Applications: Infer regression {#inference-reg-applications}

## Part 7: Probability

Moved from old categorical EDA chapter:

### 23. Probability with tables {#probability}

- 23.1 Defining probability
- 23.2 Finding probabilities with tables
- 23.3 Probability notation
- 23.4 Diagnostic testing
	* 23.4.1 The case of Baby Jeff
- 23.5 Chapter review {#chp23-review}


# TODO

- Move all images into common "images" folder and change relative links throughout text
- Add references to all images, data sets, R packages, studies, etc and inline text and to .bib file
- Rename #references to chapter/section titles; currently just commenting out the old ones; and make sure all links to sections are working
- Change data set to dataset?
- Replace figures pval-continuum in Chapter 9 (p-value continuum) with a scale from 0 to 1.
- Change my "onebox" css to "important", and change my "important" to something else

