# Crime-Analysis
Exact replication of the Bureau of Justice statistics 2015 annual report of the National Crime Victimization Survey (https://bjs.ojp.gov/content/pub/pdf/cv15.pdf). We replicate the rate of violent victimization per 1,000 persons, the rate of serious violent crime involving weapons per 1,000 persons, the rate of property victimization per 1,000 households,
and the rate of robberies per 1,000 persons. 

Variance estimates for these rates are going to be calculated in the future, I'd really like to catch up on my sampling design and analysis knowledge with _Sampling Design and Analysis_ by 
Sharon Lohr first, since techniques for estimating variances using generalized variance functions are unfamiliar to me. Direct variance estimation procedures using NCVS data, to my knowledge
are not well documented for a beginner like myself, and NCVS documentation has given me the impression that generally generalized variance functions are used for their lack of complexity. 

I used a number of help resources to understand the dataset, as it is composed of 3 files, with millions of observations, and hundreds of variables. 

1. https://ncvs.bjs.ojp.gov/methodology#accuracy
2. Data Codebook included in the download for the data
3. https://bjs.ojp.gov/sites/g/files/xyckuh236/files/media/document/gvf_users_guide.pdf
