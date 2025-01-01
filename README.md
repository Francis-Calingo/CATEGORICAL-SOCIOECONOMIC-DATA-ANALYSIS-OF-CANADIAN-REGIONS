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

<b>Investigating VM, Ind, and POC as Interaction Variables:</b>
  <ul>
    <li><b>Variable of interest:</b> Mort</li>
      <ul>
    <li><b>Models:</b> Mig ~ Mort*VM, Mig ~ Mort*Ind, Mig ~ Mort*POC,</li>
    <li><b>p-values:</b> Consistently high for VM and POC, varied for Ind</li>
    <li><b>Standard errors:</b> High for Ind</li>
   <li><b>Conclusion:</b> Safe to only move forward with Ind for investigation. Due to high standard errors, Ind is not a good interaction variable for Mort.</li>
      </ul>
    <li><b>Other variables of interest:</b> Post.Sec, Avg.Income, Un, MedAge</li>
    <ul>
    <li><b>Models:</b> Mig ~ Post.Sec*Ind, Mig ~ Avg.Inc*Ind, Mig ~ Un*Ind,Mig ~ MedAge*Ind</li>
    <li><b>Results:</b> </li>
      <ul>
        <li>Possible Hauck-Donner phenomenon for Post.Sec</li>
        <li>Lower p-values and more acceptable standard errors for Avg.Income, but still not good enough</li>
        <li>For third model, Only Ind2 has positive net mig.</li>
        <li>For fourth model, Standard errors are low but not as low as in Avg.Income. P-values are still too high.</li>
      </ul>
   <li><b>Conclusion:</b> Ind would probably not be the best interaction variable to use. Ind to be included as some other kind of predictor variable.</li>
    </ul>
    </ul>

<b>Methodology for each variable of interest:</b>
<ul>
        <li><b>STEP 1:</b> Take main model: Mig ~ [variable of interest]</li>
        <li><b>STEP 2: Make 5 test models, adding other variable of interest: Mig ~ [variable of interest]+[second variable of interest]</li>
        <li><b>STEP 3:</b>Comment and compare test models with main model to see effects of adding variables, e.g. SEs (standard errors) and est.</li>
 </ul>

<b>Effects of Other Variables on Mort:</b>
  <ul>
    <li><b>Main Model:</b> Mig ~ Mort</li>
    <li><b>Test Models:</b> Mig ~ Mort+Post.Sec, Mig ~ Mort + Avg.Income, Mig ~ Mort+Un, Mig ~ Mort+MedAge, Mig ~ Mort+Ind</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: When Post.Sec added, Mort doesn’t change SEs much, but changes estimates a lot (except for Mort2)</li>
        <li>Second test model: After adding Avg.Income, SE changes minimally, Estimates greatly change.</li>
        <li>Third test model: SE and Est minimal change.</li>
        <li>Fourth test model: Estimates greatly change, SEs don’t.</li>
        <li>Fifth test model: Estimates greatly change, SEs don’t.</li>
      </ul>
</ul>

<b>Effects of Other Variables on Post.Sec:</b>
  <ul>
    <li><b> Main Model:</b> Mig ~ Post.Sec</li>
    <li><b>Test Models:</b> Mig ~ Post.Sec + Mort, Mig ~ Post.Sec + Avg.Income, Mig ~ Post.Sec + Un, Mig ~ Post.Sec+MedAge, Mig ~ Post.Sec+Ind</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: Minimal change for both Est and SEs, but big change for Post.Sec.2</li>
        <li>Second test model: Est greatly change, not so much for Standard Errors.</li>
        <li>Third test model: Est change varies, but est mostly unchanged. SEs are also unchanged. assume independent.</li>
        <li>Fourth test model: Est greatly changes, not so much for SEs.</li>
        <li>Fifth test model: Est greatly changes, not so much for SEs.</li>
      </ul>
</ul>

<b>Effects of Other Variables on Avg.Income:</b>
  <ul>
    <li><b> Main Model:</b> Mig ~ Avg.Income</li>
    <li><b> Test Models:</b> Mig ~ Avg.Income + Mort, Mig ~ Avg.Income + Avg.Income, Mig ~ Avg.Income + Un, Mig ~ Avg.Income+MedAge, Mig ~ Avg.Income+Ind</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: This confirms that Average income and mort are ind.</li>
        <li>Second test model: Est changes a lot.</li>
        <li>Third test model: Est changes not as much as before. Assume independence.</li>
        <li>Fourth test model: Est changes greatly.</li>
        <li>Fifth test model: Minimal change in est and SEs. Independent.</li>
      </ul>
</ul>


<b>Effects of Other Variables on Un:</b>
  <ul>
    <li><b> Main Model:</b> Mig ~ Un</li>
    <li><b> Test Models:</b> Mig ~ Un + Mort, Mig ~ Un + Post.Sec, Mig ~ Un + Avg.Income, Mig ~ Un + MedAge, Mig ~ Un + Ind</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: Again all except Un2 has minimal est change.</li>
        <li>Second test model: Massive change in Est not so much in SE.</li>
        <li>Third test model: No Significant change in Est.</li>
        <li>Fourth test model: All except Un2 no significant change.</li>
        <li>Fifth test model: Massive change in Est not so much in SE.</li>
      </ul>
</ul>

<b>Effects of Other Variables on MedAge:</b>
  <ul>
    <li><b> Main Model:</b> Mig ~ MedAge</li>
    <li><b> Test Models:</b> Mig ~ MedAge + Mort, Mig ~ MedAge + Post.Sec, Mig ~ MedAge + Avg.Income, Mig ~ MedAge + Un, Mig ~ MedAge + Ind</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: Sig in Est change not so much SE.</li>
        <li>Second test model: Not as big of a change with est.</li>
        <li>Third test model: Little changes.</li>
        <li>Fourth test model: Little changes.</li>
        <li>Fifth test model: Little changes.</li>
      </ul>
</ul>

<b>Effects of Other Variables on Ind:</b>
  <ul>
    <li><b> Main Model:</b> Mig ~ MedAge</li>
    <li><b> Test Models:</b> Mig ~ Ind + Mort, Mig ~ Ind + Post.Sec, Mig ~ Ind + Avg.Income, Mig ~ Ind + Un, Mig ~ Ind + MedAge</li>
    <li><b>Results:</b></li>
    <ul>
        <li>First test model: All except Ind2 sees minimal change in Est.</li>
        <li>Second test model: Minimal change in Est. Independent.</li>
        <li>Third test model: Minimal change in Est. Independent.</li>
        <li>Fourth test model: All except Ind2 see minimal change in Est.</li>
        <li>Fifth test model: All except Ind2 see minimal change in Est.</li>
      </ul>
</ul>


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

