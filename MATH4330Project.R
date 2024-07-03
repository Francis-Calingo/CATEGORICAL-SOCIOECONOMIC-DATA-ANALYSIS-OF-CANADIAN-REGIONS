install.packages(c("car", "devtools", "effects", "ggplot2", "Hmisc"))
install.packages(c("knitr", "magrittr", "rgl", "rio", "rmarkdown"))
install.packages(c("latticeExtra"))
devtools::install_github('gmonette/spida2')
devtools::install_github('gmonette/p3d')
install.packages("carData", repos="http://R-Forge.R-project.org")
install.packages("carEx", repos="http://R-Forge.R-project.org")


library(car)
library(spida2)
library(effects)
library(lattice)
library(latticeExtra)

Canada <- read.csv("C:\\Users\\francali\\Documents\\Census Division Stats - Sheet1.csv")

summary(Canada$Avg.Income)
summary(Canada$MedAge)

Mig<-Canada$Mig
Mort<-Canada$Mort
Post.Sec<-Canada$Post.Sec
Avg.Income<-Canada$Avg.Income
Un<-Canada$Un
VM<-Canada$VM
Ind<-Canada$Ind
MedAge<-Canada$MedAge
POC<-Canada$POC

class(Mig)
class(Mort)
class(Post.Sec)
class(Avg.Income)
class(Un)
class(VM)
class(Ind)
class(MedAge)
class(POC)

Mig<-as.factor(Mig)
Mort<-as.factor(Mort)
Post.Sec<-as.factor(Post.Sec)
Un<-as.factor(Un)
VM<-as.factor(VM)
Ind<-as.factor(Ind)
POC<-as.factor(POC)

#Notice that Mig is not normally distributed

xqplot(Mig)
xqplot(Mort)
xqplot(Post.Sec)
xqplot(Avg.Income)
xqplot(Un)
xqplot(VM)
xqplot(Ind)
xqplot(MedAge)
xqplot(POC)

##Let's try VM, Ind, and POC as interactions

Model.Int1_1 <- glm(Mig ~ Mort*Ind, family="binomial")
summary(Model.Int1_1)

Model.Int1_2 <- glm(Mig ~ Mort*VM, family="binomial")
summary(Model.Int1_2)

Model.Int1_3 <- glm(Mig ~ Mort*POC, family="binomial")
summary(Model.Int1_3)

#There is quite a lot of high p-values, implying that there is lack of statistical significance. However, I still do want to analyze the estimates.
#For VM, there is a lot of singularities for high-level Mort interacting on VM. Since most visible minorities settle in Canada's biggest urban areas, and many big urban areas are assigned one census division each, most visible minority rates in many census divisions are negligible.
#Also, the larger urban areas tend to have higher net migration due to better economic opportunities, notwithstanding the contrasting socioeconomic conditions within urban areas.
#POC, as mentioned before, is the sum of VM and Ind.
#Therefore, it would be better to use Ind as interaction. 
#There is quite a wide discrepancy when it comes to estimates for different mortality and Indigenous groups, implying that the effect on each group is vastly different.
#However, the high standard errors among many terms (along with the aforementioned high p-values) demonstrate that Ind would not be the best interaction variable for Mort.

Model.Int2_1 <- glm(Mig ~ Post.Sec*Ind, family="binomial")
summary(Model.Int2_1)
plot(Model.Int2_1)

#Possible Hauck-Donner phenomenon for Post.Sec

Model.Int3_1 <- glm(Mig ~ Avg.Income*Ind, family="binomial")
summary(Model.Int3_1)

#Again there is discrepancy when it comes to each group, but the standard errors are much more acceptable. The p-values, while still not statistically significant, are much lower.

Model.Int4_1 <- glm(Mig ~ Un*Ind, family="binomial")
summary(Model.Int4_1)

#Only Ind2 has positive net mig.

Model.Int5_1 <- glm(Mig ~ MedAge*Ind, family="binomial")
summary(Model.Int5_1)

#Standard errors are low but not as low as in Avg.Income. P-values are still too high.

#So Ind would probably not be the best interaction variable to use. Therefore, Ind would have to be included as some other kind of predictor variable.

##Let's investigate effects of other variables on Mort.

Model.Mort <- glm(Mig ~ Mort, family=binomial)
summary(Model.Mort)

Model.Mort1 <- glm(Mig ~ Mort+Post.Sec, family=binomial)
summary(Model.Mort1)

#When Post.Sec added, Mort doesn't change SEs much, but changes estimates a lot (except for Mort2)

