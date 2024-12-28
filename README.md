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

It appears that, based on the p-values and the coefficient estimates, that average income and post-secondary
opportunities have the biggest influence on out-migration. That makes sense, since average income is tied
to economic opportunities, and post-secondary opportunities are tied to job prospects.


## Predictions
![image](https://github.com/user-attachments/assets/75376878-ca52-4a8a-b331-13c643545bc9)

![image](https://github.com/user-attachments/assets/df9238ad-b39d-4980-80db-531eb75f56d3)

![image](https://github.com/user-attachments/assets/9b177835-2b3f-4a67-965d-f05782729f03)

![image](https://github.com/user-attachments/assets/20560199-0a42-4c34-ac35-cef9e795058a)

![image](https://github.com/user-attachments/assets/1e33eec0-f6db-4a03-a0b3-18add97aebf1)

![image](https://github.com/user-attachments/assets/9820949b-34ca-497c-94fd-241e8bf13eb1)



