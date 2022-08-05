# Montana State Introductory Statistics with R Extended Outline: Fall 2022

## Notes

- Italicized sections are new (to be modeled off of IMS); non-italicized sections are the same from previous version
- The "Applications: X" chapters will be the chapters where we teach students how to use R and catstats for the content covered in that part of the book.
- Each non-"Applications: X" chapter ends with a "Chapter review" containing the following _unnumbered_ subsections:
	* Summary (summary paragraph)
	* Terms (automatically generated - same blurb ahead of terms for all chapters)
	* Key ideas (bulleted list of key ideas; no introductory paragraph)

# Outline

### Welcome

- Textbook overview
- STAT 216 Coursepack
- Statistical computing
- About the authors
- Acknowledgments
- Licensing

### Preliminaries: Getting started in RStudio

- Logging into the RStudio server
- Projects
- R script files
- Loading data
- Exporting files
- Home
- Troubleshooting
- Extra references

## Part 1: Introduction to data

### 1. Hello data

- 1.1 Case study: using stents to prevent strokes
- 1.2 Data basics
	* 1.2.1 Observations, variables, and data frames
	* 1.2.2 Types of variables
	* 1.2.3 Relationships between variables
	* 1.2.4 Explanatory and response variables
	* 1.2.5 Introducing observational studies and experiments
- 1.3 Chapter review

### 2. Study design

- 2.1 Sampling principles and strategies
	* 2.1.1 Populations and samples
	* _2.1.2 Parameters and statistics_
	* 2.1.3 Anecdotal evidence
	* 2.1.4 Sampling from a population
	* 2.1.5 Four sampling methods (special topic)
- 2.2 Observational studies
- 2.3 Experiments
	* 2.3.1 Principles of experimental design
	* 2.3.2 Reducing bias in human experiments
- 2.4 Scope of inference
- 2.5 Chapter review

### 3. Applications: Data


## Part 2: Exploratory data analysis

### 4. Exploring categorical data

- 4.1 Contingency tables and conditional proportions
	* 4.1.1 Row and column proportions
	* 4.1.2 Sample proportions and population proportions
- 4.2 Bar plots and mosaic plots
- 4.3 Why not pie charts?
- 4.4 Simpson's paradox
- 4.5 Chapter review


### 5. Exploring quantitative data

- 5.1 Scatterplots for paired data
- 5.2 Dot plots and the mean
- 5.3 Histograms and shape
- 5.4 Variance and standard deviation
- 5.5 Boxplots, quartiles, and the median
- 5.6 Describing and comparing quantitative distributions
- 5.7 Robust statistics
- 5.8 Transforming data (special topic)
- 5.9 Mapping data (special topic)
- 5.10 Chapter review


### 6. Correlation and regression

- 6.1 Fitting a line, residuals, and correlation
	* 6.1.1 Fitting a line to data
	* 6.1.2 Using linear regression to predict possum head lengths
	* 6.1.3 Residuals
	* 6.1.4 Describing linear relationships with correlation
- 6.2 Least squares regression
	* 6.2.1 Gift aid for freshman at Elmhurst College
	* 6.2.2 An objective measure for finding the best line
	* 6.2.3 Finding and interpreting the least squares line
	* 6.2.4 Extrapolation is treacherous
	* 6.2.5 Describing the strength of a fit
	* 6.2.6 Categorical predictors with two levels (special topic)
- 6.3 Outliers in linear regression
	* 6.3.1 Types of outliers