Model.Mort2 <- glm(Mig ~ Mort+Avg.Income, family=binomial)
summary(Model.Mort2)

#After adding Avg.Income, SE changes minimally, Estimates greatly change.

Model.Mort3 <- glm(Mig ~ Mort+Un, family=binomial)
summary(Model.Mort3)

#SE and Est minimal change

Model.Mort4 <- glm(Mig ~ Mort+MedAge, family=binomial)
summary(Model.Mort4)

#Estimates greatly change, SEs don't.

Model.Mort5 <- glm(Mig ~ Mort+Ind, family=binomial)
summary(Model.Mort5)

#Estimates greatly change, SEs don't.

#Un independent of Mort (as expected, since unemployment doesn't necessarily cause mortality rates.)
#Let's look at Post Sec, Avg Income, Ind, and MedAge. Med Age could be mediator for mort (mortality is part of the median age calculation, and .
#Avg Income possible conf? (due to poorer people have less access to health services)
#Post.Sec doesn't look independent nor collinear to Mort, but I struggle to find a plausible relationship between them.
#Ind could be a possible mediator. Of course, a high rate of Indigenous people people inside a community won't be a direct push factor so I doubt it's a confounder. However, it is a possible mediator, given that Indigenous people have a lower life expectancy than the general Canadian population.

##Let's investigate effects of other variables on Post Sec

Model.Post <- glm(Mig ~ Post.Sec, family=binomial)
summary(Model.Post)

Model.Post1 <- glm(Mig ~ Post.Sec+Mort, family=binomial)
summary(Model.Post1)

#Minimal change for both Est and SEs, but big change for Post.Sec.2

Model.Post2 <- glm(Mig ~ Post.Sec+Avg.Income, family=binomial)
summary(Model.Post2)

#Est greatly change, not so much for Standard Errors.

Model.Post3 <- glm(Mig ~ Post.Sec+Un, family=binomial)
summary(Model.Post3)

#Est change varies, but est mostly unchanged. SEs are also unchanged. assume independent.

Model.Post4 <- glm(Mig ~ Post.Sec+MedAge, family=binomial)
Model.Post4
plot(Model.Post4)

#Est greatly changes, not so much for SEs.

Model.Post5 <- glm(Mig ~ Post.Sec+Ind, family=binomial)
summary(Model.Post5)

#Est greatly changes, not so much for SEs.

#Let's look at Avg.Income, MedAge, and Ind. Avg.Income could be a confounding factor for Post.Sec, as income could affect one's ability to access education.
#For MedAge, it could be a confounder but not a strong one since while lower median age means more college-aged people, that doesn't mean higher post secondary graduation rate. 
#For Avg.Income, it could be a confounder since it could both be a picture of economic conditions for a geographical area (leading it to be a push factor) and could demonstrate that low-income people are less likely to be able to access education.
#For Ind, it appears to be either a mediator or confounder for Post.Sec.

##Let's investigate effects of other variables on Avg Inc

Model.Inc <- glm(Mig ~ Avg.Income, family=binomial)
summary(Model.Inc)

Model.Inc1 <- glm(Mig ~ Avg.Income+Mort, family=binomial)
summary(Model.Inc1)

#This confirms that Average income and mort are ind.

Model.Inc2 <- glm(Mig ~ Avg.Income+Post.Sec, family=binomial)
summary(Model.Inc2)

#Est changes a lot

Model.Inc3 <- glm(Mig ~ Avg.Income+Un, family=binomial)
summary(Model.Inc3)

#Est changes not as much as before. Assume independence.

Model.Inc4 <- glm(Mig ~ Avg.Income+MedAge, family=binomial)
summary(Model.Inc4)

#Est changes greatly.

Model.Inc5 <- glm(Mig ~ Avg.Income+Ind, family=binomial)
summary(Model.Inc5)

#Minimal change in est and SEs. Independent.

#Let's focus on Post.Sec and MedAge. 
#MedAge could be a possible confounder, though maybe not as strong. Older people would have accumulated more wealth in general than younger people, but that's not always the case.
#Post.Sec could be a confounder, since it's both a plausible push factor and also illustrates that post-secondary graduation tend to lead to better-paying jobs.

##Let's investigate effects of other variables on Un
Model.Un <- glm(Mig ~ Un, family=binomial)
summary(Model.Un)

Model.Un1 <- glm(Mig ~ Un+Mort, family=binomial)
summary(Model.Un1)

#Again all except Un2 has minimal est change

