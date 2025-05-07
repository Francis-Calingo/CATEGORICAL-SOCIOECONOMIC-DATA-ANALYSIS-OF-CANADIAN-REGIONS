# Categorical Data Analysis Using R (Canadian Census Divisions)

# Table of Contents
* [Project Background](#project-background)
* [Data Structure and Model Building](#data-structure-and-model-building)
* [Executive Summary](#executive-summary)
* [Insights Deep Dive](#insights-deep-dive)
* [Recommendations](#recommendations)
* [Assumptions and Caveats](#assumptions-and-caveats)
* [Credits and Acknowlegements](#credits-and-acknowledgements)

---

# Project Background
Canada’s census divisions are a sub-national geographic division whose sole purpose is for statistical enumeration for Canada’s demi-decennial census. They are not tied to any government body, but can sometimes completely overlap with other geographical divisions such as an entire territory or an entire municipality.

Therefore, from a public policy perspective, conducting statistical analyses on a census division-by-census division level has little merit because there are no governmental bodies for census divisions themselves. However, the findings can still surface valuable insights for both Statistics Canada as well as communities in each division. For Statistics Canada, the socioeconomic data by division will not necessarily compel them to redraw boundaries in certain ways, but it would help them understand the communities better and therefore help guide their data collection methodologies better.

More importantly, the findings would be of value for municipal-level governments, especially from more isolated and/or other divisions. By better understanding socioeconomic patterns in the census division they’re part of, they could also better understand whether their socioeconomic experience is unique or is largely in line with other communities in their area.

Using Statistics Canada's data for Census divisions (2016), this project analyzes relationships between several socioeconomic variables (e.g., average income, education levels) and ascertains which ones had the biggest causal relationship on out-migration. Statistical methods such as ANOVA, residual plotting, and p-value analysis were employed.

Insights and recommendations are provided on the following key areas:

- **Demographics:** i.e., Mortality, Presence of Racialized Groups, Age
- **Labour and Education:** i.e., Post-secondary attainment, Income, Unemployment

The following is the R Script used for the quantitative analysis portion of the reporting: Link to see script
    <li><b>IDEs Used:</b> RStudio</li>
    <li><b>R Version:</b> rstudio-2021.09.1</li>
    <li><b>Libraries:</b> car, spida2, effects, lattice, latticeExtra</li>

The following is the report: [Link to report.](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/raw/refs/heads/main/MATH-4330-R-PROJECT.pdf)

To fork this repository:

```bash
git clone https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS.git
cd CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS
```
[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Data Structure and Model Building

The main csv file has **10,878 entries (294 records x 37 fields).**

<li><b>Dataset 1:</b> https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/index.cfm?Lang=E </li>
<li><b>Dataset 2:</b> https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1710014001  </li>

Below is a diagram showing the workflow from scraping variables of interest from the datasets to engineering new variables to assigning variables as either the categorical response variable, a categorical predictor variable, or a numerical predictor variable:


The breakdown of the variable assignment is given below:

<img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure1.1.jpg"/>

### Model Building:

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
     <li><b>Mort:</b> 1 if average mortality rate is below 5000, 2 if average mortality rate is between 5000 and 7500 3 if average mortality rate is between 7500 and 10,000 4 if average mortality rate is between 10,000 and 12,500 5 if average mortality rate is greater
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

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Executive Summary

### R Analysis

For the full analysis, please click on this Markdown file: [Full R Analysis](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/R%20Analysis.md)

### Overview of Findings

* Generally, Ind, VM, and POC were not the best interaction variables to use due to high p-values, although standard errors were more acceptable. Ind was still tested as a non-interaction predictor variable.

* After testing out different models using different combinations of predictor variables, it appears that Post.Sec, Avg. Income, and MedAge were the most impactful  variables based on the fact that they had the greatest effect on the estimate (i.e., calculated coefficient) in the equation model while the standard errors remained largely unchanged (i.e., adding these variables did not lower precision nor add any extra noise).

* After experimenting with the placement of the three aforementioned variables (i.e., Mig ~ Post.Sec+Avg.Income+MedAge VERSUS Mig ~ Post.Sec+MedAge+Avg.Income, Mig ~ Avg.Income+Post.Sec+MedAge VERSUS Mig ~ Avg.Income+MedAge+Post.Sec), we concluded that, based on the ANOVA tables, Post.Sec and Avg.Income were the most impactful variables.

---

# Insights Deep Dive
### Interaction Variable Analysis:

[Snippets of the results can be found in the [R Analysis Markdown file](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/R%20Analysis.md)

* **Mig ~ Mort * VM, Mig ~ Mort * Ind, Mig ~ Mort * POC:** P-values were consistently high for VM and POC, while they were varied for different Ind categories. Ind was therefore tested against other variables of interest, although its high standard errors means that it is not a good interaction variable for Mort.
  
* **Mig ~ Post.Sec * Ind, Mig ~ Avg.Inc * Ind, Mig ~ Un * Ind,Mig ~ MedAge * Ind:**
    * Possible Hauck-Donner phenomenon for Post.Sec.
    * Lower p-values and more acceptable standard errors for Avg.Income, but still not good enough.
    * For third model, Only Ind2 has positive net mig.
    * For fourth model, Standard errors are low but not as low as in Avg.Income. P-values are still too high.
  
* **Based on the results, it would not be good to include Ind as an interaction variable.** It is better off to test Ind as some other type of predictor variable.

### Analysis of Each Variable of Interest:

[Snippets of the results can be found in the [R Analysis Markdown file](https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/R%20Analysis.md)

* **Effects on Mort:** Mig ~ Mort+Post.Sec, Mig ~ Mort + Avg.Income, Mig ~ Mort+Un, Mig ~ Mort+MedAge, Mig ~ Mort+Ind:
    *  First test model: When Post.Sec added, Mort doesn’t change SEs much, but changes estimates a lot (except for Mort2)
    *  Second test model: After adding Avg.Income, SE changes minimally, Estimates greatly change.
    *  Third test model: SE and Est minimal change.
    *  Fourth test model: Estimates greatly change, SEs don’t.
    *  Fifth test model: Estimates greatly change, SEs don’t.
  
* **Effects of Other Variables on Post.Sec:**  Mig ~ Post.Sec + Mort, Mig ~ Post.Sec + Avg.Income, Mig ~ Post.Sec + Un, Mig ~ Post.Sec+MedAge, Mig ~ Post.Sec+Ind
    * First test model: Minimal change for both Est and SEs, but big change for Post.Sec.2
    * Second test model: Est greatly change, not so much for Standard Errors.
    * Third test model: Est change varies, but est mostly unchanged. SEs are also unchanged. assume independent.
    * Fourth test model: Est greatly changes, not so much for SEs.
    * Fifth test model: Est greatly changes, not so much for SEs.
  
* **Effects of Other Variables on Avg.Income:**  Mig ~ Avg.Income + Mort, Mig ~ Avg.Income + Post.Sec, Mig ~ Avg.Income + Un, Mig ~ Avg.Income+MedAge, Mig ~ Avg.Income+Ind
    * First test model: This confirms that Average income and mort are independent.
    * Second test model: Est changes a lot.
    * Third test model: Est changes not as much as before. Assume independence.
    * Fourth test model: Est changes greatly.
    * Fifth test model: Minimal change in est and SEs. Independent.
  
* **Effects of Other Variables on Un:**  Mig ~ Un + Mort, Mig ~ Un + Post.Sec, Mig ~ Un + Avg.Income, Mig ~Un + MedAge, Mig ~ Un + Ind
    * First test model: Again all except Un2 has minimal est change.
    * Second test model: Massive change in Est not so much in SE.
    * Third test model: No Significant change in Est.
    * Fourth test model: All except Un2 no significant change.
    * Fifth test model: Massive change in Est not so much in SE.

* **Effects of Other Variables on MedAge:**  Mig ~ MedAge + Mort, Mig ~ MedAge + Post.Sec, Mig ~ MedAge + Avg.Income, Mig ~ MedAge + Un, Mig ~ MedAge + Ind
    * First test model: Significant in Est change, not much change for SE.
    * Second test model: Not as big of a change with est.
    * Third test model: Little changes.
    * Fourth test model: Little changes.
    * Fifth test model: Little changes.

* **Effects of Other Variables on Ind:**  Mig ~ Ind + Mort, Mig ~ Ind + Post.Sec, Mig ~ Ind + Avg.Income, Mig ~ Ind + Un, Mig ~ Ind + MedAge
    *  First test model: All except Ind2 sees minimal change in Est.
    *  Second test model: Minimal change in Est. Independent.
    *  Third test model: Minimal change in Est. Independent.
    *  Fourth test model: All except Ind2 see minimal change in Est.
    *  Fifth test model: All except Ind2 see minimal change in Est.

### Residual Analysis and ANOVA for Most Impactful Variables:

* **MedAge, Post.Sec, and Avg.Income were deemed the most impactful variables.** That interpretation stemmed from the results, which showed that they generally had the biggest impact on the Est (Estimates) coefficient while causing, at most, minimal changes to the standard errors on other variables. In other words, they generally had the highest quantitative impact on the models' calculated coefficient while the differences between observed and predicted values were not significantly changed.
  
* **Mig ~ Post.Sec+Avg.Income+MedAge VERSUS Mig ~ Post.Sec+MedAge+Avg.Income:**
    * When Avg.Income is the second predictor variable in the equation, its deviance is 47.778. When it is the third, its deviance is 14.636.
    * When MedAge is the second predictor variable in the equation, its deviance is 39.919. When it is the third, its deviance is 6.777.
    <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.1.png"/>
    <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.2.png"/>

    * Residual plots:
      <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.3.png"/>
      <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.4.png"/>
  
* **Mig ~ Avg.Income+Post.Sec+MedAge VERSUS Mig ~ Avg.Income+MedAge+Post.Sec:**
    * When Post.Sec is the second predictor variable in the equation, its deviance is 81.791. When it is the third, its deviance is 52.882.
    * When MedAge is the second predictor variable in the equation, its deviance is 35.686. When it is the third, its deviance is 6.777.
  <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.5.png"/>
  <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.6.png"/>

    * Residual plots
  <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.7.png"/>
  <img src="https://github.com/Francis-Calingo/CATEGORICAL-SOCIOECONOMIC-DATA-ANALYSIS-OF-CANADIAN-REGIONS/blob/main/Figures/Figure3.8.png"/>
  
* **We can conclude that Post.Sec and Avg.Income are the most impactful variables.** This conclusion stems from the ANOVA table results (i.e., deviance), as both variables exhibited higher deviance when they are placed sequentially after the other, versus when they are placed sequentially after MedAge. In other words, they explain more of the deviance when they are next to each other in a model than when they are next to MedAge.


[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Recommendations:

Based on the insights and findings above, the following recommendations for relevant parties (i.e., local governments) have been formulated:

* There is a strong causal relationship between out-migration and educational attainment levels. It could be due to the fact that people are leaving for better educational opportunities (i.e., post-secondary education) and not returning. Of course, we would not expect communities from every census division to advocate for the construction of large-scale colleges or universities in their territories, but other measures could be considered:

  * **Ameliorate opportunities for those with the educational background** to entice them to come to their communities (e.g., more specialized careers, financial incentives)
 
  * **Develop partnerships with major colleges and universities**, where students may have an opportunity to travel to certain communities and contribute to the economy, whether through internships, co-op opportunities, or other means.
 
  * **Attract skilled immigrants.** This is an opportunity for communities that traditionally have not had a history of recent immigration to advertise themselves as better alternatives to major cities, where certain negative factors such as the higher cost of living are heightened.

* Income was also observed to have a very strong causal relationship with out-migration. This could be due to lack of certain job opportunities being push factors for people leaving as they seek better job opportunities. As with educational opportunities, we would not expect more isolated and smaller communities to start competing with the country’s leading economies such as Toronto’s, but there are opportunities for such communities to create pull factors:

  * **Intensify the diversification of their economies.** This is especially important for regions dependent on singular industries such as forestry and fishing.
 
  * **Develop poverty-reduction measures** such as raising the minimum wage and experimenting with basic income pilot projects, which would give lower-income communities greater financial fluidity and allow them to focus more on advancing their careers as opposed to constantly worrying about not meeting their basic needs.
 
  * **Reduce accessibility barriers.** Whether due to lack of accommodations in the workplace or lack of adequate transportation infrastructure that would help facilitate ease of commuting for workers, or other factors, barriers that, at worst, prevents people from applying to certain jobs, and, at best, are hindrances to a good quality of life, and they must be at least mitigated, if not eradicated entirely.

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* 2019/20 data was intentionally excluded to avoid complicating the analysis from extra noise stemming from the extraordinary impacts of the COVID-19 pandemic.

* Census divisions can often encompass entire cities (e.g., Toronto, Montreal). It is of course not correct to assume that the socioeconomic realities of major cities are monolithic, but that is something that had to be assumed for this analysis due to the limitations placed by the geographic layout of census divisions. Other geographic units such as electoral districts may be more appropriate for dealing with that.
  
* On a related note, as mentioned earlier, census divions are geographic regions for statistical purposes, and are not represented by a government nor public office representative, the way federal electoral districts are represented by a Member of Parliament, or health regions, which are managed by a province's respective Ministry of Health, and so forth. If we wanted to recommend policy to specific representatives, it may be more appropriate to use other geographic divisions for the analysis, for example, electoral districts or health regions.

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Credits and Acknowledgements

Riederer, Yihui Xie, Christophe Dervieux, Emily. "R Markdown Cookbook". bookdown.org, https://bookdown.org/yihui/rmarkdown-cookbook/

[<b>Back to Table of Contents</b>](#table-of-contents)


