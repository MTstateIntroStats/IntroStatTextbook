# Multivariable models {#mult-reg}

::: {.underconstruction}
This chapter is currently under construction.
:::

::: {.chapterintro}
The principles of simple linear regression lay the foundation for more sophisticated regression models used in a wide range of challenging settings. 
In this chapter, we explore the idea of "multivariable thinking" -- investigating how multiple variables interact with a response variable and with each other -- through a few examples. 
Multiple regression, which introduces the possibility of more than one predictor in a linear model, and logistic regression, a technique for predicting categorical outcomes with two levels, are presented as special topics not covered in this course.
:::

## Gapminder world

[Gapminder](https://www.gapminder.org/) is a "fact tank" that uses publicly available world data to produce data visualizations and teaching resources on global development. We will use an excerpt of their data to explore relationships among world health metrics across countries and regions between the years 1952 and 2007. 

\BeginKnitrBlock{data}<div class="data">The `gapminder` data can be found in the [gapminder](https://github.com/jennybc/gapminder) package.</div>\EndKnitrBlock{data}

First, let's look at the relationships between Gross Domestic Product (GDP) per capita (a measure of the wealth of a country), Life Expectancy (in years), Population, and Region in the year 2000 Explore individual countries by hovering over the points in Figure \@ref(fig:gapminder-1).

<!-- Example from: https://holtzy.github.io/Pimp-my-rmd/ - interactive graphic! -->
<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-86dc17bbd8304768193a" style="width:100%;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-86dc17bbd8304768193a">{"x":{"data":[{"visible":false,"showlegend":false,"xaxis":null,"yaxis":null,"hoverinfo":"text","frame":null}],"layout":{"margin":{"t":27.8303350387853,"r":7.30593607305936,"b":30.0951752214337,"l":25.5707762557078},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.05,1.05],"tickmode":"array","ticktext":[],"tickvals":[],"categoryorder":"array","categoryarray":[],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"GDP per Capita (USD)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.05,1.05],"tickmode":"array","ticktext":[],"tickvals":[],"categoryorder":"array","categoryarray":[],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"Life Expectancy (years)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(51,51,51,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"3b2075803a89":{"x":{},"y":{},"size":{},"colour":{},"type":"scatter"}},"cur_data":"3b2075803a89","visdat":{"3b2075803a89":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:gapminder-1)Scatterplot displaying the relationship between four variables in the year 2000: GDP per capita (x-axis), Life Expectancy (y-axis), Population (size), and Region (color). What does each dot represent?^[Each observational unit is a single country.]</p>
</div>

How does this pattern compare to what was happening in 1960 (see Figure \@ref(fig:gapminder-2))?

<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-f50f63c007c2286b17b9" style="width:100%;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-f50f63c007c2286b17b9">{"x":{"data":[{"visible":false,"showlegend":false,"xaxis":null,"yaxis":null,"hoverinfo":"text","frame":null}],"layout":{"margin":{"t":45.3645816141277,"r":7.30593607305936,"b":30.0951752214337,"l":25.5707762557078},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"World Health Indicators in the Year 2000","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.05,1.05],"tickmode":"array","ticktext":[],"tickvals":[],"categoryorder":"array","categoryarray":[],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"GDP per Capita (USD)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.05,1.05],"tickmode":"array","ticktext":[],"tickvals":[],"categoryorder":"array","categoryarray":[],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"Life Expectancy (years)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(51,51,51,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"3b2030e559cf":{"x":{},"y":{},"size":{},"colour":{},"type":"scatter"}},"cur_data":"3b2030e559cf","visdat":{"3b2030e559cf":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:gapminder-2)Scatterplot displaying the relationship between four variables in the year 1960: GDP per capita (x-axis), Life Expectancy (y-axis), Population (size), and Region (color).</p>
</div>

We can visualize relationships among four variables in the plots above (the two quantitative variables on the x- and y-axes, and categorical variables as size or color), but how could we visualize what happens across time? Hans Rosling has the answer with dynamic visualization. Click on the image below to watch.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=Z8t4k0Q8e8Y
" target="_blank"><img src="http://img.youtube.com/vi/Z8t4k0Q8e8Y/0.jpg" 
alt="Hans Rosling 200 Years" width="240" height="180" border="10" /></a>

## Simpson's Paradox, revisited


## `R`: Multiple and logistic regression (special topic)

### Interactive R tutorials

Navigate the concepts you've learned in this chapter in R using the following self-paced tutorials. 
All you need is your browser to get started!

::: {.alltutorials}
[Tutorial 4: Multiple and logistic regression](https://openintrostat.github.io/ims-tutorials/04-multivariable-and-logistic-models/)
:::

::: {.singletutorial}
[Tutorial 4 - Lesson 1: Parallel slopes](https://openintro.shinyapps.io/ims-04-multivariable-and-logistic-models-01/)
:::

::: {.singletutorial}
[Tutorial 4 - Lesson 2: Evaluating and extending parallel slopes model](https://openintro.shinyapps.io/ims-04-multivariable-and-logistic-models-02/)
:::

::: {.singletutorial}
[Tutorial 4 - Lesson 3: Multiple regression](https://openintro.shinyapps.io/ims-04-multivariable-and-logistic-models-03/)
:::

::: {.singletutorial}
[Tutorial 4 - Lesson 4: Logistic regression](https://openintro.shinyapps.io/ims-04-multivariable-and-logistic-models-04/)
:::

::: {.singletutorial}
[Tutorial 4 - Lesson 5: Case study - Italian restaurants in NYC](https://openintro.shinyapps.io/ims-04-multivariable-and-logistic-models-05/)
:::

You can also access the full list of tutorials supporting this book [here](https://openintrostat.github.io/ims-tutorials/).

### R labs

Further apply the concepts you've learned in this chapter in R with computational labs that walk you through a data analysis case study.

::: {.singlelab}
[Multiple linear regression - Grading the professor](http://openintrostat.github.io/oilabs-tidy/09_multiple_regression/multiple_regression.html)
:::

::: {.alllabs}
[Full list of labs supporting OpenIntro::Introduction to Modern Statistics](http://openintrostat.github.io/oilabs-tidy/)
:::


<!-- ## Chapter 4 review {#chp4-review} -->

<!-- ### Terms -->

<!-- We introduced the following terms in the chapter.  -->
<!-- If you're not sure what some of these terms mean, we recommend you go back in the text and review their definitions. -->
<!-- We are purposefully presenting them in alphabetical order, instead of in order of appearance, so they will be a little more challenging to locate.  -->
<!-- However you should be able to easily spot them as **bolded text**. -->

<!-- ```{r eval = FALSE} -->
<!-- make_terms_table(terms_chp_4) -->
<!-- ``` -->

