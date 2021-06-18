**Background:**

On average, humans spend about 33% of each day sleeping. The recommended number of hours of sleep is 7 hours in a 24 hour period[[1]](#1) Good sleep is not only vital to our day-to-day functioning but also allows us to lead healthy lives. In the US, 50-70 million people suffer from insomnia.^2^ This dashboard uses the 2018- National Health and Nutrition Examination Survey (NHANES) data to explore the different variables that may have an effect on self-reported problems with sleeping.^3^
 
**Data Wrangling and Feature Selection:**

Since this was a cross sectional study, files with longitudinal data were removed. Several smaller datasets were created, and important predictors were chosen using random forest, literature search and domain knowledge of the authors. Datasets with very important predictors were then combined for further preprocessing. Finally literature search and random forest were used once again to choose the final predictors

Preprocessing steps:

* Missing values were imputed
* Records reported as “don’t know ” and “refused” were removed
* Variables with >20% missing values were removed
* Collinearity between variables was checked and one from each pair of correlated variables was dropped
* The data were reformatted according to the relevant class
* The data were renamed to “easy to understand” names

R markdown file that goes from NHANES data to an analysis-ready data, and the final data can be found [here](https://github.com/BriAnsari/NHANES/tree/main/Raw2Ready).

**Model Selection:**

Several classification models were trained and tested and models that showed the highest AUC (max = 0.61) were then chosen to be incorporated into the app. The top two best performing tidy models workflows were saved as an .RDS object (regularize logistic regression with lasso penalty and radial kernel support vector machines (cost = 32 rbf_sigma = 1e-05)
The link to the code can be found [here](https://github.com/BriAnsari/NHANES/tree/main/ClassificationModels).

**Using the App**
In this app, users can explore the data and run a logistic regression model to learn about these variables in depth. Furthermore, The regularized logistic regression and support vector machines radial basis function kernel incorporated in the app utilize a tidy model workflow under the hood. These workflows train on the dataset in the app by applying data preprocessing steps, fit the models, and show predictions. Please note this app does not use test data.

In exploratory data analysis tab, users can explore the relationships between variables by changing the "X", "Y", and "Color by group" input. The logistic regression tab uses the user input data to predict the probability of reporting sleep problems given the information on age, BMI, mental and physical health, and a few laboratory values. 

The logistic regression tab uses a logistic regression model to predict the probability of a patient reporting sleeping problems. The probability of reporting sleep problems will appear on the upper left panel. In the upper right, a figure shows how chosen variable affects the sleeping problem probability. The lower left figure presents the variables according to statistical significance. The lower right figure presents variables coefficients by the logistic regression model.
 
Finally, in the machine learning models, regularized logistic regression used a lasso penalty for feature selection of the top three predictors (BMI, CRP and serum Iron levels) and support vector machines used cost = 32 rbf_sigma = 1e-05 and showed the same variable importance as regularized regression. The top two panels react to user input and show local predictions in term of probability and a breakdown showing the contribution of each variable  while the lower two panels show the variable importance plots and confusion matrix showing proportions of responses mis-classified by the model. 

**Discussion and Limitations**

* Temporality could not be established since this was a cross sectional data i.e. did sleep problems result in higher BMI or did higher BMI cause sleep problems?
* The discriminatory performance for even the best model was not high enough (AUC = 0.61). There were better predictors in the data, which could have improved the AUC. but the    ratio for missingness was very high for those and hence those had to be excluded.
* Sample weights to account for oversampling and non responsiveness were not used, which could have resulted in biased estimates



**Important note: The link to the app is not available since the shinyapps.io was not working. Please use the folder named "final" to download the necessary files for the app** 

**References**

[1] Watson NF, Badr MS, Belenky G, et al.; Consensus Conference Panel. Joint consensus statement of the American Academy of Sleep Medicine and Sleep Research Society on the recommended amount of sleep for a healthy adult: methodology and discussion. Sleep. 2015;38:1161–1183.

[2] Ford ES, Wheaton AG, Cunningham TJ, Giles WH, Chapman DP, Croft JB. Trends in outpatient visits for insomnia, sleep apnea, and prescriptions for sleep medications among US adults: findings from the National Ambulatory Medical Care survey 1999–2010. Sleep. 2014;37(8): 1283–1293.

[3] Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: U.S. Department of Health and Human Services, Centers for Disease Control and Prevention, [2018](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/overview.aspx?BeginYear=2017).

[4] Packages: [flexdashboard](https://pkgs.rstudio.com/flexdashboard/index.html), 
[shiny](https://shiny.rstudio.com), 
[tidyverse](https://www.tidyverse.org),
[ggiraphExtra](https://exts.ggplot2.tidyverse.org/ggiraph.html),
[plotly](https://plotly.com/r/getting-started/),
[DALEX](https://dalex.drwhy.ai) and DALEXtra,
[tidymodels](https://www.tidymodels.org),
[jtools](https://jtools.jacob-long.com),
[vip](https://koalaverse.github.io/vip/articles/vip.html)

>
>"Sleep is the swiss-army knife of health. When sleep is deficient, there is sickness and disease. And when sleep is abundant, there is vitality and health."
>
>                                                                 - Matthew Walker, PhD

**Disclaimer**
This app was created as a project for Advanced Data Science for Biomedical Engineering (EN580.464/EN580.664)/Advanced Data Science for Public Health (PH140.628/PH140.629) and is NOT validated. If you have any concerns relating to your sleep, please consult an actual healthcare provider. This app does not reflect the views of the Johns Hopkins University, the Johns Hopkins Hospital, or any of their affiliates.

**Authors**
Briha Ansari, MD., Feng-Chiao Lee, Tim Lee, MD.

**Last modified**
May 27, 2021