Model.Un2 <- glm(Mig ~ Un+Post.Sec, family=binomial)
summary(Model.Un2)

#Massive change in Est not so much in SE

Model.Un3 <- glm(Mig ~ Un+Avg.Income, family=binomial)
summary(Model.Un3)

#No Significant change in Est 

Model.Un4 <- glm(Mig ~ Un+MedAge, family=binomial)
summary(Model.Un4)

#All except Un2 no significant change

Model.Un5 <- glm(Mig ~ Un+Ind, family=binomial)
summary(Model.Un5)

#Massive change in Est not so much in SE

#It seems that Un is largely independent of other variables except for Post.Sec and Ind. I can see Post.Sec being a confounder for Un since many job opportunities require post-secondary credentials, and post-secondary opportunities is in itself a push factor.
#Ind can't be a push factor in itself, so it might be a mediator for Un.

##Let's investigate effects of other variables on MedAge

Model.Med <- glm(Mig ~ MedAge, family=binomial)
summary(Model.Med)

Model.Med1 <- glm(Mig ~ MedAge+Mort, family=binomial)
summary(Model.Med1)

#Sig in Est change not so much SE

Model.Med2 <- glm(Mig ~ MedAge+Post.Sec, family=binomial)
summary(Model.Med2)

#Not as big of a change  with est

Model.Med3 <- glm(Mig ~ MedAge+Avg.Income, family=binomial)
summary(Model.Med3)

#Little changes

Model.Med4 <- glm(Mig ~ MedAge+Un, family=binomial)
summary(Model.Med4)

#Little changes

Model.Med5 <- glm(Mig ~ MedAge+Ind, family=binomial)
summary(Model.Med5)

#Little changes

#MedAge and Mort could be conf or mediators of each other. 
#MedAge could've been a mediator for Mort, so it would mean that Mort is a conf for MedAge.

##Let's investigate effects of other variables on Ind.

Model.Ind <- glm(Mig ~ Ind, family=binomial)
summary(Model.Ind)

Model.Ind1 <- glm(Mig ~ Ind+Mort, family=binomial)
summary(Model.Ind1)

#All except Ind2 sees minimal change in Est.

Model.Ind2 <- glm(Mig ~ Ind+Post.Sec, family=binomial)
summary(Model.Ind2)

#Minimal change in Est. Independent.

Model.Ind3 <- glm(Mig ~ Ind+Avg.Income, family=binomial)
summary(Model.Ind3)

#Minimal change in Est. Independent.

Model.Ind4 <- glm(Mig ~ Ind+Un, family=binomial)
summary(Model.Ind4)

#All except Ind2 see minimal change in Est.

Model.Ind5 <- glm(Mig ~ Ind+MedAge, family=binomial)
summary(Model.Ind5)

#All except Ind2 see minimal change in Est.

#It seems that Ind is also not a good variable of interest, which is no surprise since, as mentioned before, Ind can't be a direct push factor.

##Mort as variable of interest
#Only seems acceptable to include in the model.

Model1 <- glm(Mig ~ Mort+Avg.Income, family=binomial)
summary(Model1)
plot(Model1)

anova(Model1, test="LRT")

##Post Sec as variable of interest
#Can only use Avg inc and MedAge

Model2.1 <- glm(Mig ~ Post.Sec+Avg.Income+MedAge, family=binomial)
summary(Model2.1)
plot(Model2.1)

anova(Model2.1, test="LRT")

Model2.2 <- glm(Mig ~ Post.Sec+MedAge+Avg.Income, family=binomial)
summary(Model2.2)
plot(Model2.2)

anova(Model2.2, test="LRT")

###Avg Inc as variable of interest
#Use post sec and MedAge

Model3.1 <- glm(Mig ~ Avg.Income+Post.Sec+MedAge, family=binomial)
Model3.1
summary(Model3.1)
plot(Model3.1)

anova(Model3.1, test="LRT")

Model3.2 <- glm(Mig ~ Avg.Income+MedAge+Post.Sec, family=binomial)
summary(Model3.2)
plot(Model3.2)

anova(Model3.2, test="LRT")

###Un as variable of interest
#Only Post Sec could be used well

Model4 <- glm(Mig ~ Un+Post.Sec, family=binomial)
summary(Model4)
plot(Model4)

anova(Model4, test="LRT")

###Med as variable of interest
#Only Mort could be used well

Model5 <- glm(Mig ~ MedAge+Mort, family=binomial)
summary(Model5)
plot(Model5)

anova(Model5, test="LRT")

