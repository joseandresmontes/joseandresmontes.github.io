---
title: "Nonprofit Charity Navigator API Client"
header:
  image: images/post-2.jpg
  teaser: images/post-2.jpg
excerpt: Access Data in R from Charity Navigator
categories:
  - Tool
tags:
  - R
  - Nonprofit
---

## CharityNavigatoR

Charity Navigator is the largest and most-utilized charity evaluator in America. The organization helps guide intelligent giving by evaluating the Financial Health, Accountability and Transparency of over 9,000 charities and provides basic data on the rest of the 1.8 million U.S. nonprofits. Charity Navigator accepts no advertising or donations from the organizations it evaluates, ensuring unbiased evaluations, nor does it charge the public for this trusted data. As a result, Charity Navigator, a non-profit 501 (c) (3) public charity itself, depends on support from individuals, corporations and foundations that believe it provides a much-needed service to America's charitable givers.

This package will provide access to the new API that Charity Navigator has created. I am managing this R package ad-hoc and it is in early. If you need more robust or customizable access, please consult the online API schematic.

## Installation and Setup
Install the latest version from github as follows.

```r
devtools::install_github('JoseAndresMontes/CharityNavigatoR')
```

Each subscriber to Charity Navigator API is uniquely identified by an ID and Key sequence, and every request to the API requires both of these credentials. After loading the CharityClient package, you should set your ID and Key in your environment as shown below. This facilitates API calls without needing to specify your ID and Key every time.

```r
library(CharityNavigatoR)
R.home(component = "home")
usethis::edit_r_environ()`
```

Then set your ID and Key exactly like this
```r
CHARITY_APP_ID = x #ID Sequence
CHARITY_APP_KEY = y #Key Sequence
```
Click [here](https://charity.3scale.net/login) to register with Charity Navigator and receive your credentials.
 
## Basic Usage
CharityClient provides easy to use function for the API service, with API parameters as function arguments. GetOrganization function gathers all available data. GetIRS function gathers all IRS data available.

For example:

```r
table <- GetOrganizations("CA")
```

```r
>table$charityName
[1] "Oliver's Rescue Mission"                                  
 [2] "Religious Science Church Center of San Diego"             
 [3] "PILGRIM BAPTIST CHURCH"                                   
 [4] "Saint Andrew Church"                                      
 [5] "AMERICAN FEDERATION OF STATE COUNTY & MUNICIPAL EMPLOYEES"
 [6] "Friends of Incontri in Terra Di Siena Inc."               
 [7] "American Chesapeake Club Charitable Tr"                   
 [8] "Southern Low Desert Resource Conservation and Dev Council"
 [9] "National Preservation and Conservation Foundation"        
[10] "Tak-Ko Lu Foundation"      

> table$irsClassification.classification
 [1] NA                         "Religious Organization"   "Religious Organization"  
 [4] "Charitable Organization"  "Labor Organization"       "Charitable Organization" 
 [7] "Educational Organization" "Charitable Organization"  "Charitable Organization" 
[10] "Charitable Organization"

```

```r
table <- GetIRS(state="CA")
```

```r
table$deductibility
 [1] NA                                 "Contributions are deductible"    
 [3] "Contributions are deductible"     "Contributions are deductible"    
 [5] "Contributions are not deductible" "Contributions are deductible"    
 [7] "Contributions are deductible"     "Contributions are deductible"    
 [9] "Contributions are deductible"     "Contributions are deductible" 
```

Be sure to check out the [API documentation](https://charity.3scale.net/docs/data-api/reference#api-documentation) to learn more about the available services. 
