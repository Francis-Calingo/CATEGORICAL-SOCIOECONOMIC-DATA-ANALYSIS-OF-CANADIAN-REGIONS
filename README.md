# PROJECT OVERVIEW: Categorical Data Analysis Using R (Canadian Census Subdivisions)

  <ul>
    <li>Analyze relationships between several socioeconomic variables (e.g., average income, education levels) using Canada's Census Subdivisions (2016).</li>
    <li>Scraped data from Statistics Canada.</li>
    <li>Utilized statistical methods to see </li>
    <li>Performed Hyperparamter Tuning on Linear Regression and Random Forest Regressor models using GridSearchCV to reach the best models.</li>
  </ul>
  
## Code and Resources Used
  <ul>
    <li><b>IDEs Used:</b> RStudio</li>
    <li><b>R Version:</b> rstudio-2021.09.1</li>
    <li><b>Libraries:</b> car, spida2, effects, lattice, latticeExtra</li>
  </ul>
  
## Web Scraping
  <ul>
<li><b>Dataset 1:</b> https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E </li>
<li><b>Dataset 1 Selected variables (9):</b> </li> 
      <ul>
    <li>Census Division</li>
    <li>Province</li>
    <li>2016 Population</li>
    <li>Post secondary credentials attainment rate</li>
    <li>Average income</li>
    <li>Unemployment rate</li>
    <li>Visible Minority Rate</li>
    <li>Indigenous Rate</li>
    <li>Median Age</li>
      </ul>
<li><b>Dataset 2:</b> Add/Remove data - Components of population change by census division, 2016 boundaries </li>
<li><b>Dataset 2 Selected variables (12): </b></li>
    <ul>
    <li>Mortality (2015-16, 2016-17, 2017-18, 2018-19)</li>
    <li>Net inter and intraprovincial migration (2015-16, 2016-17, 2017-18, 2018-19)</li>
    </ul>
</ul>


## Feature Engineering
<ul>
<li><b>New variables (9):</b></li> 
  <ul>
  <li>4-year average mortality</li>
  <li>4-year average mortality per million people</li>
  <li>Net migration (sum of net interprovincial and intraprovincial migration for 2015-16, 2016-17, 2017-18, 2018-19)</li>
  <li>4-year average of calculated net migration</li>
  <li>4-year average of calculated net migration per million people</li>
  <li>POC rate (sum of Visible Minority and Indigenous rate) </li>
  </ul>
<li><b>Categorized Variables (7):</b></li> 
  <ul>
  <li>Mig, Mort, Post.Sec, Un, VM, Ind, POC</li>
  </ul>
<li><b>Vairables of Interest: </b></li> 
  <ul>
  <li>Mig - 4-year average of calculated net migration per million people</li>
  <li>Mort - 4-year average mortality per million people</li>
  <li>Post.Sec - Post secondary credentials attainment rate</li>
  <li>Avg.Inc - Average income</li>
  <li>Un - Unemployment rate</li>
  <li>VM - Visible minority rate</li>
  <li>Ind - Indigenous rate</li>
  <li>POC - Combined visible minority and Indigenous rate</li>
  <li>Med.Age - Median age</li>
  </ul>
</ul>

## Model Building
<ul>
<li><b>Categorical Response Variable:</b></li> 
    <ul>
      <li><b>Mig:</b></li> 
      <ul>
        <li>1 if average migration rate is below -5000</li>
        <li>2 if average migration rate is between -5000 and -1000</li>
        <li>3 if average migration rate is between -1000 and 1000</li>
        <li>4 if average migration rate is between 1000 and 5000</li>
        <li>5 if average migration rate is greater than 5000</li>
      </ul>
    </ul>
<li><b>Categorical Predictor Variables:</b></li> 
   <ul>
     <li><b>Mort:</b> 1 if average mortality rate is below 5000, 2 if average mortality rate is between 5000 and 7500 3 if average mortality rate is between 7500 and 10,000 4 if average mortalityrate is between 10,000 and 12,500 5 if average mortality rate is greater