- 6.4 Chapter review
	* In addition to the three common subsections to chapter reviews (Summary, Terms, Key ideas), this chapter includes the following subsections after the Summary subsection: *Data visualization summary* (tree diagram to decide on appropriate visualization), *Summary measures*, *Notation summary*. (These used to be the chapter summary for the original "Exploratory data analysis" chapter - but that's now an entire "part".)
	

### 7. Multivariable models

- 7.1 Gapminder world
- 7.2 Simpson's paradox revisited
- 7.3 Multiple regression (special topic)
	* 7.3.1 Indicator and categorical predictors
	* 7.3.2 Many predictors in a model
- 7.4 Chapter review

### 8. Applications: Explore



## Part 3: Foundations of inference

### 9. Hypothesis testing with randomization

Model after [Chapter 11](https://openintro-ims.netlify.app/foundations-randomization.html) in IMS

- 9.1 Motivating example: Martian alphabet
	* _9.1.1 Observed data_
	* _9.1.2 Variability of the statistic_
	* _9.1.3 Observed statistic vs. null statistics_
- _9.2 Case study: Sex discriminatinon (modeled after [Section 11.1](https://openintro-ims.netlify.app/foundations-randomization.html#caseStudySexDiscrimination) of IMS - currently in our two-proportion section)_
	* _9.1.1 Observed data_
	* _9.1.2 Variability of the statistic_
	* _9.1.3 Observed statistic vs. null statistics_
- 9.3 Hypothesis testing
	* 9.3.1 The US court system
	* 9.3.2 p-value and statistical significance
- 9.4 Chapter review

### 10. Confidence intervals with bootstrapping

Model after [Chapter 12](https://openintro-ims.netlify.app/foundations-bootstrapping.html)
 in IMS

- 10.1 _Case study: Medical consultant_ (model after [Section 12.1](https://openintro-ims.netlify.app/foundations-bootstrapping.html#case-study-med-consult) of IMS: )
	* _10.2.1 Observed data_
	* _10.2.2 Variability of the statistic_
- 10.3 Confidence intervals
	* _Plausible range of values for the population parameter_
	* _Bootstrap confidence interval_
- 10.4 Chapter review


### 11. Inference with mathematical models

- _11.1 Central Limit Theorem_ (take from current "Variability in a statistic" section in "Foundations of inference" subsection of categorical inference)
- 11.2 Normal distributions
	* 11.2.1 Normal distribution model
	* 11.2.2 Standardizing with Z-scores
	* 11.2.3 Normal probability calculations
	* 11.2.4 Normal probability examples
	* 11.2.5 68-95-99.7 rule
- _11.3 Quantifying the variability of a statistic_ (model after [Section 13.3](https://openintro-ims.netlify.app/foundations-mathematical.html#quantifying-the-variability-of-a-statistic) of IMS)
	* _11.3.1 68-95-99.7 rule revisited_
	* _11.3.2 Standard error_
	* _11.3.3 Margin of error_
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
- 11.6 Chapter review

### 12. Errors, power, and practical importance

Merge our material with [Chapter 14](https://openintro-ims.netlify.app/decerr.html) of IMS

- 12.1 Decision errors
- _12.2 Significance level_
- 12.3 Two-sided hypotheses
- 12.4 Controlling the Type I error rate
- 12.5 Power
- 12.6 Statistical significance vs. practical importance
- 12.7 Chapter review

### 13. Applications: Foundations



## Part 4: Inference for categorical data

### 14. Inference for a single proportion

- 14.1 Simulation-based test for $H_0: \pi = \pi_0$ (Note: IMS does a "parametric bootstrap test" and doesn't cover a bootstrap CI)
- 14.2 Bootstrap confidence interval for $\pi$
- 14.3 Theory-based inferential methods for $\pi$
- 14.4 Chapter review

### 15. Inference for comparing two proportions

- 15.1 Randomization test for $H_0: \pi_1 - \pi_2 = 0$
- 15.2 Bootstrap confidence interval for $\pi_1 - \pi_2$
- 15.3 Theory-based inferential methods for $\pi_1 - \pi_2$
- 15.4 Chapter review
	* Summary of z-procedures


### 16. Applications: Infer categorical

## Part 5: Inference for quantitative data

### 17. Inference for a single mean

- 17.1 Bootstrap confidence interval for $\mu$
- 17.2 Shifted bootstrap test for $H_0: \mu = \mu_0$
- 17.3 Theory-based inferential methods for $\mu$
- 17.4 Chapter review

### 18. Inference for comparing paired means

- 18.1 Shifted bootstrap test for $H_0: \mu_d = 0$
- 18.2 Bootstrap confidence interval for $\mu_d$
- 18.3 Theory-based inferential methods for $\mu_d$
- 18.4 Chapter review

### 19. Inference for comparing two independent means

- 19.1 Randomization test for $H_0: \mu_1 - \mu_2 = 0$
- 19.2 Bootstrap confidence interval for $\mu_1 - \mu_2$
- 19.3 Theory-based inferential methods for $\mu_1 - \mu_2$
- 19.4 Chapter review
	* Summary of t-procedures


### 20. Applications: Infer quantitative

## Part 6: Inference for regression

### 21. Inference for correlation and slope

- 21.1 Randomization test for $H_0: \beta_1 = 0$
- 22.2 Bootstrap confidence interval for $\beta_1$
- 22.3 Theory-based inferential methods for $\beta_1$
- 22.4 Checking regression model conditions
- 22.5 Chapter review

### 22. Applications: Infer regression

## Part 7: Probability

Moved from old categorical EDA chapter:

### 23. Probability with tables

- 23.1 Defining probability
- 23.2 Finding probabilities with tables
- 23.3 Probability notation
- 23.4 Diagnostic testing
	* 23.4.1 The case of Baby Jeff
- 23.5 Chapter review


# TODO

- Move all images into common "images" folder and change relative links throughout text
- Add references to all images, data sets, R packages, studies, etc and inline text and to .bib file
- Rename #references to chapter/section titles; currently just commenting out the old ones; and make sure all links to sections are working

- Change `R` to R in coursepack
- Change data set to dataset?
- Replace figures pval-continuum in Chapter 9 (p-value continuum) with a scale from 0 to 1.
- Change my "onebox" css to "important", and change my "important" to something else

