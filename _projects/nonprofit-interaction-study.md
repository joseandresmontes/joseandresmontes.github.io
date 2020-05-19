---
title: "Nonprofit Interaction Study"
header:
  image: images/post-1.jpg
  teaser: images/post-1.jpg
excerpt: Impact of Taxonomy and State of registration
---

## Introduction

According to the National Center for Charitable Statistics (NCCS), approximately 1.56 million nonprofits were registered with the Internal Revenue Service (IRS) in 2015, an increase of 10.4 percent from 2005.  In the same year, NCCS estimated that the nonprofit sector contributed an estimated 985.4 billion to the US economy, composing 5.4 percent of the country's gross domestic product. In this contribution, public charities or  501(c)(3)s accounted for over three-quarters of revenue and expenses for the nonprofit sector as a whole (1.98 trillion and 1.84 trillion, respectively), and just under two-thirds of the nonprofit sector's total assets (3.67 trillion).  Overall, the nonprofit charitable sector as a whole and public charities, in particular, seem to be growing and expanding.

Yet, the growth and expansion of the nonprofit sector are not shared equally. As it will be explored in this paper, taxonomy and where a nonprofit is located can play an important role in determining the levels of contributions. Taxonomy is used as a proxy for the cause of nonprofit which can be hard to decide on since there are sometimes multiple missions that a nonprofit is trying to achieve. Taxonomy which is sourced from the IRS, is a good proxy since it makes nonprofits pick the category that suits their organization establishing what the organization finds to be the priority among its possibly many missions. The states chosen in this paper were New York and Texas because they are similar enough to compare, have a large sample size of organizations, and are distinct enough to obtain interesting differences in interactions. They are similar in that they share large economies that are conducive to a large sample size (since more individuals will be able to donate). Additionally, they are distinct in culture and industries making interactions much more pronounced and easier to identify.
    
To explore whether or not there is an interaction between taxonomy and state of origin, this paper will employ a multilinear regression with an interaction term. Results in which interactions were statistically significant will be individually analyzed through themes of whether the interaction is driven by ideology or business-related explanations. Undergirding this exploratory analysis and method are the following two hypotheses.


## Hypothesis

1. Texas will contribute more to religious and agricultural business-related nonprofits
2. New York will contribute more to education and white-collar business-related nonprofits

The first hypothesis is based on the fact that Texas is more religious ideologically and one of its most influential industries being agribusiness. New York in the other hand, is relatively less religious, and business is driven primarily by white-collar sectors such as financial services.   

## Data and Methods

The Urban Institute provides the NCCS dataset. It allows independent users to access it through an R function, which outputs a csv file with the requested supported year and type of nonprofit organization. Released once per year, the NCCS Core Files represents the entire population of active, reporting organizations of the given type filing within a given year. The NCCS Core Files are separated into three sets, based on the type of organization: PC (Public Charity), PF (Private Foundation), and CO (all Other 501(c) organizations).  This research paper utilizes the 2015 NCCS Core public charity data set and follows recommendations for further curating the data. This included excluding organizations that are foreign-based but register with the IRS for compliance reasons.
    
Additionally, nonprofits with gross receipts under fifty thousand dollars were also filtered because they did are not required to fill out form 990. Even if they chose to fill out form 990, research has shown that they are often not done right. Other organizations report zero or the IRS internally set it. This figure allows organizations to nominally remain active which is often cheaper and easier to do than to have to reinstitute nonprofit status.  Lastly, only organizations with less than 10 million contributions, and more than 10 thousand contributions were analyzed because they trimmed many of the outliers in the data set. So, to ensure accuracy, only organizations that met these criteria were included.

## Variables of Interest

The dependent variable of the model is contribution. Contribution is the dependent variable, and it includes gifts and grants in terms of dollars. Contributions were logged to smooth distribution and allow for a better linear model fit in the regression. Below is a histogram with the distribution of contributions across both states and all organizations alongside a summary of descriptive statistics.

The independent variable of the model is state and taxonomy. As briefly explained in the introduction, the state of Texas and NY were chosen as proxies for liberal and conservative states, respectively. These two were highlighted because they boast both similar economic growth levels and populations. Politically however, both are projected as strongholds of the two completely different political parties, namely the republican and democrat parties which stand for conservative or liberal ideology, respectively. The number of organizations across both states is very similar, further supporting their candidacy as comparable proxies. Below is a bar chart displaying the distribution of organizations by state and a summary of descriptive statistics.

The other independent variable is taxonomy. Taxonomy is based on the National Taxonomy of Exempt Entities (NTEE) system, which the IRS and NCCS use to classify nonprofits. Codes are alphabetical and divide the universe of nonprofit organizations into 26 significant groups under ten broad categories as follows.

While the major group categories in this summary include the way that the IRS combines codes to paint a broader picture in the nonprofit charitable sector, in this analysis, they are taken individually because they are categorically dissimilar. For example, Environment and Animal group while on the same primary group, they are categorically dissimilar in what they cover to warrant keeping them apart. Below is a histogram table displaying the distribution of organizations by Taxonomy.
 
Cross tabulation (provided in appendix) and additional visualization display the similarities across the distribution of dependent variables and charitable contributions. Cross tabulation in the appendix shows that education was the category that reported the highest number of registered and active nonprofits (2615 or 16 percent) across both states and among other categories (17.6 percent). Mutual benefit nonprofits were the category of that reported the lowest number of registered and active nonprofits registration frequency across both states and among other categories. In terms of contributions by state, both New York and Texas reported similar spread, center, and ranges with New York being slightly higher across all measures except in range where limits were superimposed to exclude most outliers. This spread can be mostly explained by the relatively higher average GDP per capita in New York.