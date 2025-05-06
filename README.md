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

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following:

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

* Census divisions can often encompass entire cities (e.g., Toronto, Montreal). It is of course not correct to assume that the socioeconomic realities of major cities are monolithic, but that is something that had to be assumed for this analysis due to the limitations placed by the geographic layout of census divisions. Other geographic units such as electoral districts may be more appropriate for dealing with that.
  
* On a related note, as mentioned earlier, census divions are geographic regions for statistical purposes, and are not represented by a government nor public office representative, the way federal electoral districts are represented by a Member of Parliament, or health regions, which are managed by a province's respective Ministry of Health, and so forth. If we wanted to recommend policy to specific representatives, it may be more appropriate to use other geographic divisions for the analysis, for example, electoral districts or health regions.

[<b>Back to Table of Contents</b>](#table-of-contents)

---

# Credits and Acknowledgements

Riederer, Yihui Xie, Christophe Dervieux, Emily. "R Markdown Cookbook". bookdown.org, https://bookdown.org/yihui/rmarkdown-cookbook/

[<b>Back to Table of Contents</b>](#table-of-contents)

============================================================

## Table of Contents
* [R Analysis](#r-analysis)


<details><summary><h2>R Analysis</h2></summary> 

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
        <li><b>STEP 2:</b> Make 5 test models, adding other variable of interest: Mig ~ [variable of interest]+[second variable of interest]</li>
        <li><b>STEP 3:</b>Comment and compare test models with main model to see effects of adding variables, e.g. SEs (standard errors) and est.</li>
        <li><b>SAMPLE:</b></li>
 </ul>
 
 ![image](https://github.com/user-attachments/assets/1b17dab3-5ee7-49e5-a9de-af9dcdf81e97)


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

<b>Residual Plots and ANOVA:</b>
<ul>
  <li>Mig ~ Mort+Avg.Income</li>

  ![image](https://github.com/user-attachments/assets/dd989c24-940a-4284-81e0-da4af0f7aa6a)

  ![image](https://github.com/user-attachments/assets/13f2c583-ca93-4d68-89a9-a44127d2149c)

  ![image](https://github.com/user-attachments/assets/11db09cb-9328-47f5-bf3a-5a87a3b880cc)

  ![image](https://github.com/user-attachments/assets/985ecf41-1d4a-4bf3-b8c5-7202c40f7f32)

  ![image](https://github.com/user-attachments/assets/bac041bf-b5c9-450b-94f1-d23f6ea5af72)

  <li>Mig ~ Post.Sec+Avg.Income+MedAge</li>

  ![image](https://github.com/user-attachments/assets/1eab38a5-57f3-4778-850b-acc26fa8bd8d)

  ![image](https://github.com/user-attachments/assets/cb68c722-0125-4931-be93-2985adbb2e27)

  ![image](https://github.com/user-attachments/assets/1deb9a6e-2af5-4bd0-8a42-cf3552f43536)

  ![image](https://github.com/user-attachments/assets/08e5c1dd-0c8f-4a90-881c-741c0774a647)

  ![image](https://github.com/user-attachments/assets/dcbf2adb-e4e1-4668-99b8-ac639a7cb75c)

  <li>Mig ~ Mort+Avg.Income</li>

  ![image](https://github.com/user-attachments/assets/cab919ca-45ce-4b43-bf5e-ace90ff02eb5)

  ![image](https://github.com/user-attachments/assets/845f0fff-3c4c-47c6-9c8a-34470a651fb4)

  ![image](https://github.com/user-attachments/assets/cc9c3432-576d-4434-8f53-aaff86466922)

  ![image](https://github.com/user-attachments/assets/d9ef478c-d33d-435f-9667-603c11779ad3)

  ![image](https://github.com/user-attachments/assets/20a4dca5-92f3-482d-bbd0-d1ca5b4aa7df)

  <li>Mig ~ Avg.Income+Post.Sec+MedAge</li>

  ![image](https://github.com/user-attachments/assets/0ef0907a-71a9-4cf3-ab15-7f86f6d8dcce)

  ![image](https://github.com/user-attachments/assets/1e576eac-e671-41db-a96f-1df4f1cccf66)

  ![image](https://github.com/user-attachments/assets/9332ff2c-961b-46b2-91fd-0bac1583255e)

  ![image](https://github.com/user-attachments/assets/6cee7896-f10f-41ba-b23d-c9768b9093bb)

  ![image](https://github.com/user-attachments/assets/ccad27d1-3e8d-4562-9186-0aa1094d5efd)

  <li>Mig ~ Avg.Income+MedAge+Post.Sec</li>

  ![image](https://github.com/user-attachments/assets/b2d6e865-17a6-4284-98a9-0d38a4c9994e)

  ![image](https://github.com/user-attachments/assets/1af4213b-350e-4f16-925d-7822b7bcc0eb)

  ![image](https://github.com/user-attachments/assets/a5d7b9ff-5b2e-4887-a195-4f668baf7af8)

  ![image](https://github.com/user-attachments/assets/ca7f1e9c-8c4f-4254-931b-d51412b5d985)

  ![image](https://github.com/user-attachments/assets/7ec308d0-02a0-473d-8fd3-cab2f5c78b1e)

  <li>Mig ~ Un+Post.Sec</li>

  ![image](https://github.com/user-attachments/assets/545edc8e-48a4-4b6a-a12f-18614d66d980)

  ![image](https://github.com/user-attachments/assets/b60b1db6-2c00-4a38-9733-5cab49f60f99)

  ![image](https://github.com/user-attachments/assets/8b7eb9f6-eb2d-4f20-8069-1532dd9503be)

  ![image](https://github.com/user-attachments/assets/9976186a-a259-44a3-a458-660fd7d76f9d)

  ![image](https://github.com/user-attachments/assets/924d8630-90bb-48ef-bbb9-0f78a7435417)

  <li>Mig ~ MedAge+Mort</li>

  ![image](https://github.com/user-attachments/assets/c4c289fa-5cc7-4dcc-824b-3d7851fcfe0a)

  ![image](https://github.com/user-attachments/assets/d32d7933-8b29-4ea7-a3cc-fea1832ad851)

  ![image](https://github.com/user-attachments/assets/545041d8-875b-4eb3-a9fa-ada93e6616ec)

  ![image](https://github.com/user-attachments/assets/da2da47f-1e94-45f1-8f78-8ffda90b9aa4)

  ![image](https://github.com/user-attachments/assets/f11ba0f9-d8a6-4f77-9e46-ed903c8e1bf6)

</details>


