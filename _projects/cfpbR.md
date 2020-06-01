---
title: "CFPB API Client"
header:
  image: images/post-6.jpg
  teaser: images/post-6.jpg
excerpt: Access complaint Data in R from CFPB
---

## cfbpR
The Consumer Financial Protection Bureau (CFPB) regulates the offering and provision of consumer financial products or services under the federal consumer financial laws and educates and empowers consumers to make better informed financial decisions. This package aims to make the complaint database of the bureau available to R users. 
___

## Installation and Setup
Install the latest version from github as follows.

```
devtools::install_github('JoseAndresMontes/cfbpR')
```

The API is open data that requires no credentials to access. This API client has set up supported parameters to output an R friendly version of the available data.
Click [here](https://cfpb.github.io/api/ccdb/api.html) to learn more about the API.
 
## Basic Usage
cfpbR provides easy to use function for the API service, with API parameters as function arguments. GetConsumerComplaints function gathers all available complaint data.

For example:

```
data <- GetConsumerComplaints()
```

## Disclaimer
This R API client was developed independently and is not related directly to any project of the agency. Issues should not be directed to the agency, but instead be directly posted on this repository.
