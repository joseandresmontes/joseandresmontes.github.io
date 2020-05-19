---
title: "Credit Complaint NLP Analysis"
header:
  image: images/post-4.jpg
  teaser: images/post-4.jpg
excerpt: Sentiment and Topic Analysis on Complaint Database
categories:
  - Study
tags:
  - R
  - Finance
---

# Introduction

This article aims to showcase Natural Language Processing (NLP) methods to analyze sentiment and topics in complaints filed at the Consumer Financial Protection Bureau (CFPB). The techniques covered include data preprocessing, sentiment analysis, and topic modeling. The study focuses on the top three consumer credit agencies because of their data abundance, similar market size, and importance in the personal finance field. Findings show that there is a rise in complaints overall with no discernable difference in sentiment across the three agencies. All agencies however had opinionated negative complaints. Topic modeling found identity theft as an emerging topic since 2017.

## Data

The data used was from the Consumer Complaint Database publicly available at the CFPB website. The Consumer Complaint Database is a collection of complaints about consumer financial products and services that we sent to companies for response. The data is structured across 18 features with over 1582037 fields. All the features contain data pertaining to a consumer complaint out of which date, company, product, and complaint are the only features being considered in this project. The data feature is of the date & time data type, is used to subset data annually. The company feature is a string containing the name of the business with whom a consumer filed a complaint against. The product feature is a string factor of 18 categories which describes the financial products and services of the complaint. Lastly, the complaint feature is a string of a redacted and shortened complaint. 

## Methodology

## Results

# Code