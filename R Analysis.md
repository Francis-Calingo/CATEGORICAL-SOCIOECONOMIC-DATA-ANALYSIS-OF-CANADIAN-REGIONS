# R Analysis

# Investigating VM, Ind, and POC as Interaction Variables
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

# Investigating Each Variable of Interest

### Methodology for each variable of interest
<ul>
        <li><b>STEP 1:</b> Take main model: Mig ~ [variable of interest]</li>
        <li><b>STEP 2:</b> Make 5 test models, adding other variable of interest: Mig ~ [variable of interest]+[second variable of interest]</li>
        <li><b>STEP 3:</b>Comment and compare test models with main model to see effects of adding variables, e.g. SEs (standard errors) and est.</li>
        <li><b>SAMPLE:</b></li>
 </ul>
 
 ![image](https://github.com/user-attachments/assets/1b17dab3-5ee7-49e5-a9de-af9dcdf81e97)


### Effects of Other Variables on Mort
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

### Effects of Other Variables on Post.Sec
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

### Effects of Other Variables on Avg.Income
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


### Effects of Other Variables on Un
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

### Effects of Other Variables on MedAge
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

### Effects of Other Variables on Ind
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

# Residual Plots and ANOVA

### Mig ~ Mort+Avg.Income

  ![image](https://github.com/user-attachments/assets/dd989c24-940a-4284-81e0-da4af0f7aa6a)

  ![image](https://github.com/user-attachments/assets/13f2c583-ca93-4d68-89a9-a44127d2149c)

  ![image](https://github.com/user-attachments/assets/11db09cb-9328-47f5-bf3a-5a87a3b880cc)

  ![image](https://github.com/user-attachments/assets/985ecf41-1d4a-4bf3-b8c5-7202c40f7f32)

  ![image](https://github.com/user-attachments/assets/bac041bf-b5c9-450b-94f1-d23f6ea5af72)

### Mig ~ Post.Sec+Avg.Income+MedAge

  ![image](https://github.com/user-attachments/assets/1eab38a5-57f3-4778-850b-acc26fa8bd8d)

  ![image](https://github.com/user-attachments/assets/cb68c722-0125-4931-be93-2985adbb2e27)

  ![image](https://github.com/user-attachments/assets/1deb9a6e-2af5-4bd0-8a42-cf3552f43536)

  ![image](https://github.com/user-attachments/assets/08e5c1dd-0c8f-4a90-881c-741c0774a647)

  ![image](https://github.com/user-attachments/assets/dcbf2adb-e4e1-4668-99b8-ac639a7cb75c)

### Mig ~ Mort+Avg.Income

  ![image](https://github.com/user-attachments/assets/cab919ca-45ce-4b43-bf5e-ace90ff02eb5)

  ![image](https://github.com/user-attachments/assets/845f0fff-3c4c-47c6-9c8a-34470a651fb4)

  ![image](https://github.com/user-attachments/assets/cc9c3432-576d-4434-8f53-aaff86466922)

  ![image](https://github.com/user-attachments/assets/d9ef478c-d33d-435f-9667-603c11779ad3)

  ![image](https://github.com/user-attachments/assets/20a4dca5-92f3-482d-bbd0-d1ca5b4aa7df)

### Mig ~ Avg.Income+Post.Sec+MedAge

  ![image](https://github.com/user-attachments/assets/0ef0907a-71a9-4cf3-ab15-7f86f6d8dcce)

  ![image](https://github.com/user-attachments/assets/1e576eac-e671-41db-a96f-1df4f1cccf66)

  ![image](https://github.com/user-attachments/assets/9332ff2c-961b-46b2-91fd-0bac1583255e)

  ![image](https://github.com/user-attachments/assets/6cee7896-f10f-41ba-b23d-c9768b9093bb)

  ![image](https://github.com/user-attachments/assets/ccad27d1-3e8d-4562-9186-0aa1094d5efd)

### Mig ~ Avg.Income+MedAge+Post.Sec

  ![image](https://github.com/user-attachments/assets/b2d6e865-17a6-4284-98a9-0d38a4c9994e)

  ![image](https://github.com/user-attachments/assets/1af4213b-350e-4f16-925d-7822b7bcc0eb)

  ![image](https://github.com/user-attachments/assets/a5d7b9ff-5b2e-4887-a195-4f668baf7af8)

  ![image](https://github.com/user-attachments/assets/ca7f1e9c-8c4f-4254-931b-d51412b5d985)

  ![image](https://github.com/user-attachments/assets/7ec308d0-02a0-473d-8fd3-cab2f5c78b1e)

### Mig ~ Un+Post.Sec

  ![image](https://github.com/user-attachments/assets/545edc8e-48a4-4b6a-a12f-18614d66d980)

  ![image](https://github.com/user-attachments/assets/b60b1db6-2c00-4a38-9733-5cab49f60f99)

  ![image](https://github.com/user-attachments/assets/8b7eb9f6-eb2d-4f20-8069-1532dd9503be)

  ![image](https://github.com/user-attachments/assets/9976186a-a259-44a3-a458-660fd7d76f9d)

  ![image](https://github.com/user-attachments/assets/924d8630-90bb-48ef-bbb9-0f78a7435417)

### Mig ~ MedAge+Mort

  ![image](https://github.com/user-attachments/assets/c4c289fa-5cc7-4dcc-824b-3d7851fcfe0a)

  ![image](https://github.com/user-attachments/assets/d32d7933-8b29-4ea7-a3cc-fea1832ad851)

  ![image](https://github.com/user-attachments/assets/545041d8-875b-4eb3-a9fa-ada93e6616ec)

  ![image](https://github.com/user-attachments/assets/da2da47f-1e94-45f1-8f78-8ffda90b9aa4)

  ![image](https://github.com/user-attachments/assets/f11ba0f9-d8a6-4f77-9e46-ed903c8e1bf6)
