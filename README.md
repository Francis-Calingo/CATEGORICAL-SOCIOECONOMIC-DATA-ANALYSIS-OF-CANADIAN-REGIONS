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

Explain the overarching findings, trends, and themes in 2-3 sentences here. This section should address the question: "If a stakeholder were to take away 3 main insights from your project, what are the most important things they should know?" You can put yourself in the shoes of a specific stakeholder - for example, a marketing manager or finance director - to think creatively about this section.

[Visualization, including a graph of overall trends or snapshot of a dashboard]

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Insights Deep Dive
### Category 1:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]

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