than 12,500</li> 
     <li><b>Post.Sec:</b> 1 if post secondary credentials attainment rate is below 30%, 2 if post secondary credentials attainment rate is between 30-40%, 3 if post secondary credentials attainment rate is between 40-50%, 4 if post secondary credentials attainment rate is between 50-60%, 5 if post secondary credentials attainment rate is greater than 60%</li> 
     <li><b>Un:</b> 1 if unemployment rate is below 5%, 2 if unemployment rate is between 5-10%, 3 if unemployment rate is between 10-15%, 4 if unemployment rate is between 15-20%, 5 if unemployment rate is greater than 20%</li> 
     <li><b>VM:</b> 1 if Visible Minority rate is below 5%, 2 if Visible Minority rate is between 5-10%, 3 if Visible Minority rate is between 10-20%, 4 if Visible Minority rate is between 20-40%, 5 if Visible Minority rate is greater than 40%</li> 
     <li><b>Ind:</b> 1 if Indigenous rate is below 5%, 2 if Indigenous rate is between 5-10%, 3 if Indigenous rate is between 10-20%, 4 if Indigenous rate is between 20-40%, 5 if Indigenous rate is greater than 40%</li> 
     <li><b>POC:</b> 1 if POC rate is below 5%, 2 if POC rate is between 5-10%, 3 if POC rate is between 10-20%, 4 if POC rate is between 20-40%, 5 if POC rate is greater than 40%</li> 
   </ul>
<li><b>Continuous Predictor Variables:</b></li> 
   <ul>
     <li><b>Avg.Inc</b></li> 
     <li><b>Med.Age</b></li> 
   </ul>
 </ul>   

Ind, VM, and POC will be used as interaction variables on each variable of interest. 

  
## R Analysis
<b>Linear Regression Model:</b>
  <ul>
    <li><b>RMSE:</b> 114799.009005</li>
    <li><b>R^2 Score:</b> 0.935382</li>
   <li><b>Average MSE from Cross-Validation:</b> 626996.754116</li>
    </ul>
<b>Random Forest Regressor:</b>
  <ul>
    <li><b>RMSE:</b> 34611.563041</li>
    <li><b>R^2 Score:</b> 0.980581</li>
   <li><b>Average MSE from Cross-Validation:</b> 716345.255222</li>
    </ul>
Mig ~ Mort*Ind
There is quite a lot of high p-values, implying that there is lack of statistical significance. However, I still do
want to analyze the estimates. For VM, there is a lot of singularities for high-level Mort interacting on VM.
Since most visible minorities settle in Canada’s biggest urban areas, and many big urban areas are assigned
one census division each, most visible minority rates in many census divisions are negligible. Also, the larger
urban areas tend to have higher net migration due to better economic opportunities, notwithstanding the
contrasting socioeconomic conditions within urban areas. POC, as mentioned before, is the sum of VM and
Ind. Therefore, it would be better to use Ind as interaction. There is quite a wide discrepancy when it
comes to estimates for different mortality and Indigenous groups, implying that the effect on each group is
vastly different. However, the high standard errors among many terms (along with the aforementioned high
p-values) demonstrate that Ind would not be the best interaction variable for Mort.
Mig ~ Post.Sec*Ind
Possible Hauck-Donner phenomenon for Post.Sec
Mig ~ Avg.Income*Ind
Again there is discrepancy when it comes to each group, but the standard errors are much more acceptable.
The p-values, while still not statistically significant, are much lower.
Mig ~ Un*Ind
Only Ind2 has positive net mig.
Mig ~ MedAge*Ind
Standard errors are low but not as low as in Avg.Income. P-values are still too high.
So Ind would probably not be the best interaction variable to use. Therefore, Ind would have to be included
as some other kind of predictor variable.

