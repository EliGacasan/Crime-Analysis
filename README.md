# Crime-Analysis

## California Crime Analysis
Two files, app.R and CAOpenjustice.R. CAOpenjustice.R does data preparation before running app.R. The interpretations for the "Statistical Analysis" tab are expected rates. Video demonstration 
here: youtube.com


Arrest data obtained via https://openjustice.doj.ca.gov/data

Shapefile (for map) obtained via https://gis.data.ca.gov/datasets/CALFIRE-Forestry::california-counties-1/explore?location=39.492298%2C-106.612721%2C5.49

Population data (for turning arrest data totals into rates for each county) obtained via https://dof.ca.gov/Forecasting/Demographics/estimates/

## Replication 
Exact replication of the Bureau of Justice statistics 2015 annual report of the National Crime Victimization Survey (https://bjs.ojp.gov/content/pub/pdf/cv15.pdf). We replicate the rate of violent victimization per 1,000 persons, the rate of serious violent crime involving weapons per 1,000 persons, the rate of property victimization per 1,000 households,
and the rate of robberies per 1,000 persons. 

Variance estimates for these rates are going to be calculated in the future, I'd really like to catch up on my sampling design and analysis knowledge with _Sampling Design and Analysis_ by 
Sharon Lohr first, since techniques for estimating variances using generalized variance functions are unfamiliar to me. Direct variance estimation procedures using NCVS data, to my knowledge
are not well documented for a beginner like myself, and NCVS documentation has given me the impression that generally generalized variance functions are used for their lack of complexity. 

I used a number of help resources to understand the dataset, as it is composed of 3 files, with millions of observations, and hundreds of variables. 

1. https://ncvs.bjs.ojp.gov/methodology#accuracy
2. Data Codebook included in the download for the data
3. https://bjs.ojp.gov/sites/g/files/xyckuh236/files/media/document/gvf_users_guide.pdf
