# Multivariable models {#mult-reg}

::: {.chapterintro}
The principles of simple linear regression lay the foundation for more sophisticated regression models used in a wide range of challenging settings. 
In this chapter, we explore the idea of "multivariable thinking" -- investigating how multiple variables interact with a response variable and with each other -- through a few examples. 
Multiple regression, which introduces the possibility of more than one predictor in a linear model, and logistic regression, a technique for predicting categorical outcomes with two levels, are presented as special topics not covered in this course.
:::

## Gapminder world

[Gapminder](https://www.gapminder.org/) is a "fact tank" that uses publicly available world data to produce data visualizations and teaching resources on global development. We will use an excerpt of their data to explore relationships among world health metrics across countries and regions between the years 1952 and 2007. 

\BeginKnitrBlock{data}<div class="data">The `gapminder` data can be found in the [gapminder](https://github.com/jennybc/gapminder) package.</div>\EndKnitrBlock{data}

First, let's look at the relationship between Gross Domestic Product (GDP) per capita (a measure of the wealth of a country) and Life Expectancy (in years) in the year 2007 in Figure \@ref(fig:gdpPercap-lifeExp).

<div class="figure" style="text-align: center">
<img src="04-mult-reg_files/figure-html/gdpPercap-lifeExp-1.png" alt="Scatterplot displaying the relationship Life Expectancy and GDP per capita in the year 2007. Note that GDP per capita is plotted on the log scale. What does each dot represent?^[Each observational unit is a single country.]" width="100%" />
<p class="caption">(\#fig:gdpPercap-lifeExp)Scatterplot displaying the relationship Life Expectancy and GDP per capita in the year 2007. Note that GDP per capita is plotted on the log scale. What does each dot represent?^[Each observational unit is a single country.]</p>
</div>

As one might expect, there is a general positive trend between GDP and life expectancy. But does this trend hold across all regions? Let's explore in Figure \@ref(fig:gdpPercap-lifeExp-continent).
<div class="figure" style="text-align: center">
<img src="04-mult-reg_files/figure-html/gdpPercap-lifeExp-continent-1.png" alt="Scatterplot displaying the relationship Life Expectancy and GDP per capita by region in the year 2007. Note that GDP per capita is plotted on the log scale. Regression lines for each continent have been added." width="100%" />
<p class="caption">(\#fig:gdpPercap-lifeExp-continent)Scatterplot displaying the relationship Life Expectancy and GDP per capita by region in the year 2007. Note that GDP per capita is plotted on the log scale. Regression lines for each continent have been added.</p>
</div>


::: {.example}
Does the relationship between GDP per capita and life expectancy differ across regions of the world?

---

Yes. Looking at Figure \@ref(fig:gdpPercap-lifeExp-continent), the five regression lines have differing slopes, telling us that the estimated change in life expectancy for a given increase in GDP per capita differs across countries. In the Americas and Oceania, life expectancy seems to rise faster with GDP per capita than the other three regions. In this case, we say that GDP per capita **interacts** with continent in its relationship with life expectancy.
:::

::: {.onebox}
**Interaction between two explanatory variables.**

If the relationship between an explanatory variable $x$ and response variable $y$ changes for different levels of another variable $z$, then we say that $x$ and $z$ **interact** in their relationship with $y$.

If $x$ and $y$ are quantitative, and $z$ is categorical, as in Figure \@ref(fig:gdpPercap-lifeExp-continent) -- where $x$ = GDP per capita, $y$ = life expectancy, and $z$ = continent -- then if the different regression lines for each level of $z$ have **parallel slopes**, we say that $x$ and $z$ _do not_ interact. If the slopes are not parallel, then interaction exists between $x$ and $z$.
:::



::: {.guidedpractice}
So far, we've explored relationships between three variables, how could we visualize relationships between five variables?^[Each variable can be mapped to some "aesthetic" of the plot. Aesthetics include position on the x-axis, position on the y-axis, size, color, and shape. Since position and size are quantitative, they should be used for quantitative variables. Categorical variables should be mapped to color or shape, though we could also map them to position on the x-axis or y-axis if the axis lists categories rather than a number line.]
:::

Let's add another variable to our plot -- population. An **aesthetic** is a visual property of the objects in your plot. Each variable is mapped to an aesthetic. Some possible aesthetics and whether they should be used for quantitative or categorical variables are listed in Table \@ref(tab:aesthetics).



<table>
<caption>(\#tab:aesthetics)Examples of aesthetics and types of variables mapped to these aesthetics.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Aesthetic </th>
   <th style="text-align:left;"> Variable </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Position on the x-axis as a number line </td>
   <td style="text-align:left;"> Quantitative </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Position on the y-axis as a number line </td>
   <td style="text-align:left;"> Quantitative </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Position on the x-axis as categories </td>
   <td style="text-align:left;"> Categorical </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Position on the y-axis as categories </td>
   <td style="text-align:left;"> Categorical </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Size </td>
   <td style="text-align:left;"> Quantitative </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Color </td>
   <td style="text-align:left;"> Categorical </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shape </td>
   <td style="text-align:left;"> Categorical </td>
  </tr>
</tbody>
</table>

In Figure \@ref(fig:gapminder-1), quantitative variables GDP per capita, life expectancy, and population are mapped to aesthetics: position on the $x$-axis, position on the $y$-axis, and population, respectively. The categorical variable Region is mapped to color. Explore individual countries by hovering over the points.


<!-- TODO Someday - can't get Population legend to show up when using plotly -->

<!-- Example from: https://holtzy.github.io/Pimp-my-rmd/ - interactive graphic! -->
<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-86dc17bbd8304768193a" style="width:100%;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-86dc17bbd8304768193a">{"x":{"data":[{"x":[3.79402544509666,3.68099065562682,3.1587498285201,4.09933015629768,3.08530235219712,2.63353984732021,3.31007599301138,2.848814873635,3.23148583131337,2.99394204506796,2.44334414004637,3.56021253312911,3.18885823537455,3.31858116595608,3.74672610693845,4.08472243900371,2.80710831941093,2.83935583435696,4.12078722664154,2.87665060639063,3.1230701584329,2.9743524119827,2.76285235400399,3.16531831968284,3.19571467604724,2.61753222691212,4.08125724466051,3.01902074595738,2.88044194586588,3.0181100381011,3.25603221652431,4.03969130967891,3.58208328429303,2.91576148434958,3.68224081186337,2.79216530171644,3.30405457229069,3.88480230343241,2.93605531183875,3.20369500466057,3.23362351372365,2.93577962517273,2.96667714274902,3.96706370233863,3.41537321502711,3.65451158423759,3.04433674769752,2.94594592049266,3.85082524675123,3.02382022004224,3.10421784482941,2.67182915731664],"y":[72.301,42.731,56.728,50.728,52.295,49.58,50.43,44.741,50.651,65.152,46.462,55.322,48.328,54.791,71.338,51.579,58.04,52.947,56.735,59.448,60.022,56.007,46.388,54.11,42.592,45.678,73.952,59.443,48.303,54.467,64.164,72.801,71.164,42.082,52.906,56.867,46.859,76.442,46.242,65.528,63.062,42.568,48.159,49.339,58.556,39.613,52.517,58.42,73.923,51.542,42.384,43.487],"text":["Algeria<br />gdpPercap:  6223<br />lifeExp: 72.3<br />pop:   33333216<br />continent: Africa","Angola<br />gdpPercap:  4797<br />lifeExp: 42.7<br />pop:   12420476<br />continent: Africa","Benin<br />gdpPercap:  1441<br />lifeExp: 56.7<br />pop:    8078314<br />continent: Africa","Botswana<br />gdpPercap: 12570<br />lifeExp: 50.7<br />pop:    1639131<br />continent: Africa","Burkina Faso<br />gdpPercap:  1217<br />lifeExp: 52.3<br />pop:   14326203<br />continent: Africa","Burundi<br />gdpPercap:   430<br />lifeExp: 49.6<br />pop:    8390505<br />continent: Africa","Cameroon<br />gdpPercap:  2042<br />lifeExp: 50.4<br />pop:   17696293<br />continent: Africa","Central African Republic<br />gdpPercap:   706<br />lifeExp: 44.7<br />pop:    4369038<br />continent: Africa","Chad<br />gdpPercap:  1704<br />lifeExp: 50.7<br />pop:   10238807<br />continent: Africa","Comoros<br />gdpPercap:   986<br />lifeExp: 65.2<br />pop:     710960<br />continent: Africa","Congo, Dem. Rep.<br />gdpPercap:   278<br />lifeExp: 46.5<br />pop:   64606759<br />continent: Africa","Congo, Rep.<br />gdpPercap:  3633<br />lifeExp: 55.3<br />pop:    3800610<br />continent: Africa","Cote d'Ivoire<br />gdpPercap:  1545<br />lifeExp: 48.3<br />pop:   18013409<br />continent: Africa","Djibouti<br />gdpPercap:  2082<br />lifeExp: 54.8<br />pop:     496374<br />continent: Africa","Egypt<br />gdpPercap:  5581<br />lifeExp: 71.3<br />pop:   80264543<br />continent: Africa","Equatorial Guinea<br />gdpPercap: 12154<br />lifeExp: 51.6<br />pop:     551201<br />continent: Africa","Eritrea<br />gdpPercap:   641<br />lifeExp: 58.0<br />pop:    4906585<br />continent: Africa","Ethiopia<br />gdpPercap:   691<br />lifeExp: 52.9<br />pop:   76511887<br />continent: Africa","Gabon<br />gdpPercap: 13206<br />lifeExp: 56.7<br />pop:    1454867<br />continent: Africa","Gambia<br />gdpPercap:   753<br />lifeExp: 59.4<br />pop:    1688359<br />continent: Africa","Ghana<br />gdpPercap:  1328<br />lifeExp: 60.0<br />pop:   22873338<br />continent: Africa","Guinea<br />gdpPercap:   943<br />lifeExp: 56.0<br />pop:    9947814<br />continent: Africa","Guinea-Bissau<br />gdpPercap:   579<br />lifeExp: 46.4<br />pop:    1472041<br />continent: Africa","Kenya<br />gdpPercap:  1463<br />lifeExp: 54.1<br />pop:   35610177<br />continent: Africa","Lesotho<br />gdpPercap:  1569<br />lifeExp: 42.6<br />pop:    2012649<br />continent: Africa","Liberia<br />gdpPercap:   415<br />lifeExp: 45.7<br />pop:    3193942<br />continent: Africa","Libya<br />gdpPercap: 12057<br />lifeExp: 74.0<br />pop:    6036914<br />continent: Africa","Madagascar<br />gdpPercap:  1045<br />lifeExp: 59.4<br />pop:   19167654<br />continent: Africa","Malawi<br />gdpPercap:   759<br />lifeExp: 48.3<br />pop:   13327079<br />continent: Africa","Mali<br />gdpPercap:  1043<br />lifeExp: 54.5<br />pop:   12031795<br />continent: Africa","Mauritania<br />gdpPercap:  1803<br />lifeExp: 64.2<br />pop:    3270065<br />continent: Africa","Mauritius<br />gdpPercap: 10957<br />lifeExp: 72.8<br />pop:    1250882<br />continent: Africa","Morocco<br />gdpPercap:  3820<br />lifeExp: 71.2<br />pop:   33757175<br />continent: Africa","Mozambique<br />gdpPercap:   824<br />lifeExp: 42.1<br />pop:   19951656<br />continent: Africa","Namibia<br />gdpPercap:  4811<br />lifeExp: 52.9<br />pop:    2055080<br />continent: Africa","Niger<br />gdpPercap:   620<br />lifeExp: 56.9<br />pop:   12894865<br />continent: Africa","Nigeria<br />gdpPercap:  2014<br />lifeExp: 46.9<br />pop:  135031164<br />continent: Africa","Reunion<br />gdpPercap:  7670<br />lifeExp: 76.4<br />pop:     798094<br />continent: Africa","Rwanda<br />gdpPercap:   863<br />lifeExp: 46.2<br />pop:    8860588<br />continent: Africa","Sao Tome and Principe<br />gdpPercap:  1598<br />lifeExp: 65.5<br />pop:     199579<br />continent: Africa","Senegal<br />gdpPercap:  1712<br />lifeExp: 63.1<br />pop:   12267493<br />continent: Africa","Sierra Leone<br />gdpPercap:   863<br />lifeExp: 42.6<br />pop:    6144562<br />continent: Africa","Somalia<br />gdpPercap:   926<br />lifeExp: 48.2<br />pop:    9118773<br />continent: Africa","South Africa<br />gdpPercap:  9270<br />lifeExp: 49.3<br />pop:   43997828<br />continent: Africa","Sudan<br />gdpPercap:  2602<br />lifeExp: 58.6<br />pop:   42292929<br />continent: Africa","Swaziland<br />gdpPercap:  4513<br />lifeExp: 39.6<br />pop:    1133066<br />continent: Africa","Tanzania<br />gdpPercap:  1107<br />lifeExp: 52.5<br />pop:   38139640<br />continent: Africa","Togo<br />gdpPercap:   883<br />lifeExp: 58.4<br />pop:    5701579<br />continent: Africa","Tunisia<br />gdpPercap:  7093<br />lifeExp: 73.9<br />pop:   10276158<br />continent: Africa","Uganda<br />gdpPercap:  1056<br />lifeExp: 51.5<br />pop:   29170398<br />continent: Africa","Zambia<br />gdpPercap:  1271<br />lifeExp: 42.4<br />pop:   11746035<br />continent: Africa","Zimbabwe<br />gdpPercap:   470<br />lifeExp: 43.5<br />pop:   12311143<br />continent: Africa"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","opacity":1,"size":[6.77527173254923,5.598900411863,5.24035330707835,4.40395768399738,5.7356199392208,5.26901439581437,5.9564773609874,4.8422259478741,5.42852631166044,4.15169850163956,7.9562662998771,4.76713328307226,5.97611663817011,4.06305719383881,8.43636871732964,4.08813627550005,4.90865391372741,8.32592567062337,4.36262596871136,4.41454467512776,6.25770233060098,5.40445197132612,4.3666011970112,6.87649613589243,4.480300710223,4.68010775450673,5.03693920169262,6.0461636385333,5.66517797748393,5.5697344023561,4.69148323166173,4.31315004312066,6.79437672410524,6.09253246174489,4.48845333089755,5.6338762963756,9.82271393327331,4.18215900239245,5.3111594952501,3.77952755905512,5.58747695964146,5.04848038390226,5.33382085391144,7.22380829377829,7.1561065468969,4.282361176813,6.98520027409899,5.00028803920838,5.43159101796171,6.580769078434,5.54798462578679,5.59074371141117],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(248,118,109,1)"}},"hoveron":"points","name":"Africa","legendgroup":"Africa","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.10650977201769,3.58230625931688,3.95740617340857,4.56013669242519,4.11963981438709,3.84550611104731,3.98430499758718,3.95173097080165,3.77998406330737,3.83716291957619,3.75802981175127,3.71483669984604,3.0797733480287,3.55002410662006,3.86456330372846,4.07836889751077,3.43922544380543,3.99163295350919,3.6204315729333,3.86975405900188,4.28620284789525,4.25547776303394,4.632979883279,4.02577526370184,4.05750656798335],"y":[75.32,65.554,72.39,80.653,78.553,72.889,78.782,78.273,72.235,74.994,71.878,70.259,60.916,70.198,72.567,76.195,72.899,75.537,71.752,71.421,78.746,69.819,78.242,76.384,73.747],"text":["Argentina<br />gdpPercap: 12779<br />lifeExp: 75.3<br />pop:   40301927<br />continent: Americas","Bolivia<br />gdpPercap:  3822<br />lifeExp: 65.6<br />pop:    9119152<br />continent: Americas","Brazil<br />gdpPercap:  9066<br />lifeExp: 72.4<br />pop:  190010647<br />continent: Americas","Canada<br />gdpPercap: 36319<br />lifeExp: 80.7<br />pop:   33390141<br />continent: Americas","Chile<br />gdpPercap: 13172<br />lifeExp: 78.6<br />pop:   16284741<br />continent: Americas","Colombia<br />gdpPercap:  7007<br />lifeExp: 72.9<br />pop:   44227550<br />continent: Americas","Costa Rica<br />gdpPercap:  9645<br />lifeExp: 78.8<br />pop:    4133884<br />continent: Americas","Cuba<br />gdpPercap:  8948<br />lifeExp: 78.3<br />pop:   11416987<br />continent: Americas","Dominican Republic<br />gdpPercap:  6025<br />lifeExp: 72.2<br />pop:    9319622<br />continent: Americas","Ecuador<br />gdpPercap:  6873<br />lifeExp: 75.0<br />pop:   13755680<br />continent: Americas","El Salvador<br />gdpPercap:  5728<br />lifeExp: 71.9<br />pop:    6939688<br />continent: Americas","Guatemala<br />gdpPercap:  5186<br />lifeExp: 70.3<br />pop:   12572928<br />continent: Americas","Haiti<br />gdpPercap:  1202<br />lifeExp: 60.9<br />pop:    8502814<br />continent: Americas","Honduras<br />gdpPercap:  3548<br />lifeExp: 70.2<br />pop:    7483763<br />continent: Americas","Jamaica<br />gdpPercap:  7321<br />lifeExp: 72.6<br />pop:    2780132<br />continent: Americas","Mexico<br />gdpPercap: 11978<br />lifeExp: 76.2<br />pop:  108700891<br />continent: Americas","Nicaragua<br />gdpPercap:  2749<br />lifeExp: 72.9<br />pop:    5675356<br />continent: Americas","Panama<br />gdpPercap:  9809<br />lifeExp: 75.5<br />pop:    3242173<br />continent: Americas","Paraguay<br />gdpPercap:  4173<br />lifeExp: 71.8<br />pop:    6667147<br />continent: Americas","Peru<br />gdpPercap:  7409<br />lifeExp: 71.4<br />pop:   28674757<br />continent: Americas","Puerto Rico<br />gdpPercap: 19329<br />lifeExp: 78.7<br />pop:    3942491<br />continent: Americas","Trinidad and Tobago<br />gdpPercap: 18009<br />lifeExp: 69.8<br />pop:    1056608<br />continent: Americas","United States<br />gdpPercap: 42952<br />lifeExp: 78.2<br />pop:  301139947<br />continent: Americas","Uruguay<br />gdpPercap: 10611<br />lifeExp: 76.4<br />pop:    3447496<br />continent: Americas","Venezuela<br />gdpPercap: 11416<br />lifeExp: 73.7<br />pop:   26084662<br />continent: Americas"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(163,165,0,1)","opacity":1,"size":[7.07528369289545,5.33385387656466,10.9497220287062,6.77784403625228,5.86681801798997,7.23282911414924,4.81182340745332,5.52260397354913,5.35122378867242,5.69571313317988,5.1306777542305,5.61021330347734,5.27919109958551,5.18415329737334,4.6155666029278,9.20063061292984,4.99737544049698,4.68733172329479,5.10307852744492,6.55670348636785,4.78640121163658,4.26132881438327,12.807919245623,4.71746231550028,6.42738713411734],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(163,165,0,1)"}},"hoveron":"points","name":"Americas","legendgroup":"Americas","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.98881764549129,4.47415867018597,3.143406361057,3.23395473727517,3.6954041667466,4.59906367268864,3.38955773121288,3.54908318988216,4.06467188236304,3.65041068311967,4.40693643553008,4.50045697098462,3.65508665949928,3.20223362703668,4.3682522837381,4.67492531406996,4.01957563822304,4.09522710701315,3.49076900592376,2.97497199429807,3.03796794384465,4.34862010618943,3.41596567540354,3.50385616482709,4.33555481758265,4.67341887079622,3.59880094359832,3.62164856315343,4.45815837772449,3.87264545733796,3.38767031916547,3.4807755960326,3.35808147396803],"y":[43.828,75.635,64.062,59.723,72.961,82.208,64.698,70.65,70.964,59.545,80.745,82.603,72.535,67.297,78.623,77.588,71.993,74.241,66.803,62.069,63.785,75.64,65.483,71.688,72.777,79.972,72.396,74.143,78.4,70.616,74.249,73.422,62.698],"text":["Afghanistan<br />gdpPercap:   975<br />lifeExp: 43.8<br />pop:   31889923<br />continent: Asia","Bahrain<br />gdpPercap: 29796<br />lifeExp: 75.6<br />pop:     708573<br />continent: Asia","Bangladesh<br />gdpPercap:  1391<br />lifeExp: 64.1<br />pop:  150448339<br />continent: Asia","Cambodia<br />gdpPercap:  1714<br />lifeExp: 59.7<br />pop:   14131858<br />continent: Asia","China<br />gdpPercap:  4959<br />lifeExp: 73.0<br />pop: 1318683096<br />continent: Asia","Hong Kong, China<br />gdpPercap: 39725<br />lifeExp: 82.2<br />pop:    6980412<br />continent: Asia","India<br />gdpPercap:  2452<br />lifeExp: 64.7<br />pop: 1110396331<br />continent: Asia","Indonesia<br />gdpPercap:  3541<br />lifeExp: 70.7<br />pop:  223547000<br />continent: Asia","Iran<br />gdpPercap: 11606<br />lifeExp: 71.0<br />pop:   69453570<br />continent: Asia","Iraq<br />gdpPercap:  4471<br />lifeExp: 59.5<br />pop:   27499638<br />continent: Asia","Israel<br />gdpPercap: 25523<br />lifeExp: 80.7<br />pop:    6426679<br />continent: Asia","Japan<br />gdpPercap: 31656<br />lifeExp: 82.6<br />pop:  127467972<br />continent: Asia","Jordan<br />gdpPercap:  4519<br />lifeExp: 72.5<br />pop:    6053193<br />continent: Asia","Korea, Dem. Rep.<br />gdpPercap:  1593<br />lifeExp: 67.3<br />pop:   23301725<br />continent: Asia","Korea, Rep.<br />gdpPercap: 23348<br />lifeExp: 78.6<br />pop:   49044790<br />continent: Asia","Kuwait<br />gdpPercap: 47307<br />lifeExp: 77.6<br />pop:    2505559<br />continent: Asia","Lebanon<br />gdpPercap: 10461<br />lifeExp: 72.0<br />pop:    3921278<br />continent: Asia","Malaysia<br />gdpPercap: 12452<br />lifeExp: 74.2<br />pop:   24821286<br />continent: Asia","Mongolia<br />gdpPercap:  3096<br />lifeExp: 66.8<br />pop:    2874127<br />continent: Asia","Myanmar<br />gdpPercap:   944<br />lifeExp: 62.1<br />pop:   47761980<br />continent: Asia","Nepal<br />gdpPercap:  1091<br />lifeExp: 63.8<br />pop:   28901790<br />continent: Asia","Oman<br />gdpPercap: 22316<br />lifeExp: 75.6<br />pop:    3204897<br />continent: Asia","Pakistan<br />gdpPercap:  2606<br />lifeExp: 65.5<br />pop:  169270617<br />continent: Asia","Philippines<br />gdpPercap:  3190<br />lifeExp: 71.7<br />pop:   91077287<br />continent: Asia","Saudi Arabia<br />gdpPercap: 21655<br />lifeExp: 72.8<br />pop:   27601038<br />continent: Asia","Singapore<br />gdpPercap: 47143<br />lifeExp: 80.0<br />pop:    4553009<br />continent: Asia","Sri Lanka<br />gdpPercap:  3970<br />lifeExp: 72.4<br />pop:   20378239<br />continent: Asia","Syria<br />gdpPercap:  4185<br />lifeExp: 74.1<br />pop:   19314747<br />continent: Asia","Taiwan<br />gdpPercap: 28718<br />lifeExp: 78.4<br />pop:   23174294<br />continent: Asia","Thailand<br />gdpPercap:  7458<br />lifeExp: 70.6<br />pop:   65068149<br />continent: Asia","Vietnam<br />gdpPercap:  2442<br />lifeExp: 74.2<br />pop:   85262356<br />continent: Asia","West Bank and Gaza<br />gdpPercap:  3025<br />lifeExp: 73.4<br />pop:    4018332<br />continent: Asia","Yemen, Rep.<br />gdpPercap:  2281<br />lifeExp: 62.7<br />pop:   22211743<br />continent: Asia"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,191,125,1)","opacity":1,"size":[6.70929835135528,4.1508288847182,10.1588656081799,5.72211801075065,22.6771653543307,5.13475345805415,21.1203680953071,11.5573968303758,8.11057131553749,6.49879524068774,5.07824026167466,9.65077587363648,5.03869129857133,6.28100350114513,7.4168446506104,4.56983839481089,4.78354392302204,6.36196165910748,4.63065651672448,7.36876387589759,6.56775273775666,4.68175365529605,10.5466615830696,8.74086596862592,6.50384061768477,4.86541785279541,6.11737587407916,6.05493528307165,6.27409491409121,7.97119993399054,8.57951329437571,4.79655097614072,6.22127948111281],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,191,125,1)"}},"hoveron":"points","name":"Asia","legendgroup":"Asia","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[3.77356920876217,4.55782580062218,4.52753459151331,3.87194045947979,4.02860349094832,4.16492428251317,4.35856884462783,4.54750911081685,4.52123074598147,4.48387269225076,4.50745611553652,4.43993889119905,4.25548825822109,4.55847803563392,4.60933819969144,4.45590597950278,3.96632461957789,4.56582342810493,4.69335042800253,4.18723649435127,4.31195820191596,4.03376444688129,3.990628940935,4.27133768016358,4.41108505321789,4.4597100052953,4.52968372605252,4.57410560181062,3.92728187211911,4.52118074293136],"y":[76.423,79.829,79.441,74.852,73.005,75.748,76.486,78.332,79.313,80.657,79.406,79.483,73.338,81.757,78.885,80.546,74.543,79.762,80.196,75.563,78.098,72.476,74.002,74.663,77.926,80.941,80.884,81.701,71.777,79.425],"text":["Albania<br />gdpPercap:  5937<br />lifeExp: 76.4<br />pop:    3600523<br />continent: Europe","Austria<br />gdpPercap: 36126<br />lifeExp: 79.8<br />pop:    8199783<br />continent: Europe","Belgium<br />gdpPercap: 33693<br />lifeExp: 79.4<br />pop:   10392226<br />continent: Europe","Bosnia and Herzegovina<br />gdpPercap:  7446<br />lifeExp: 74.9<br />pop:    4552198<br />continent: Europe","Bulgaria<br />gdpPercap: 10681<br />lifeExp: 73.0<br />pop:    7322858<br />continent: Europe","Croatia<br />gdpPercap: 14619<br />lifeExp: 75.7<br />pop:    4493312<br />continent: Europe","Czech Republic<br />gdpPercap: 22833<br />lifeExp: 76.5<br />pop:   10228744<br />continent: Europe","Denmark<br />gdpPercap: 35278<br />lifeExp: 78.3<br />pop:    5468120<br />continent: Europe","Finland<br />gdpPercap: 33207<br />lifeExp: 79.3<br />pop:    5238460<br />continent: Europe","France<br />gdpPercap: 30470<br />lifeExp: 80.7<br />pop:   61083916<br />continent: Europe","Germany<br />gdpPercap: 32170<br />lifeExp: 79.4<br />pop:   82400996<br />continent: Europe","Greece<br />gdpPercap: 27538<br />lifeExp: 79.5<br />pop:   10706290<br />continent: Europe","Hungary<br />gdpPercap: 18009<br />lifeExp: 73.3<br />pop:    9956108<br />continent: Europe","Iceland<br />gdpPercap: 36181<br />lifeExp: 81.8<br />pop:     301931<br />continent: Europe","Ireland<br />gdpPercap: 40676<br />lifeExp: 78.9<br />pop:    4109086<br />continent: Europe","Italy<br />gdpPercap: 28570<br />lifeExp: 80.5<br />pop:   58147733<br />continent: Europe","Montenegro<br />gdpPercap:  9254<br />lifeExp: 74.5<br />pop:     684736<br />continent: Europe","Netherlands<br />gdpPercap: 36798<br />lifeExp: 79.8<br />pop:   16570613<br />continent: Europe","Norway<br />gdpPercap: 49357<br />lifeExp: 80.2<br />pop:    4627926<br />continent: Europe","Poland<br />gdpPercap: 15390<br />lifeExp: 75.6<br />pop:   38518241<br />continent: Europe","Portugal<br />gdpPercap: 20510<br />lifeExp: 78.1<br />pop:   10642836<br />continent: Europe","Romania<br />gdpPercap: 10808<br />lifeExp: 72.5<br />pop:   22276056<br />continent: Europe","Serbia<br />gdpPercap:  9787<br />lifeExp: 74.0<br />pop:   10150265<br />continent: Europe","Slovak Republic<br />gdpPercap: 18678<br />lifeExp: 74.7<br />pop:    5447502<br />continent: Europe","Slovenia<br />gdpPercap: 25768<br />lifeExp: 77.9<br />pop:    2009245<br />continent: Europe","Spain<br />gdpPercap: 28821<br />lifeExp: 80.9<br />pop:   40448191<br />continent: Europe","Sweden<br />gdpPercap: 33860<br />lifeExp: 80.9<br />pop:    9031088<br />continent: Europe","Switzerland<br />gdpPercap: 37506<br />lifeExp: 81.7<br />pop:    7554661<br />continent: Europe","Turkey<br />gdpPercap:  8458<br />lifeExp: 71.8<br />pop:   71158647<br />continent: Europe","United Kingdom<br />gdpPercap: 33203<br />lifeExp: 79.4<br />pop:   60776238<br />continent: Europe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,176,246,1)","opacity":1,"size":[4.73930360976545,5.2515712457991,5.44107849786917,4.86531670289218,5.16855282584858,4.85794694387522,5.42769965273683,4.97410786436283,4.94778140481952,7.84043376621969,8.49809123744673,5.46648280699294,5.40514308400654,3.9460291298415,4.8085649745634,7.74130405516196,4.14203032052794,5.88528441607637,4.87472139425141,7.00115515259145,5.46138101214586,6.22484391610449,5.42123845033248,4.97176812735327,4.47964255788798,7.0812884751231,5.32616181946541,5.19097245574501,8.16356363915206,7.83015990857845],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,176,246,1)"}},"hoveron":"points","name":"Europe","legendgroup":"Europe","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.53700472145269,4.40114211228811],"y":[81.235,80.204],"text":["Australia<br />gdpPercap: 34435<br />lifeExp: 81.2<br />pop:   20434176<br />continent: Oceania","New Zealand<br />gdpPercap: 25185<br />lifeExp: 80.2<br />pop:    4115771<br />continent: Oceania"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(231,107,243,1)","opacity":1,"size":[6.12061399094626,4.80944439195868],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(231,107,243,1)"}},"hoveron":"points","name":"Oceania","legendgroup":"Oceania","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":45.3561496061829,"r":7.30593607305936,"b":41.7762409303838,"l":37.2602739726027},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"Year 2007","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[2.33084382564856,4.80585074240034],"tickmode":"array","ticktext":["300","1000","3000","10000","30000"],"tickvals":[2.47712125471966,3,3.47712125471966,4,4.47712125471966],"categoryorder":"array","categoryarray":["300","1000","3000","10000","30000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"GDP per Capita (USD)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[37.4635,84.7525],"tickmode":"array","ticktext":["40","50","60","70","80"],"tickvals":[40,50,60,70,80],"categoryorder":"array","categoryarray":["40","50","60","70","80"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"Life Expectancy (years)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(51,51,51,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.799782308764802},"annotations":[{"text":"Population<br />Region","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"95605d474082":{"text":{},"x":{},"y":{},"size":{},"colour":{},"type":"scatter"}},"cur_data":"95605d474082","visdat":{"95605d474082":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:gapminder-1)Scatterplot displaying the relationship between four variables in the year 2007: GDP per capita (x-axis), Life Expectancy (y-axis), Population (size), and Region (color).]</p>
</div>

How does this pattern compare to what was happening in 1952 (see Figure \@ref(fig:gapminder-2))?

<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-f50f63c007c2286b17b9" style="width:100%;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-f50f63c007c2286b17b9">{"x":{"data":[{"x":[3.38899023661283,3.54661795189398,3.02643201267174,2.93005260502055,2.7350039250647,2.5305793268568,3.06917494642867,3.02991544783555,3.07139072908185,3.04257194357223,2.89239645809614,3.32748591742422,3.14257551331311,3.42643472038373,3.15192805015693,2.57477544261792,2.51711742361593,2.55888402796697,3.63280908763635,2.68594823378004,2.95966086373133,2.7077374684251,2.47690451520437,2.93122434615365,2.47544775548677,2.76010041014319,3.3779521224475,3.15926985690029,2.56722061382276,2.65546209483727,2.87105655940933,3.29401531949067,3.22742481432583,2.67073373159289,3.38449327691663,2.88188621742309,3.03232934535076,3.43439088585181,2.69313213434862,2.94427711610338,3.16147491028024,2.94437790363822,3.05528268506973,3.6744289754842,3.20843897238107,3.06008434430642,2.85530714889989,2.93440181335381,3.16686674390612,2.86614165405515,3.05971061802448,2.6094707348536],"y":[43.077,30.015,38.223,47.622,31.975,39.031,38.523,35.463,38.092,40.715,39.143,42.111,40.477,34.812,41.893,34.482,35.928,34.078,37.003,30,43.149,33.609,32.5,42.27,42.138,38.48,42.723,36.681,36.256,33.685,40.543,50.986,42.873,31.286,41.725,37.444,36.324,52.724,40,46.471,37.278,30.331,32.978,45.009,38.635,41.407,41.215,38.596,44.6,39.978,42.038,48.451],"text":["Algeria<br />gdpPercap:   2449<br />lifeExp: 43.1<br />pop:   9279525<br />continent: Africa","Angola<br />gdpPercap:   3521<br />lifeExp: 30.0<br />pop:   4232095<br />continent: Africa","Benin<br />gdpPercap:   1063<br />lifeExp: 38.2<br />pop:   1738315<br />continent: Africa","Botswana<br />gdpPercap:    851<br />lifeExp: 47.6<br />pop:    442308<br />continent: Africa","Burkina Faso<br />gdpPercap:    543<br />lifeExp: 32.0<br />pop:   4469979<br />continent: Africa","Burundi<br />gdpPercap:    339<br />lifeExp: 39.0<br />pop:   2445618<br />continent: Africa","Cameroon<br />gdpPercap:   1173<br />lifeExp: 38.5<br />pop:   5009067<br />continent: Africa","Central African Republic<br />gdpPercap:   1071<br />lifeExp: 35.5<br />pop:   1291695<br />continent: Africa","Chad<br />gdpPercap:   1179<br />lifeExp: 38.1<br />pop:   2682462<br />continent: Africa","Comoros<br />gdpPercap:   1103<br />lifeExp: 40.7<br />pop:    153936<br />continent: Africa","Congo, Dem. Rep.<br />gdpPercap:    781<br />lifeExp: 39.1<br />pop:  14100005<br />continent: Africa","Congo, Rep.<br />gdpPercap:   2126<br />lifeExp: 42.1<br />pop:    854885<br />continent: Africa","Cote d'Ivoire<br />gdpPercap:   1389<br />lifeExp: 40.5<br />pop:   2977019<br />continent: Africa","Djibouti<br />gdpPercap:   2670<br />lifeExp: 34.8<br />pop:     63149<br />continent: Africa","Egypt<br />gdpPercap:   1419<br />lifeExp: 41.9<br />pop:  22223309<br />continent: Africa","Equatorial Guinea<br />gdpPercap:    376<br />lifeExp: 34.5<br />pop:    216964<br />continent: Africa","Eritrea<br />gdpPercap:    329<br />lifeExp: 35.9<br />pop:   1438760<br />continent: Africa","Ethiopia<br />gdpPercap:    362<br />lifeExp: 34.1<br />pop:  20860941<br />continent: Africa","Gabon<br />gdpPercap:   4293<br />lifeExp: 37.0<br />pop:    420702<br />continent: Africa","Gambia<br />gdpPercap:    485<br />lifeExp: 30.0<br />pop:    284320<br />continent: Africa","Ghana<br />gdpPercap:    911<br />lifeExp: 43.1<br />pop:   5581001<br />continent: Africa","Guinea<br />gdpPercap:    510<br />lifeExp: 33.6<br />pop:   2664249<br />continent: Africa","Guinea-Bissau<br />gdpPercap:    300<br />lifeExp: 32.5<br />pop:    580653<br />continent: Africa","Kenya<br />gdpPercap:    854<br />lifeExp: 42.3<br />pop:   6464046<br />continent: Africa","Lesotho<br />gdpPercap:    299<br />lifeExp: 42.1<br />pop:    748747<br />continent: Africa","Liberia<br />gdpPercap:    576<br />lifeExp: 38.5<br />pop:    863308<br />continent: Africa","Libya<br />gdpPercap:   2388<br />lifeExp: 42.7<br />pop:   1019729<br />continent: Africa","Madagascar<br />gdpPercap:   1443<br />lifeExp: 36.7<br />pop:   4762912<br />continent: Africa","Malawi<br />gdpPercap:    369<br />lifeExp: 36.3<br />pop:   2917802<br />continent: Africa","Mali<br />gdpPercap:    452<br />lifeExp: 33.7<br />pop:   3838168<br />continent: Africa","Mauritania<br />gdpPercap:    743<br />lifeExp: 40.5<br />pop:   1022556<br />continent: Africa","Mauritius<br />gdpPercap:   1968<br />lifeExp: 51.0<br />pop:    516556<br />continent: Africa","Morocco<br />gdpPercap:   1688<br />lifeExp: 42.9<br />pop:   9939217<br />continent: Africa","Mozambique<br />gdpPercap:    469<br />lifeExp: 31.3<br />pop:   6446316<br />continent: Africa","Namibia<br />gdpPercap:   2424<br />lifeExp: 41.7<br />pop:    485831<br />continent: Africa","Niger<br />gdpPercap:    762<br />lifeExp: 37.4<br />pop:   3379468<br />continent: Africa","Nigeria<br />gdpPercap:   1077<br />lifeExp: 36.3<br />pop:  33119096<br />continent: Africa","Reunion<br />gdpPercap:   2719<br />lifeExp: 52.7<br />pop:    257700<br />continent: Africa","Rwanda<br />gdpPercap:    493<br />lifeExp: 40.0<br />pop:   2534927<br />continent: Africa","Sao Tome and Principe<br />gdpPercap:    880<br />lifeExp: 46.5<br />pop:     60011<br />continent: Africa","Senegal<br />gdpPercap:   1450<br />lifeExp: 37.3<br />pop:   2755589<br />continent: Africa","Sierra Leone<br />gdpPercap:    880<br />lifeExp: 30.3<br />pop:   2143249<br />continent: Africa","Somalia<br />gdpPercap:   1136<br />lifeExp: 33.0<br />pop:   2526994<br />continent: Africa","South Africa<br />gdpPercap:   4725<br />lifeExp: 45.0<br />pop:  14264935<br />continent: Africa","Sudan<br />gdpPercap:   1616<br />lifeExp: 38.6<br />pop:   8504667<br />continent: Africa","Swaziland<br />gdpPercap:   1148<br />lifeExp: 41.4<br />pop:    290243<br />continent: Africa","Tanzania<br />gdpPercap:    717<br />lifeExp: 41.2<br />pop:   8322925<br />continent: Africa","Togo<br />gdpPercap:    860<br />lifeExp: 38.6<br />pop:   1219113<br />continent: Africa","Tunisia<br />gdpPercap:   1468<br />lifeExp: 44.6<br />pop:   3647735<br />continent: Africa","Uganda<br />gdpPercap:    735<br />lifeExp: 40.0<br />pop:   5824797<br />continent: Africa","Zambia<br />gdpPercap:   1147<br />lifeExp: 42.0<br />pop:   2672000<br />continent: Africa","Zimbabwe<br />gdpPercap:    407<br />lifeExp: 48.5<br />pop:   3080907<br />continent: Africa"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","opacity":1,"size":[6.21254190599673,5.41622038100592,4.81759595861309,4.27496759761562,5.46223406884842,5.01715550143975,5.56211909386606,4.66881120514112,5.07713804656168,4.02510092203653,6.78196603517431,4.49392485430355,5.14807376787837,3.82441420195212,7.55184167503368,4.09697765773924,4.72040544474832,7.43406177242042,4.26076378116135,4.15902950349906,5.66230565040628,5.07262422408199,4.35770381916358,5.80729200583678,4.44452051932262,4.49769998806018,4.56451457967182,5.51722264950675,5.13411139178568,5.3370368867511,4.56566988075506,4.32094526107505,6.29808393411582,5.80448305942951,4.3024095493472,5.23943115873162,8.38671700200503,4.13579973650286,5.04010893783947,3.77952755905512,5.09510557454369,4.93606607413158,5.0380870068923,6.79954960331964,6.10805648490402,4.16400733369175,6.08286343539385,4.6422110426901,5.29727730453756,5.70342647907732,5.07454711776777,5.17223066093516],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(248,118,109,1)"}},"hoveron":"points","name":"Africa","legendgroup":"Africa","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[3.77168410638546,3.4277013118156,3.32406512092713,4.05565201579927,3.59549388379384,3.33124809455434,3.41946163852479,3.74714281784858,3.14541928995783,3.54680300382501,3.48405811924978,3.38529120987805,3.26490442284377,3.34141992333242,3.46217793171264,3.54134525206814,3.49309037603174,3.39451827933144,3.29054848983727,3.57501726271782,3.4888269675211,3.48047721152403,4.14583267954377,3.7571504724556,3.88591503111158],"y":[62.485,40.414,50.917,68.75,54.745,50.643,57.206,59.421,45.928,48.357,45.262,42.023,37.579,41.912,58.53,50.789,42.314,55.191,62.649,43.902,64.28,59.1,68.44,66.071,55.088],"text":["Argentina<br />gdpPercap:   5911<br />lifeExp: 62.5<br />pop:  17876956<br />continent: Americas","Bolivia<br />gdpPercap:   2677<br />lifeExp: 40.4<br />pop:   2883315<br />continent: Americas","Brazil<br />gdpPercap:   2109<br />lifeExp: 50.9<br />pop:  56602560<br />continent: Americas","Canada<br />gdpPercap:  11367<br />lifeExp: 68.8<br />pop:  14785584<br />continent: Americas","Chile<br />gdpPercap:   3940<br />lifeExp: 54.7<br />pop:   6377619<br />continent: Americas","Colombia<br />gdpPercap:   2144<br />lifeExp: 50.6<br />pop:  12350771<br />continent: Americas","Costa Rica<br />gdpPercap:   2627<br />lifeExp: 57.2<br />pop:    926317<br />continent: Americas","Cuba<br />gdpPercap:   5587<br />lifeExp: 59.4<br />pop:   6007797<br />continent: Americas","Dominican Republic<br />gdpPercap:   1398<br />lifeExp: 45.9<br />pop:   2491346<br />continent: Americas","Ecuador<br />gdpPercap:   3522<br />lifeExp: 48.4<br />pop:   3548753<br />continent: Americas","El Salvador<br />gdpPercap:   3048<br />lifeExp: 45.3<br />pop:   2042865<br />continent: Americas","Guatemala<br />gdpPercap:   2428<br />lifeExp: 42.0<br />pop:   3146381<br />continent: Americas","Haiti<br />gdpPercap:   1840<br />lifeExp: 37.6<br />pop:   3201488<br />continent: Americas","Honduras<br />gdpPercap:   2195<br />lifeExp: 41.9<br />pop:   1517453<br />continent: Americas","Jamaica<br />gdpPercap:   2899<br />lifeExp: 58.5<br />pop:   1426095<br />continent: Americas","Mexico<br />gdpPercap:   3478<br />lifeExp: 50.8<br />pop:  30144317<br />continent: Americas","Nicaragua<br />gdpPercap:   3112<br />lifeExp: 42.3<br />pop:   1165790<br />continent: Americas","Panama<br />gdpPercap:   2480<br />lifeExp: 55.2<br />pop:    940080<br />continent: Americas","Paraguay<br />gdpPercap:   1952<br />lifeExp: 62.6<br />pop:   1555876<br />continent: Americas","Peru<br />gdpPercap:   3759<br />lifeExp: 43.9<br />pop:   8025700<br />continent: Americas","Puerto Rico<br />gdpPercap:   3082<br />lifeExp: 64.3<br />pop:   2227000<br />continent: Americas","Trinidad and Tobago<br />gdpPercap:   3023<br />lifeExp: 59.1<br />pop:    662850<br />continent: Americas","United States<br />gdpPercap:  13990<br />lifeExp: 68.4<br />pop: 157553000<br />continent: Americas","Uruguay<br />gdpPercap:   5717<br />lifeExp: 66.1<br />pop:   2252965<br />continent: Americas","Venezuela<br />gdpPercap:   7690<br />lifeExp: 55.1<br />pop:   5439568<br />continent: Americas"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(163,165,0,1)","opacity":1,"size":[7.16178978635552,5.12591321933227,9.80482300859261,6.85439754493674,5.79356246542081,6.58871051633914,4.52533432158248,5.73372447232264,5.02896080201224,5.27619421308741,4.90785727164217,5.18724227372456,5.19975401369849,4.74688348433666,4.71607408711044,8.17454552291993,4.62213409738172,4.53123529131131,4.75955188588803,6.04105743333929,4.95908476806548,4.40167214506154,13.8354350288006,4.96613049008335,5.63803332392062],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(163,165,0,1)"}},"hoveron":"points","name":"Americas","legendgroup":"Americas","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.89178565070639,3.99418885910468,2.83521110677235,2.56640129232975,2.60254679160356,3.48492892667285,2.73764241302062,2.8748768833905,3.48220534228651,3.61592545033292,3.61135385491083,3.50744516771402,3.18946443127902,3.0367397532404,3.0130868621518,5.03495857498782,3.68437887876133,3.26271986425609,2.89573564318216,2.51982799377572,2.73708582406826,3.26203090406686,2.83543508289054,3.10478780221552,3.81020258849406,3.3645769259938,3.0348417539084,3.2157658381984,3.08168852810498,2.8795531210227,2.78180310257259,3.18058239847588,2.89304987672292],"y":[28.801,50.939,37.484,39.417,44,60.96,37.373,37.468,44.869,45.32,65.39,63.03,43.158,50.056,47.453,55.565,55.928,48.463,42.244,36.319,36.157,37.578,43.436,47.752,39.875,60.396,57.593,45.883,58.5,50.848,40.412,43.16,32.548],"text":["Afghanistan<br />gdpPercap:    779<br />lifeExp: 28.8<br />pop:   8425333<br />continent: Asia","Bahrain<br />gdpPercap:   9867<br />lifeExp: 50.9<br />pop:    120447<br />continent: Asia","Bangladesh<br />gdpPercap:    684<br />lifeExp: 37.5<br />pop:  46886859<br />continent: Asia","Cambodia<br />gdpPercap:    368<br />lifeExp: 39.4<br />pop:   4693836<br />continent: Asia","China<br />gdpPercap:    400<br />lifeExp: 44.0<br />pop: 556263527<br />continent: Asia","Hong Kong, China<br />gdpPercap:   3054<br />lifeExp: 61.0<br />pop:   2125900<br />continent: Asia","India<br />gdpPercap:    547<br />lifeExp: 37.4<br />pop: 372000000<br />continent: Asia","Indonesia<br />gdpPercap:    750<br />lifeExp: 37.5<br />pop:  82052000<br />continent: Asia","Iran<br />gdpPercap:   3035<br />lifeExp: 44.9<br />pop:  17272000<br />continent: Asia","Iraq<br />gdpPercap:   4130<br />lifeExp: 45.3<br />pop:   5441766<br />continent: Asia","Israel<br />gdpPercap:   4087<br />lifeExp: 65.4<br />pop:   1620914<br />continent: Asia","Japan<br />gdpPercap:   3217<br />lifeExp: 63.0<br />pop:  86459025<br />continent: Asia","Jordan<br />gdpPercap:   1547<br />lifeExp: 43.2<br />pop:    607914<br />continent: Asia","Korea, Dem. Rep.<br />gdpPercap:   1088<br />lifeExp: 50.1<br />pop:   8865488<br />continent: Asia","Korea, Rep.<br />gdpPercap:   1031<br />lifeExp: 47.5<br />pop:  20947571<br />continent: Asia","Kuwait<br />gdpPercap: 108382<br />lifeExp: 55.6<br />pop:    160000<br />continent: Asia","Lebanon<br />gdpPercap:   4835<br />lifeExp: 55.9<br />pop:   1439529<br />continent: Asia","Malaysia<br />gdpPercap:   1831<br />lifeExp: 48.5<br />pop:   6748378<br />continent: Asia","Mongolia<br />gdpPercap:    787<br />lifeExp: 42.2<br />pop:    800663<br />continent: Asia","Myanmar<br />gdpPercap:    331<br />lifeExp: 36.3<br />pop:  20092996<br />continent: Asia","Nepal<br />gdpPercap:    546<br />lifeExp: 36.2<br />pop:   9182536<br />continent: Asia","Oman<br />gdpPercap:   1828<br />lifeExp: 37.6<br />pop:    507833<br />continent: Asia","Pakistan<br />gdpPercap:    685<br />lifeExp: 43.4<br />pop:  41346560<br />continent: Asia","Philippines<br />gdpPercap:   1273<br />lifeExp: 47.8<br />pop:  22438691<br />continent: Asia","Saudi Arabia<br />gdpPercap:   6460<br />lifeExp: 39.9<br />pop:   4005677<br />continent: Asia","Singapore<br />gdpPercap:   2315<br />lifeExp: 60.4<br />pop:   1127000<br />continent: Asia","Sri Lanka<br />gdpPercap:   1084<br />lifeExp: 57.6<br />pop:   7982342<br />continent: Asia","Syria<br />gdpPercap:   1643<br />lifeExp: 45.9<br />pop:   3661549<br />continent: Asia","Taiwan<br />gdpPercap:   1207<br />lifeExp: 58.5<br />pop:   8550362<br />continent: Asia","Thailand<br />gdpPercap:    758<br />lifeExp: 50.8<br />pop:  21289402<br />continent: Asia","Vietnam<br />gdpPercap:    605<br />lifeExp: 40.4<br />pop:  26246839<br />continent: Asia","West Bank and Gaza<br />gdpPercap:   1516<br />lifeExp: 43.2<br />pop:   1030585<br />continent: Asia","Yemen, Rep.<br />gdpPercap:    782<br />lifeExp: 32.5<br />pop:   4963829<br />continent: Asia"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,191,125,1)","opacity":1,"size":[6.09709289842858,3.97651498808755,9.26277845950812,5.504413847774,22.6771653543307,4.93124023667447,19.2330359662662,11.0351782572815,7.10387330363029,5.63841296284726,4.7806302147616,11.2276198413383,4.37264745842233,6.15728253568266,7.44166391699151,4.03290431316154,4.72066779642869,5.85181838092513,4.46912835766282,7.36596689100474,6.19971045259239,4.31574800365694,8.92819626046445,7.57012695369418,5.37118944063832,4.60722312163389,6.03489417439874,5.30019643264456,6.11434795366628,7.47150827340532,7.87998306430871,4.56894184657085,5.55395329395406],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,191,125,1)"}},"hoveron":"points","name":"Asia","legendgroup":"Asia","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[3.20440655935692,3.78796153632719,3.9213277159305,2.98835076435393,3.3881521354268,3.49404830692654,3.83734472624362,3.98643066779033,3.80784062264484,3.84694354559525,3.85394839994697,3.54785959575643,3.72128896869472,3.86139630046032,3.71686109021475,3.69297059675009,3.42285001049471,3.95141387106102,4.00412446561185,3.60523280489102,3.48690063208004,3.49756723117478,3.55406003811099,3.70540687333909,3.62480187974278,3.58365604390734,3.93083928091202,4.16832752592624,3.29426798832312,3.99910915184445],"y":[55.23,66.8,68,53.82,59.6,61.21,66.87,70.78,66.55,67.41,67.5,65.86,64.03,72.49,66.91,65.94,59.164,72.13,72.67,61.31,59.82,61.05,57.996,64.36,65.57,64.94,71.86,69.62,43.585,69.18],"text":["Albania<br />gdpPercap:   1601<br />lifeExp: 55.2<br />pop:   1282697<br />continent: Europe","Austria<br />gdpPercap:   6137<br />lifeExp: 66.8<br />pop:   6927772<br />continent: Europe","Belgium<br />gdpPercap:   8343<br />lifeExp: 68.0<br />pop:   8730405<br />continent: Europe","Bosnia and Herzegovina<br />gdpPercap:    974<br />lifeExp: 53.8<br />pop:   2791000<br />continent: Europe","Bulgaria<br />gdpPercap:   2444<br />lifeExp: 59.6<br />pop:   7274900<br />continent: Europe","Croatia<br />gdpPercap:   3119<br />lifeExp: 61.2<br />pop:   3882229<br />continent: Europe","Czech Republic<br />gdpPercap:   6876<br />lifeExp: 66.9<br />pop:   9125183<br />continent: Europe","Denmark<br />gdpPercap:   9692<br />lifeExp: 70.8<br />pop:   4334000<br />continent: Europe","Finland<br />gdpPercap:   6425<br />lifeExp: 66.5<br />pop:   4090500<br />continent: Europe","France<br />gdpPercap:   7030<br />lifeExp: 67.4<br />pop:  42459667<br />continent: Europe","Germany<br />gdpPercap:   7144<br />lifeExp: 67.5<br />pop:  69145952<br />continent: Europe","Greece<br />gdpPercap:   3531<br />lifeExp: 65.9<br />pop:   7733250<br />continent: Europe","Hungary<br />gdpPercap:   5264<br />lifeExp: 64.0<br />pop:   9504000<br />continent: Europe","Iceland<br />gdpPercap:   7268<br />lifeExp: 72.5<br />pop:    147962<br />continent: Europe","Ireland<br />gdpPercap:   5210<br />lifeExp: 66.9<br />pop:   2952156<br />continent: Europe","Italy<br />gdpPercap:   4931<br />lifeExp: 65.9<br />pop:  47666000<br />continent: Europe","Montenegro<br />gdpPercap:   2648<br />lifeExp: 59.2<br />pop:    413834<br />continent: Europe","Netherlands<br />gdpPercap:   8942<br />lifeExp: 72.1<br />pop:  10381988<br />continent: Europe","Norway<br />gdpPercap:  10095<br />lifeExp: 72.7<br />pop:   3327728<br />continent: Europe","Poland<br />gdpPercap:   4029<br />lifeExp: 61.3<br />pop:  25730551<br />continent: Europe","Portugal<br />gdpPercap:   3068<br />lifeExp: 59.8<br />pop:   8526050<br />continent: Europe","Romania<br />gdpPercap:   3145<br />lifeExp: 61.0<br />pop:  16630000<br />continent: Europe","Serbia<br />gdpPercap:   3581<br />lifeExp: 58.0<br />pop:   6860147<br />continent: Europe","Slovak Republic<br />gdpPercap:   5075<br />lifeExp: 64.4<br />pop:   3558137<br />continent: Europe","Slovenia<br />gdpPercap:   4215<br />lifeExp: 65.6<br />pop:   1489518<br />continent: Europe","Spain<br />gdpPercap:   3834<br />lifeExp: 64.9<br />pop:  28549870<br />continent: Europe","Sweden<br />gdpPercap:   8528<br />lifeExp: 71.9<br />pop:   7124673<br />continent: Europe","Switzerland<br />gdpPercap:  14734<br />lifeExp: 69.6<br />pop:   4815000<br />continent: Europe","Turkey<br />gdpPercap:   1969<br />lifeExp: 43.6<br />pop:  22235677<br />continent: Europe","United Kingdom<br />gdpPercap:   9980<br />lifeExp: 69.2<br />pop:  50430000<br />continent: Europe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,176,246,1)","opacity":1,"size":[4.66555694430607,5.87942576445365,6.13897372290965,5.10371855727046,5.93184082632952,5.34609242609203,6.1920906541722,5.43608826607577,5.38820705326992,8.99714006409079,10.4397003174366,5.99915465882864,6.24198306558079,4.01716290964198,5.14222891243005,9.30820753444544,4.25616009627817,6.35390427817853,5.22800879820037,7.83936045324227,6.11100269458595,7.0412857815595,5.86906162098091,5.27820572442994,4.73756790517214,8.05649363704304,5.9093154328919,5.52681925976896,7.55289407873798,9.46644055212434],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,176,246,1)"}},"hoveron":"points","name":"Europe","legendgroup":"Europe","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.00171622128976,4.02352306468033],"y":[69.12,69.39],"text":["Australia<br />gdpPercap:  10040<br />lifeExp: 69.1<br />pop:   8691212<br />continent: Oceania","New Zealand<br />gdpPercap:  10557<br />lifeExp: 69.4<br />pop:   1994794<br />continent: Oceania"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(231,107,243,1)","opacity":1,"size":[6.13363495092053,4.89409611646071],"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(231,107,243,1)"}},"hoveron":"points","name":"Oceania","legendgroup":"Oceania","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":45.3561496061829,"r":7.30593607305936,"b":41.7762409303838,"l":37.2602739726027},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"title":{"text":"Year 1952","font":{"color":"rgba(0,0,0,1)","family":"","size":17.5342465753425},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[2.34747221451172,5.16293411596287],"tickmode":"array","ticktext":["1e+03","1e+04","1e+05"],"tickvals":[3,4,5],"categoryorder":"array","categoryarray":["1e+03","1e+04","1e+05"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"GDP per Capita (USD)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[26.60755,74.86345],"tickmode":"array","ticktext":["30","40","50","60","70"],"tickvals":[30,40,50,60,70],"categoryorder":"array","categoryarray":["30","40","50","60","70"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"Life Expectancy (years)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(51,51,51,1)","width":0.66417600664176,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.799782308764802},"annotations":[{"text":"Population<br />Region","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"95605f68e62d":{"text":{},"x":{},"y":{},"size":{},"colour":{},"type":"scatter"}},"cur_data":"95605f68e62d","visdat":{"95605f68e62d":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:gapminder-2)Scatterplot displaying the relationship between four variables in the year 1952: GDP per capita (x-axis), Life Expectancy (y-axis), Population (size), and Region (color).</p>
</div>

We can visualize relationships among four variables in the plots above (the three quantitative variables on the x- and y-axes and size, and the categorical variable as color).  We could even add a fifth variable using another aesthetic, like using shape to represent the most popular religion in each country.  How could we visualize what happens across time? Hans Rosling has the answer with dynamic visualization. Click on the image below to watch.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=Z8t4k0Q8e8Y
" target="_blank"><img src="http://img.youtube.com/vi/Z8t4k0Q8e8Y/0.jpg" 
alt="Hans Rosling 200 Years" width="480" height="360" border="10" /></a>

## Simpson's Paradox, revisited

Simpson's Paradox was introduced in Section \@ref(simpson) through an example on race and capital punishment. In that example, all three variables of interest were categorical. In this section, we present another example of this paradox using three quantitative variables.

In 1993, respected political essayist George Will, wrote the following criticism of spending on public education in the United States.

> "The 10 states with the lowest per pupil spending included four -- North Dakota, South Dakota, Tennessee, Utah -- among the 10 states with the top SAT scores. Only one of the 10 states with the highest per pupil expenditures -- Wisconsin -- was among the 10 states with the highest SAT scores. New Jersey has the highest per pupil expenditures, an astonishing $10,561, which teachers' unions elsewhere try to use as a negotiating benchmark. New Jersey's rank regarding SAT scores? Thirty-ninth... The fact that the quality of schools... [fails to correlate] with education appropriations will have no effect on the teacher unions' insistence that money is the crucial variable."
>
> --- George F. Will, September 12, 1993, "Meaningless Money Factor," _The Washington Post_, C7.

George Will based his claim state expenditures, average SAT scores, and other education-based variables. These data are in the data set `SAT`^[These data can be downloaded from (https://math.montana.edu/courses/s216/data/sat.csv)[https://math.montana.edu/courses/s216/data/sat.csv].], the first six rows of which are displayed in Table \@ref(tab:SATDF). Variables for this data set are described in Table \@ref(tab:SATVariables)


<table>
<caption>(\#tab:SATDF)Six rows from the `SAT` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> State </th>
   <th style="text-align:right;"> expend </th>
   <th style="text-align:right;"> ratio </th>
   <th style="text-align:right;"> salary </th>
   <th style="text-align:right;"> frac </th>
   <th style="text-align:right;"> verbal </th>
   <th style="text-align:right;"> math </th>
   <th style="text-align:right;"> sat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Alabama </td>
   <td style="text-align:right;"> 4.41 </td>
   <td style="text-align:right;"> 17.2 </td>
   <td style="text-align:right;"> 31.1 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 491 </td>
   <td style="text-align:right;"> 538 </td>
   <td style="text-align:right;"> 1029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> Alaska </td>
   <td style="text-align:right;"> 8.96 </td>
   <td style="text-align:right;"> 17.6 </td>
   <td style="text-align:right;"> 48.0 </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:right;"> 445 </td>
   <td style="text-align:right;"> 489 </td>
   <td style="text-align:right;"> 934 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> Arizona </td>
   <td style="text-align:right;"> 4.78 </td>
   <td style="text-align:right;"> 19.3 </td>
   <td style="text-align:right;"> 32.2 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 496 </td>
   <td style="text-align:right;"> 944 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> Arkansas </td>
   <td style="text-align:right;"> 4.46 </td>
   <td style="text-align:right;"> 17.1 </td>
   <td style="text-align:right;"> 28.9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 482 </td>
   <td style="text-align:right;"> 523 </td>
   <td style="text-align:right;"> 1005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> California </td>
   <td style="text-align:right;"> 4.99 </td>
   <td style="text-align:right;"> 24.0 </td>
   <td style="text-align:right;"> 41.1 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 417 </td>
   <td style="text-align:right;"> 485 </td>
   <td style="text-align:right;"> 902 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> Colorado </td>
   <td style="text-align:right;"> 5.44 </td>
   <td style="text-align:right;"> 18.4 </td>
   <td style="text-align:right;"> 34.6 </td>
   <td style="text-align:right;"> 29 </td>
   <td style="text-align:right;"> 462 </td>
   <td style="text-align:right;"> 518 </td>
   <td style="text-align:right;"> 980 </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:SATVariables)Variables and their descriptions for the `SAT` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Variable </th>
   <th style="text-align:left;"> Description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> State </td>
   <td style="text-align:left;"> Name of state </td>
  </tr>
  <tr>
   <td style="text-align:left;"> expend </td>
   <td style="text-align:left;"> Expenditure per pupil in average daily attendance in public elementary and secondary schools, 1994-95 (in thousands of dollars) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ratio </td>
   <td style="text-align:left;"> Average pupil/teacher ratio in public elementary and secondary schools, Fall 1994 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> salary </td>
   <td style="text-align:left;"> Estimated average annual salary of teachers in public elementary and secondary schools, 1994-95 (in thousands of dollars) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> frac </td>
   <td style="text-align:left;"> Percentage of all eligible students taking the SAT, 1994-95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> verbal </td>
   <td style="text-align:left;"> Average verbal SAT score, 1994-95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> math </td>
   <td style="text-align:left;"> Average math SAT score, 1994-95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sat </td>
   <td style="text-align:left;"> Average total score on the SAT, 1994-95 </td>
  </tr>
</tbody>
</table>

Mr. Will claims that expenditure per pupil has a _negative_ correlation with average SAT scores across states. Is this true? Indeed, the correlation between `expend` and `sat` is equal to $r$ = -0.381, and the relationship between the two variables is shown in Figure \@ref(fig:expend-sat). Hover over each point to view data on a particular State.

<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-6a6eb478b7e198ca6fef" style="width:75%;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-6a6eb478b7e198ca6fef">{"x":{"data":[{"x":[4.405,8.963,4.778,4.459,4.992,5.443,8.817,7.03,5.718,5.193,6.078,4.21,6.136,5.826,5.483,5.817,5.217,4.761,6.428,7.245,7.287,6.994,6,4.08,5.383,5.692,5.935,5.16,5.859,9.774,4.586,9.623,5.077,4.775,6.162,4.845,6.436,7.109,7.469,4.797,4.775,4.388,5.222,3.656,6.75,5.327,5.906,6.107,6.93,6.16],"y":[1029,934,944,1005,902,980,908,897,889,854,889,979,1048,882,1099,1060,999,1021,896,909,907,1033,1085,1036,1045,1009,1050,917,935,898,1015,892,865,1107,975,1027,947,880,888,844,1068,1040,893,1076,901,896,937,932,1073,1001],"text":["Alabama<br />expend: 4.41<br />sat: 1029","Alaska<br />expend: 8.96<br />sat:  934","Arizona<br />expend: 4.78<br />sat:  944","Arkansas<br />expend: 4.46<br />sat: 1005","California<br />expend: 4.99<br />sat:  902","Colorado<br />expend: 5.44<br />sat:  980","Connecticut<br />expend: 8.82<br />sat:  908","Delaware<br />expend: 7.03<br />sat:  897","Florida<br />expend: 5.72<br />sat:  889","Georgia<br />expend: 5.19<br />sat:  854","Hawaii<br />expend: 6.08<br />sat:  889","Idaho<br />expend: 4.21<br />sat:  979","Illinois<br />expend: 6.14<br />sat: 1048","Indiana<br />expend: 5.83<br />sat:  882","Iowa<br />expend: 5.48<br />sat: 1099","Kansas<br />expend: 5.82<br />sat: 1060","Kentucky<br />expend: 5.22<br />sat:  999","Louisiana<br />expend: 4.76<br />sat: 1021","Maine<br />expend: 6.43<br />sat:  896","Maryland<br />expend: 7.25<br />sat:  909","Massachusetts<br />expend: 7.29<br />sat:  907","Michigan<br />expend: 6.99<br />sat: 1033","Minnesota<br />expend: 6.00<br />sat: 1085","Mississippi<br />expend: 4.08<br />sat: 1036","Missouri<br />expend: 5.38<br />sat: 1045","Montana<br />expend: 5.69<br />sat: 1009","Nebraska<br />expend: 5.93<br />sat: 1050","Nevada<br />expend: 5.16<br />sat:  917","New,Hampshire<br />expend: 5.86<br />sat:  935","New,Jersey<br />expend: 9.77<br />sat:  898","New,Mexico<br />expend: 4.59<br />sat: 1015","New,York<br />expend: 9.62<br />sat:  892","North,Carolina<br />expend: 5.08<br />sat:  865","North,Dakota<br />expend: 4.78<br />sat: 1107","Ohio<br />expend: 6.16<br />sat:  975","Oklahoma<br />expend: 4.84<br />sat: 1027","Oregon<br />expend: 6.44<br />sat:  947","Pennsylvania<br />expend: 7.11<br />sat:  880","Rhode,Island<br />expend: 7.47<br />sat:  888","South,Carolina<br />expend: 4.80<br />sat:  844","South,Dakota<br />expend: 4.78<br />sat: 1068","Tennessee<br />expend: 4.39<br />sat: 1040","Texas<br />expend: 5.22<br />sat:  893","Utah<br />expend: 3.66<br />sat: 1076","Vermont<br />expend: 6.75<br />sat:  901","Virginia<br />expend: 5.33<br />sat:  896","Washington<br />expend: 5.91<br />sat:  937","West,Virginia<br />expend: 6.11<br />sat:  932","Wisconsin<br />expend: 6.93<br />sat: 1073","Wyoming<br />expend: 6.16<br />sat: 1001"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[3.656,3.73344303797468,3.81088607594937,3.88832911392405,3.96577215189873,4.04321518987342,4.1206582278481,4.19810126582278,4.27554430379747,4.35298734177215,4.43043037974684,4.50787341772152,4.5853164556962,4.66275949367089,4.74020253164557,4.81764556962025,4.89508860759494,4.97253164556962,5.0499746835443,5.12741772151899,5.20486075949367,5.28230379746835,5.35974683544304,5.43718987341772,5.5146329113924,5.59207594936709,5.66951898734177,5.74696202531645,5.82440506329114,5.90184810126582,5.97929113924051,6.05673417721519,6.13417721518987,6.21162025316456,6.28906329113924,6.36650632911392,6.44394936708861,6.52139240506329,6.59883544303797,6.67627848101266,6.75372151898734,6.83116455696202,6.90860759493671,6.98605063291139,7.06349367088607,7.14093670886076,7.21837974683544,7.29582278481013,7.37326582278481,7.45070886075949,7.52815189873418,7.60559493670886,7.68303797468354,7.76048101265823,7.83792405063291,7.91536708860759,7.99281012658228,8.07025316455696,8.14769620253164,8.22513924050633,8.30258227848101,8.3800253164557,8.45746835443038,8.53491139240506,8.61235443037975,8.68979746835443,8.76724050632911,8.8446835443038,8.92212658227848,8.99956962025316,9.07701265822785,9.15445569620253,9.23189873417721,9.3093417721519,9.38678481012658,9.46422784810126,9.54167088607595,9.61911392405063,9.69655696202532,9.774],"y":[1012.91193064943,1011.29397724707,1009.67602384472,1008.05807044236,1006.44011704,1004.82216363764,1003.20421023528,1001.58625683293,999.968303430569,998.350350028211,996.732396625853,995.114443223495,993.496489821137,991.878536418779,990.260583016421,988.642629614063,987.024676211705,985.406722809347,983.788769406989,982.170816004631,980.552862602273,978.934909199915,977.316955797557,975.699002395199,974.081048992841,972.463095590483,970.845142188125,969.227188785768,967.60923538341,965.991281981052,964.373328578694,962.755375176336,961.137421773978,959.51946837162,957.901514969262,956.283561566904,954.665608164546,953.047654762188,951.42970135983,949.811747957472,948.193794555114,946.575841152756,944.957887750398,943.33993434804,941.721980945682,940.104027543324,938.486074140966,936.868120738608,935.25016733625,933.632213933892,932.014260531534,930.396307129176,928.778353726818,927.16040032446,925.542446922102,923.924493519744,922.306540117386,920.688586715028,919.07063331267,917.452679910313,915.834726507955,914.216773105597,912.598819703239,910.980866300881,909.362912898523,907.744959496165,906.127006093807,904.509052691449,902.891099289091,901.273145886733,899.655192484375,898.037239082017,896.419285679659,894.801332277301,893.183378874943,891.565425472585,889.947472070227,888.329518667869,886.711565265511,885.093611863153],"text":["expend: 3.66<br />sat: 1013","expend: 3.73<br />sat: 1011","expend: 3.81<br />sat: 1010","expend: 3.89<br />sat: 1008","expend: 3.97<br />sat: 1006","expend: 4.04<br />sat: 1005","expend: 4.12<br />sat: 1003","expend: 4.20<br />sat: 1002","expend: 4.28<br />sat: 1000","expend: 4.35<br />sat:  998","expend: 4.43<br />sat:  997","expend: 4.51<br />sat:  995","expend: 4.59<br />sat:  993","expend: 4.66<br />sat:  992","expend: 4.74<br />sat:  990","expend: 4.82<br />sat:  989","expend: 4.90<br />sat:  987","expend: 4.97<br />sat:  985","expend: 5.05<br />sat:  984","expend: 5.13<br />sat:  982","expend: 5.20<br />sat:  981","expend: 5.28<br />sat:  979","expend: 5.36<br />sat:  977","expend: 5.44<br />sat:  976","expend: 5.51<br />sat:  974","expend: 5.59<br />sat:  972","expend: 5.67<br />sat:  971","expend: 5.75<br />sat:  969","expend: 5.82<br />sat:  968","expend: 5.90<br />sat:  966","expend: 5.98<br />sat:  964","expend: 6.06<br />sat:  963","expend: 6.13<br />sat:  961","expend: 6.21<br />sat:  960","expend: 6.29<br />sat:  958","expend: 6.37<br />sat:  956","expend: 6.44<br />sat:  955","expend: 6.52<br />sat:  953","expend: 6.60<br />sat:  951","expend: 6.68<br />sat:  950","expend: 6.75<br />sat:  948","expend: 6.83<br />sat:  947","expend: 6.91<br />sat:  945","expend: 6.99<br />sat:  943","expend: 7.06<br />sat:  942","expend: 7.14<br />sat:  940","expend: 7.22<br />sat:  938","expend: 7.30<br />sat:  937","expend: 7.37<br />sat:  935","expend: 7.45<br />sat:  934","expend: 7.53<br />sat:  932","expend: 7.61<br />sat:  930","expend: 7.68<br />sat:  929","expend: 7.76<br />sat:  927","expend: 7.84<br />sat:  926","expend: 7.92<br />sat:  924","expend: 7.99<br />sat:  922","expend: 8.07<br />sat:  921","expend: 8.15<br />sat:  919","expend: 8.23<br />sat:  917","expend: 8.30<br />sat:  916","expend: 8.38<br />sat:  914","expend: 8.46<br />sat:  913","expend: 8.53<br />sat:  911","expend: 8.61<br />sat:  909","expend: 8.69<br />sat:  908","expend: 8.77<br />sat:  906","expend: 8.84<br />sat:  905","expend: 8.92<br />sat:  903","expend: 9.00<br />sat:  901","expend: 9.08<br />sat:  900","expend: 9.15<br />sat:  898","expend: 9.23<br />sat:  896","expend: 9.31<br />sat:  895","expend: 9.39<br />sat:  893","expend: 9.46<br />sat:  892","expend: 9.54<br />sat:  890","expend: 9.62<br />sat:  888","expend: 9.70<br />sat:  887","expend: 9.77<br />sat:  885"],"type":"scatter","mode":"lines","name":"fitted values","line":{"width":3.77952755905512,"color":"rgba(51,102,255,1)","dash":"solid"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":53.3623722260509,"r":9.29846409298464,"b":53.1697611841248,"l":62.2997094229971},"font":{"color":"rgba(0,0,0,1)","family":"","size":18.5969281859693},"title":{"text":"Average SAT versus school expenditures","font":{"color":"rgba(0,0,0,1)","family":"","size":22.3163138231631},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[3.3501,10.0799],"tickmode":"array","ticktext":["4","6","8","10"],"tickvals":[4,6,8,10],"categoryorder":"array","categoryarray":["4","6","8","10"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":4.64923204649232,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":14.8775425487754},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.845314917544058,"zeroline":false,"anchor":"y","title":{"text":"Expenditure per pupil ($1000)","font":{"color":"rgba(0,0,0,1)","family":"","size":18.5969281859693}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[830.85,1120.15],"tickmode":"array","ticktext":["900","1000","1100"],"tickvals":[900,1000,1100],"categoryorder":"array","categoryarray":["900","1000","1100"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":4.64923204649232,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":14.8775425487754},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.845314917544058,"zeroline":false,"anchor":"x","title":{"text":"Average SAT score","font":{"color":"rgba(0,0,0,1)","family":"","size":18.5969281859693}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.8775425487754}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"9560418d3b54":{"text":{},"x":{},"y":{},"type":"scatter"},"95601f32296b":{"x":{},"y":{}}},"cur_data":"9560418d3b54","visdat":{"9560418d3b54":["function (y) ","x"],"95601f32296b":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:expend-sat)Expenditure per pupil in average daily attendance in public elementary and secondary schools ($1000) verses average SAT score for the 50 states plus the District of Columbia over school year 1994-1995.</p>
</div>

This may seem surprising, but remember -- these are observational data. We cannot conclude, as George Will does, that decreasing expenditures will increase SAT scores. In fact, there is one clear confounding variable in these data: percentage of all eligible students taking the SAT.

::: {.example}
What **confounding variables** may be present in this study? How could we determine whether a variable is confounding the relationship between school expenditures and SAT scores?

---

In some states at the time these data were collected, it was more common to take the ACT than the SAT. For students in these states, if they wanted to go to a state school, they need only take the ACT. However, if they wanted to attend college in another state, they might take the SAT. Thus, the percent of students taking the SAT in a state, `frac`, could be a confounding variable.

In order for `frac` to be confounding, it needs to be associated with our explanatory variable, `expend`, as well as with the response variable, `sat`. One could look at scatterplots and correlation between `frac` and `expend`, and between `frac` and `sat`, to determine if `frac` is confounding the relationship between `expend` and `sat`.
:::



Scatterplots of `expend` versus `frac` and `sat` versus `frac` are displayed in Figure \@ref(fig:expend-sat-frac). The correlation between `expend` and `frac` is 0.593, and the correlation between `sat` and `frac` is -0.887.

<div class="figure" style="text-align: center">
<img src="04-mult-reg_files/figure-html/expend-sat-frac-1.png" alt="Expenditure per pupil in average daily attendance in public elementary and secondary schools ($1000) and average SAT score plotted against percent of students taking the SAT for the 50 states plus the District of Columbia over school year 1994-1995." width="100%" />
<p class="caption">(\#fig:expend-sat-frac)Expenditure per pupil in average daily attendance in public elementary and secondary schools ($1000) and average SAT score plotted against percent of students taking the SAT for the 50 states plus the District of Columbia over school year 1994-1995.</p>
</div>

Now that we've determined that `frac` is a confounding variable, let's examine if and how it modifies the relationship between `expend` and `sat`. Since it is hard to visualize three quantitative variables -- 3-D scatterplots are difficult to visualize -- let's bin the variable `frac` into three groups.  States with fewer than 15% of eligible students taking the SAT will be classified as a low percentage.  States with between 15% - 55% of eligible students taking the SAT will be classified as medium  Those states with more than 55% of eligible students taking the SAT will be called high.  Next, we fit separate regression lines for each group. This model is shown in Figure \@ref(fig:expend-sat-frac-group).

<div class="figure" style="text-align: center">
<img src="04-mult-reg_files/figure-html/expend-sat-frac-group-1.png" alt="Average SAT score plotted against school expenditures per pupil, categorized by a Low ($&lt;$ 15%), Medium (15-55%), or High ($&gt;$ 55%) percent of students taking the SAT." width="80%" />
<p class="caption">(\#fig:expend-sat-frac-group)Average SAT score plotted against school expenditures per pupil, categorized by a Low ($<$ 15%), Medium (15-55%), or High ($>$ 55%) percent of students taking the SAT.</p>
</div>

Figure \@ref(fig:expend-sat-frac-group) demonstrates that the overall negative correlation between SAT scores and expenditures disappears, and even turns slightly positive, when we examine this relationship within states with similar fractions of students taking the SAT.

::: {.guidedpractice}
Why do these data exhibit Simpson's Paradox?^[The direction of a relationship of interest (SAT scores versus expenditures) was _reversed_ when accounting for a third variable (percent taking the SAT).]
:::

## Multiple regression (special topic) {#regression-multiple-predictors}

The principles of simple linear regression lay the foundation for more sophisticated regression models used in a wide range of challenging settings. 
In this section, we explore multiple regression, which introduces the possibility of more than one predictor in a linear model.

Multiple regression extends simple two-variable regression to the case that still has one response but many predictors (denoted $x_1$, $x_2$, $x_3$, \...). The method is motivated by scenarios where many variables may be simultaneously connected to an output.

We will consider data about loans from the peer-to-peer lender, Lending Club, which is a data set we first encountered in Chapter \@ref(intro-to-data). 
The loan data includes terms of the loan as well as information about the borrower. 
The outcome variable we would like to better understand is the interest rate assigned to the loan. 
For instance, all other characteristics held constant, does it matter how much debt someone already has? Does it matter if their income has been verified? 
Multiple regression will help us answer these and other questions.

The data set includes results from 10,000 loans, and we'll be looking at a subset of the available variables, some of which will be new from those we saw in earlier chapters. 
The first six observations in the data set are shown in Table \@ref(tab:loansDataMatrix), and descriptions for each variable are shown in Table \@ref(tab:loansVariables). 
Notice that the past bankruptcy variable (`bankruptcy`) is an indicator variable, where it takes the value 1 if the borrower had a past bankruptcy in their record and 0 if not. 
Using an indicator variable in place of a category name allows for these variables to be
directly used in regression. 
Two of the other variables are categorical (`verified_income` and `issue_month`), each of which can take one of a few different non-numerical values; we'll discuss how these are handled in the model in Section \@ref(ind-and-cat-predictors). 

::: {.data}
The data can be found in the [openintro](http://openintrostat.github.io/openintro) package: [`loans_full_schema`](http://openintrostat.github.io/openintro/reference/loans_full_schema.html). Based on the data in this dataset we have created to new variables: `credit_util` which is calculated as the total credit utilized divided by the total credit limit and `bankruptcy` which turns the number of bankruptcies to an indicator variable (0 for no bankrupties and 1 for at least 1 bankruptcies). We will refer to this modified dataset as `loans`.
:::

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:loansDataMatrix)First six rows from the `loans_full_schema` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> interest_rate </th>
   <th style="text-align:left;"> verified_income </th>
   <th style="text-align:right;"> debt_to_income </th>
   <th style="text-align:right;"> credit_util </th>
   <th style="text-align:right;"> bankruptcy </th>
   <th style="text-align:right;"> term </th>
   <th style="text-align:left;"> issue_month </th>
   <th style="text-align:right;"> credit_checks </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 14.07 </td>
   <td style="text-align:left;"> Verified </td>
   <td style="text-align:right;"> 18.01 </td>
   <td style="text-align:right;"> 0.548 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> Mar-2018 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12.61 </td>
   <td style="text-align:left;"> Not Verified </td>
   <td style="text-align:right;"> 5.04 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> Feb-2018 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 17.09 </td>
   <td style="text-align:left;"> Source Verified </td>
   <td style="text-align:right;"> 21.15 </td>
   <td style="text-align:right;"> 0.661 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> Feb-2018 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6.72 </td>
   <td style="text-align:left;"> Not Verified </td>
   <td style="text-align:right;"> 10.16 </td>
   <td style="text-align:right;"> 0.197 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> Jan-2018 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 14.07 </td>
   <td style="text-align:left;"> Verified </td>
   <td style="text-align:right;"> 57.96 </td>
   <td style="text-align:right;"> 0.755 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> Mar-2018 </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6.72 </td>
   <td style="text-align:left;"> Not Verified </td>
   <td style="text-align:right;"> 6.46 </td>
   <td style="text-align:right;"> 0.093 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:left;"> Jan-2018 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
</tbody>
</table>

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:loansVariables)Variables and their descriptions for the `loans` data set.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:left;"> description </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">interest_rate</span> </td>
   <td style="text-align:left;"> Interest rate on the loan, in an annual percentage. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">verified_income</span> </td>
   <td style="text-align:left;"> Categorical variable describing whether the borrower's income source and amount have been verified, with levels `Verified`, `Source Verified`, and `Not Verified`. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">debt_to_income</span> </td>
   <td style="text-align:left;"> Debt-to-income ratio, which is the percentage of total debt of the borrower divided by their total income. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">credit_util</span> </td>
   <td style="text-align:left;"> Of all the credit available to the borrower, what fraction are they utilizing. For example, the credit utilization on a credit card would be the card's balance divided by the card's credit limit. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">bankruptcy</span> </td>
   <td style="text-align:left;"> An indicator variable for whether the borrower has a past bankruptcy in their record. This variable takes a value of `1` if the answer is *yes* and `0` if the answer is *no*. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">term</span> </td>
   <td style="text-align:left;"> The length of the loan, in months. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">issue_month</span> </td>
   <td style="text-align:left;"> The month and year the loan was issued, which for these loans is always during the first quarter of 2018. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="   font-family: monospace;  ">credit_checks</span> </td>
   <td style="text-align:left;"> Number of credit checks in the last 12 months. For example, when filing an application for a credit card, it is common for the company receiving the application to run a credit check. </td>
  </tr>
</tbody>
</table>


### Indicator and categorical predictors {#ind-and-cat-predictors}

Let's start by fitting a linear regression model for interest rate with a single predictor indicating whether or not a person has a bankruptcy in their record: 

$$\widehat{\texttt{interest_rate}} = 12.33 + 0.74 \times bankruptcy$$

Results of this model are shown in Table \@ref(tab:intRateVsPastBankrModel).

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:intRateVsPastBankrModel)Summary of a linear model for predicting interest rate based on whether the borrower has a bankruptcy in their record. Degrees of freedom for this model is 9998.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> term </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> std.error </th>
   <th style="text-align:right;"> statistic </th>
   <th style="text-align:left;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:right;"> 12.338 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 231.49 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bankruptcy </td>
   <td style="text-align:right;"> 0.737 </td>
   <td style="text-align:right;"> 0.153 </td>
   <td style="text-align:right;"> 4.82 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
</tbody>
</table>

::: {.example}
Interpret the coefficient for the past bankruptcy variable in the model. Is this coefficient significantly different from 0? 

---

The variable takes one of two values: 1 when the borrower has a bankruptcy in their history and 0 otherwise. A slope of 0.74 means that the model predicts a 0.74%
higher interest rate for those borrowers with a bankruptcy in their
record. 
(See Section \@ref(categprical-predictor-two-levels) for a review of the interpretation for two-level categorical predictor variables.) 
Examining the regression output in Table \@ref(tab:intRateVsPastBankrModel), we can see that the p-value for is very close to zero, indicating there is strong evidence the coefficient is different from zero when using this simple one-predictor model.
:::

Suppose we had fit a model using a 3-level categorical variable, such as `verified_income`. 
The output from software is shown in Table \@ref(tab:intRateVsVerIncomeModel). 
This regression output provides multiple rows for the variable. 
Each row represents the relative difference for each level of `verified_income`. 
However, we are missing one of the levels: `Not Verified`. 
The missing level is called the **reference level** and it represents the default level that other levels are measured against.



<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:intRateVsVerIncomeModel)Summary of a linear model for predicting interest rate based on whether the borrower’s income source and amount has been verified. This predictor has three levels, which results in 2 rows in the regression output.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> term </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> std.error </th>
   <th style="text-align:right;"> statistic </th>
   <th style="text-align:left;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:right;"> 11.10 </td>
   <td style="text-align:right;"> 0.081 </td>
   <td style="text-align:right;"> 137.2 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> verified_incomeSource Verified </td>
   <td style="text-align:right;"> 1.42 </td>
   <td style="text-align:right;"> 0.111 </td>
   <td style="text-align:right;"> 12.8 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> verified_incomeVerified </td>
   <td style="text-align:right;"> 3.25 </td>
   <td style="text-align:right;"> 0.130 </td>
   <td style="text-align:right;"> 25.1 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
</tbody>
</table>

::: {.example}
How would we write an equation for this regression model?

---

The equation for the regression model may be written as a model with two predictors: 

$$\widehat{\texttt{interest_rate}} = 11.10 + 1.42 \times \text{verified_income}_{\text{Source Verified}} + 3.25 \times \text{verified_income}_{\text{Verified}}$$ 

We use the notation $\text{variable}_{\text{level}}$ to represent indicator variables for when the categorical variable takes a particular value. 
For example, $\text{verified_income}_{\text{Source Verified}}$ would take a value of 1 if
was for a loan, and it would take a value of 0 otherwise. 
Likewise, $\text{verified_income}_{\text{Verified}}$ would take a value of 1 if took a
value of `verified` and 0 if it took any other value.
:::

The notation $\text{variable}_{\text{level}}$ may feel a bit confusing. 
Let's figure out how to use the equation for each level of the `verified_income` variable.

::: {.example}
Using the model for predicting interest rate from income verification type, compute the average interest rate for borrowers whose income source and amount are both unverified. 

---

When `verified_income` takes a value of `Not Verified`, then both indicator functions in the equation for the linear model are set to 0:

$$\widehat{\texttt{interest_rate}} = 11.10 + 1.42 \times 0 + 3.25 \times 0 = 11.10$$

The average interest rate for these borrowers is 11.1%. 
Because the level does not have its own coefficient and it is the reference value, the indicators for the other levels for this variable all drop out.
:::


::: {.example}
Using the model for predicting interest rate from income verification type, compute the average interest rate for borrowers whose income source and amount are both unverified. 

---

When `verified_income` takes a value of `Source Verified`, then the corresponding variable takes a value of 1 while the other ($\text{verified_income}_{\text{Verified}}$) is 0:

$$\widehat{\texttt{interest_rate}} = = 11.10 + 1.42 \times 1 + 3.25 \times 0 = 12.52$$

The average interest rate for these borrowers is 12.52%.
:::


::: {.guidedpractice}
Compute the average interest rate for borrowers whose income source and amount are both verified.^[When `verified_income` takes a value of `Verified`, then the corresponding variable takes a value of 1 while the other is 0: $$11.10 + 1.42 \times 0 + 3.25 \times 1 = 14.35$$ The average interest rate for these borrowers is 14.35%.]
:::


::: {.important}
**Predictors with several categories.**

When fitting a regression model with a categorical variable that has $k$ levels where $k > 2$, software will provide a coefficient for $k - 1$ of those levels. 
For the last level that does not receive a coefficient, this is the , and the coefficients listed for the other levels are all considered relative to this reference level.
:::


::: {.guidedpractice}
Interpret the coefficients in the model.^[Each of the coefficients gives the incremental interest rate for the corresponding level relative to the `Not Verified` level, which is the reference level. For example, for a borrower whose income source and amount have been verified, the model predicts that they will have a 3.25% higher interest rate than a borrower who has not had their income source or amount verified.]
:::

The higher interest rate for borrowers who have verified their income source or amount is surprising. 
Intuitively, we'd think that a loan would look *less* risky if the borrower's income has been verified. 
However, note that the situation may be more complex, and there may be confounding variables that we didn't account for. 
For example, perhaps lender require borrowers with poor credit to verify their income. 
That is, verifying income in our data set might be a signal of some concerns about the borrower rather than a reassurance that the borrower will pay back the loan. 
For this reason, the borrower could be deemed higher risk, resulting in a higher interest rate. 
(What other confounding variables might explain this counter-intuitive relationship suggested by the model?)


::: {.guidedpractice}
How much larger of an interest rate would we expect for a borrower who has verified their income source and amount vs a borrower whose income source has only been verified?^[Relative to the `Not Verified` category, the `Verified` category has an interest rate of 3.25% higher, while the `Source Verified` category is only 1.42% higher. Thus, `Verified` borrowers will tend to get an interest rate about $3.25% - 1.42% = 1.83%$ higher than `Source Verified` borrowers.]
:::


### Many predictors in a model

The world is complex, and it can be helpful to consider many factors at once in statistical modeling. 
For example, we might like to use the full context of borrower to predict the interest rate they receive rather than using a single variable. 
This is the strategy used in **multiple regression**. 
While we remain cautious about making any causal interpretations using multiple regression on observational data, such models are a common first step in gaining insights or providing some evidence of a causal connection.



We want to construct a model that accounts for not only for any past bankruptcy or whether the borrower had their income source or amount verified, but simultaneously accounts for all the variables in the `loans` data set: `verified_income`, `debt_to_income`, `credit_util`, `bankruptcy`, `term`, `issue_month`, and `credit_checks`.

$$\begin{align*}
\widehat{\texttt{interest_rate}}
    &= \beta_0 +
        \beta_1\times \texttt{verified_income}_{\texttt{Source Verified}} +
        \beta_2\times \texttt{verified_income}_{\texttt{Verified}} \\
    &\qquad\  +
        \beta_3\times \texttt{debt_to_income} \\
    &\qquad\  +
        \beta_4 \times \texttt{credit_util} \\
    &\qquad\  +
        \beta_5 \times \texttt{bankruptcy} \\
    &\qquad\  +
        \beta_6 \times \texttt{term} \\
    &\qquad\  +
        \beta_7 \times \texttt{issue_month}_{\texttt{Jan-2018}} +
        \beta_8 \times \texttt{issue_month}_{\texttt{Mar-2018}} \\
    &\qquad\  +
        \beta_9 \times \texttt{credit_checks}
\end{align*}$$ 

This equation represents a holistic approach for modeling all of the variables simultaneously. 
Notice that there are two coefficients for `verified_income` and also two coefficients for `issue_month`, since both are 3-level categorical variables.

We estimate the parameters $\beta_0$, $\beta_1$, $\beta_2$, $\cdots$, $\beta_9$ in the same way as we did in the case of a single predictor.
We select $b_0$, $b_1$, $b_2$, $\cdots$, $b_9$ that minimize the sum of the squared residuals: 

$$SSE = e_1^2 + e_2^2 + \dots + e_{10000}^2 = \sum_{i=1}^{10000} e_i^2 = \sum_{i=1}^{10000} \left(y_i - \hat{y}_i\right)^2$$

where $y_i$ and $\hat{y}_i$ represent the observed interest rates and their estimated values according to the model, respectively. 
10,000 residuals are calculated, one for each observation. 
We typically use a computer to minimize the sum of squares and compute point estimates, as shown in the sample output in
Table \@ref(tab:loansFullModelOutput). 
Using this output, we identify the point estimates $b_i$ of each $\beta_i$, just as we did in the one-predictor case.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:loansFullModelOutput)Output for the regression model, where interest rate is the outcome and the variables listed are the predictors. Degrees of freedom for this model is 9990.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> term </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> std.error </th>
   <th style="text-align:right;"> statistic </th>
   <th style="text-align:left;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:right;"> 1.894 </td>
   <td style="text-align:right;"> 0.210 </td>
   <td style="text-align:right;"> 9.008 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> verified_incomeSource Verified </td>
   <td style="text-align:right;"> 0.997 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 10.056 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> verified_incomeVerified </td>
   <td style="text-align:right;"> 2.563 </td>
   <td style="text-align:right;"> 0.117 </td>
   <td style="text-align:right;"> 21.873 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> debt_to_income </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;"> 7.434 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> credit_util </td>
   <td style="text-align:right;"> 4.897 </td>
   <td style="text-align:right;"> 0.162 </td>
   <td style="text-align:right;"> 30.249 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> bankruptcy </td>
   <td style="text-align:right;"> 0.391 </td>
   <td style="text-align:right;"> 0.132 </td>
   <td style="text-align:right;"> 2.957 </td>
   <td style="text-align:left;"> 0.0031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> term </td>
   <td style="text-align:right;"> 0.153 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 38.889 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> issue_monthJan-2018 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.421 </td>
   <td style="text-align:left;"> 0.6736 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> issue_monthMar-2018 </td>
   <td style="text-align:right;"> -0.042 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> -0.391 </td>
   <td style="text-align:left;"> 0.696 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> credit_checks </td>
   <td style="text-align:right;"> 0.228 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 12.516 </td>
   <td style="text-align:left;"> &lt;0.0001 </td>
  </tr>
</tbody>
</table>


::: {.important}
**Multiple regression model.** 

A multiple regression model is a linear model with many predictors. In general, we write the model as

$$\hat{y} = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_k x_k$$

when there are $k$ predictors. 
We always estimate the $\beta_i$ parameters using statistical software.
:::


::: {.example}
Write out the regression model using the point estimates from Table \@ref(tab:loansFullModelOutput). 
How many predictors are there in this model?

---

The fitted model for the interest rate is given by: 

$$\begin{align*}
\widehat{\texttt{interest_rate}}
    &= 1.925 +
        0.975 \times \texttt{verified_income}_{\texttt{Source Verified}} \\
    &\qquad\  +
        2.537 \times \texttt{verified_income}_{\texttt{Verified}} \\
    &\qquad\  +
        0.021 \times \texttt{debt_to_income} \\
    &\qquad\  +
        4.896 \times \texttt{credit_util} \\
    &\qquad\  +
        0.386 \times \texttt{bankruptcy} \\
    &\qquad\  +
        0.154 \times \texttt{term} \\
    &\qquad\  +
        0.028 \times \texttt{issue_month}_{\texttt{Jan-2018}} \\
    &\qquad\  -
        0.040 \times \texttt{issue_month}_{\texttt{Mar-2018}} \\
    &\qquad\  +
        0.228 \times \texttt{credit_checks}
\end{align*}$$ 
  
If we count up the number of predictor coefficients, we get the *effective* number of predictors in the model: $k = 9$.
Notice that the categorical predictor counts as two, once for the two levels shown in the model. 
In general, a categorical predictor with $p$ different levels will be represented by $p - 1$ terms in a multiple regression model.
:::


::: {.guidedpractice}
What does $\beta_4$, the coefficient of variable , represent? What is the point estimate of $\beta_4$?^[$\beta_4$ represents the change in interest rate we would expect if someone's credit utilization was 0 and went to 1, all other factors held even. The point estimate is $b_4 = 4.90%$.]
:::


::: {.guidedpractice}
Compute the residual of the first observation in Table \@ref(tab:loansDataMatrix) on page using the full model.^[To compute the residual, we first need the predicted value, which we compute by plugging values into the equation from earlier. For example,
$\texttt{verified_income}_{\texttt{Source Verified}}$ takes a value of 0, $\texttt{verified_income}_{\texttt{Verified}}$ takes a value of 1 (since the borrower's income source and amount were verified), was 18.01, and so on. 
This leads to a prediction of $\widehat{\texttt{interest_rate}}_1 = 18.09$. 
The observed interest rate was 14.07%, which leads to a residual of $e_1 = 14.07 - 18.09 = -4.02$.]
:::


::: {.example}
We estimated a coefficient for in Section \@ref(ind-and-cat-predictors) of $b_4 = 0.74$ with a standard error of $SE_{b_1} = 0.15$ when using simple linear regression. 
Why is there a difference between that estimate and the estimated coefficient of 0.39 in the multiple regression setting?

---

If we examined the data carefully, we would see that some predictors are correlated. 
For instance, when we estimated the connection of the outcome `interest_rate` and predictor `bankruptcy` using simple linear regression, we were unable to control for other variables like whether the borrower had her income verified, the borrower's debt-to-income ratio, and other variables. 
That original model was constructed in a vacuum and did not consider the full context. 
When we include all of the variables, underlying and unintentional bias that was missed by these other variables is reduced or eliminated. 
Of course, bias can still exist from other confounding variables.
:::

The previous example describes a common issue in multiple regression: correlation among predictor variables. 
We say the two predictor variables are (pronounced as *co-linear*) when they are correlated, and this collinearity complicates model estimation. 
While it is impossible to prevent collinearity from arising in observational data, experiments are usually designed to prevent predictors from being collinear.


::: {.guidedpractice}
The estimated value of the intercept is 1.925, and one might be tempted to make some interpretation of this coefficient, such as, it is the model's predicted price when each of the variables take value zero: income source is not verified, the borrower has no debt (debt-to-income and credit utilization are zero), and so on. 
Is this reasonable? 
Is there any value gained by making this interpretation?^[Many of the variables do take a value 0 for at least one data point, and for those variables, it is reasonable. However, one variable never takes a value of zero: \texttt{term}, which describes the length of the loan, in months. If \texttt{term} is set to zero, then the loan must be paid back immediately; the borrower must give the money back as soon as she receives it, which means it is not a real loan. Ultimately, the interpretation of the intercept in this setting is not insightful.]
:::

<!-- ### Adjusted R-squared -->


### Interactive R tutorials

Explore the additional topics of multiple regression and logistic regression in `R` using the following self-paced tutorials. 
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

Further apply the concepts you've learned in this chapter in `R` with computational labs that walk you through a data analysis case study.

::: {.singlelab}
[Multiple linear regression - Grading the professor](http://openintrostat.github.io/oilabs-tidy/09_multiple_regression/multiple_regression.html)
:::

::: {.alllabs}
[Full list of labs supporting OpenIntro::Introduction to Modern Statistics](http://openintrostat.github.io/oilabs-tidy/)
:::


## Chapter 4 review {#chp4-review}

### Terms

We introduced the following terms in the chapter.
If you're not sure what some of these terms mean, we recommend you go back in the text and review their definitions.
We are purposefully presenting them in alphabetical order, instead of in order of appearance, so they will be a little more challenging to locate.
However you should be able to easily spot them as **bolded text**.

<table>
<tbody>
  <tr>
   <td style="text-align:left;"> aesthetic </td>
   <td style="text-align:left;"> interaction </td>
   <td style="text-align:left;"> parallel slopes </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> confounding variable </td>
   <td style="text-align:left;"> multiple regression </td>
   <td style="text-align:left;"> reference level </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>