Let’s investigate effects of other variables on Mort.
When Post.Sec added, Mort doesn’t change SEs much, but changes estimates a lot (except for Mort2)
After adding Avg.Income, SE changes minimally, Estimates greatly change.
SE and Est minimal change (Un)
Estimates greatly change, SEs don’t. (MedAge)
Estimates greatly change, SEs don’t. (Ind)
Un independent of Mort (as expected, since unemployment doesn’t necessarily cause mortality rates.) Let’s
look at Post Sec, Avg Income, Ind, and MedAge. Med Age could be mediator for mort (mortality is part
of the median age calculation, and . Avg Income possible conf? (due to poorer people have less access to
health services) Post.Sec doesn’t look independent nor collinear to Mort, but I struggle to find a plausible
relationship between them. Ind could be a possible mediator. Of course, a high rate of Indigenous people
people inside a community won’t be a direct push factor so I doubt it’s a confounder. However, it is a possible
mediator, given that Indigenous people have a lower life expectancy than the general Canadian population

Let’s investigate effects of other variables on Post Sec

Minimal change for both Est and SEs, but big change for Post.Sec.2 (Mort)
Est greatly change, not so much for Standard Errors. (Avg income)
Est change varies, but est mostly unchanged. SEs are also unchanged. assume independent. (Un)
Est greatly changes, not so much for SEs. (MedAge)
Est greatly changes, not so much for SEs. (Ind)
Let’s look at Avg.Income, MedAge, and Ind. Avg.Income could be a confounding factor for Post.Sec, as
income could affect one’s ability to access education. For MedAge, it could be a confounder but not a strong
one since while lower median age means more college-aged people, that doesn’t mean higher post secondary
graduation rate. For Avg.Income, it could be a confounder since it could both be a picture of economic
conditions for a geographical area (leading it to be a push factor) and could demonstrate that low-income
people are less likely to be able to access education. For Ind, it appears to be either a mediator or confounder
for Post.Sec.

Let’s investigate effects of other variables on Avg Inc

This confirms that Average income and mort are ind. (Mort)
Est changes a lot (Post Sec)
Est changes not as much as before. Assume independence. (Un)
Est changes greatly. (MedAge)
Minimal change in est and SEs. Independent. (Ind)
Let’s focus on Post.Sec and MedAge. MedAge could be a possible confounder, though maybe not as strong.
Older people would have accumulated more wealth in general than younger people, but that’s not always
the case. Post.Sec could be a confounder, since it’s both a plausible push factor and also illustrates that
post-secondary graduation tend to lead to better-paying jobs.

Let’s investigate effects of other variables on Un

Again all except Un2 has minimal est change (Mort)
Massive change in Est not so much in SE (Post sec)
No Significant change in Est (Avg income)
All except Un2 no significant change (MedAge)
Massive change in Est not so much in SE (Ind)
It seems that Un is largely independent of other variables except for Post.Sec and Ind. I can see Post.Sec being
a confounder for Un since many job opportunities require post-secondary credentials, and post-secondary
opportunities is in itself a push factor. Ind can’t be a push factor in itself, so it might be a mediator for Un.

Let’s investigate effects of other variables on MedAge

Sig in Est change not so much SE (Mort)
Not as big of a change with est (PostSec)
Little changes (Avg Income)
Little changes (Un)
Little changes (Ind)
MedAge and Mort could be conf or mediators of each other. MedAge could’ve been a mediator for Mort, so
it would mean that Mort is a conf for MedAge.

Let’s investigate effects of other variables on Ind.

All except Ind2 sees minimal change in Est. (Mort)
Minimal change in Est. Independent. (Post Sec)
Minimal change in Est. Independent. (Avg income)
All except Ind2 see minimal change in Est. (Un)
All except Ind2 see minimal change in Est. (MedAge)
It seems that Ind is also not a good variable of interest, which is no surprise since, as mentioned before, Ind
can’t be a direct push factor.

Mort as variable of interest
Only seems acceptable to include in the model.
glm(Mig ~ Mort+Avg.Income, family=binomial) [models]

Post Sec as variable of interest
Can only use Avg inc and MedAge

Avg Inc as variable of interest
Use post sec and MedAge

Un as variable of interest
Only Post Sec could be used well




## Conclusion

It appears that, based on the p-values and the coefficient estimates, that average income and post-secondary
opportunities have the biggest influence on out-migration. That makes sense, since average income is tied
to economic opportunities, and post-secondary opportunities are tied to job prospects.

