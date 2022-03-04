---
title: "ESG Quick Analysis"
header:
  image: images/esg-quick-analysis/teaser.jpg
  teaser: images/esg-quick-analysis/teaser.jpg
excerpt: Quick Fun ESG Charts 
---

# Inntroduction

## Candidate

Jose Andres Montes Lopez

## Context

As part of an upcoming interview, I am preparing a quick analysis of a few funds to highlight 
basic quantitative and data visualizations using R.

The short analyses below leverage an amazing existing package called `tidyquant` which consolidates
a variety of analytic, manipulation, and visualization packages. In particular, it provides quick access
to a comprehensive set data sources such as Bloomberg and Yahoo Finance. Another convenient feature of the package is the integration of `dplyr` which is the most popular data manipulation package in R. 

The data used is from Yahoo Finance and it covers the full 2020 calendar year. The funds selected feature an ESG strategy that is applied to the S&P 500 so I selected the IVV which is another iShare ETF which tracks the S&P 500 making it an ideal benchmark for the analyses.

## Results

![image-center](/images/esg-quick-analysis/chart-1.png){: .align-center}


# Code

## Data Import

```
library(tidyquant)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(dplyr)
```

```
stock_prices <- c("SUSA", "IVV","XVV") %>%
    tq_get(get  = "stock.prices",
           from = "2020-01-01",
           to   = "2020-12-31") %>%
    group_by(symbol) 
```

## Data Manipulation Chart 1

```
stock_prices %>%
    tq_transmute(adjusted, 
                 periodReturn, 
                 period = "daily", 
                 type = "log", 
                 col_rename = "returns") %>%
    mutate(wealth.index = 100 * cumprod(1 + returns)) %>%
    ggplot(aes(x = date, y = wealth.index, color = symbol)) +
    geom_line(size = 1) +
    labs(title = "Stock Prices") +
    theme_tq() + 
    scale_color_tq()
```

## Data Manipulation Chart 2

```
stock_prices %>%
group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = to.period, 
                 period     = "months")
stock_prices %>%
    ggplot(aes(x = date, y = adjusted, color = symbol)) +
    geom_line(size = 1) +
    labs(title = "Monthly Stock Prices",
         x = "", y = "Adjusted Prices", color = "") +
    facet_wrap(~ symbol, ncol = 2, scales = "free_y") +
    scale_y_continuous(labels = scales::dollar) +
    theme_tq() + 
    scale_color_tq()
```

## Data Manipulation Chart 3

```
Stock_macd <- stock_prices %>%
    group_by(symbol) %>%
    tq_mutate(select     = close, 
              mutate_fun = MACD, 
              nFast      = 12, 
              nSlow      = 26, 
              nSig       = 9, 
              maType     = SMA) %>%
    mutate(diff = macd - signal) %>%
    select(-(open:volume))
Stock_macd
```

## Data Manipulation Chart 4

```
Stock_macd %>%
    filter(date >= as_date("2016-10-01")) %>%
    ggplot(aes(x = date)) + 
    geom_hline(yintercept = 0, color = palette_light()[[1]]) +
    geom_line(aes(y = macd, col = symbol)) +
    geom_line(aes(y = signal), color = "blue", linetype = 2) +
    geom_bar(aes(y = diff), stat = "identity", color = palette_light()[[1]]) +
    facet_wrap(~ symbol, ncol = 2, scale = "free_y") +
    labs(title = "Select Sustainable Funds & S&P 500 Fund: Moving Average Convergence Divergence",
         y = "MACD", x = "", color = "") +
    theme_tq() +
    scale_color_tq()
```

## Data Manipulation Chart 5

```
Stock_max_by_qtr <- stock_prices %>%
    group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = apply.quarterly, 
                 FUN        = max, 
                 col_rename = "max.close") %>%
    mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
    select(-date)
Stock_max_by_qtr

Stock_min_by_qtr <- stock_prices %>%
    group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = apply.quarterly, 
                 FUN        = min, 
                 col_rename = "min.close") %>%
    mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
    select(-date)

Stock_by_qtr <- left_join(FANG_max_by_qtr, FANG_min_by_qtr,
                         by = c("symbol"   = "symbol",
                                "year.qtr" = "year.qtr"))
Stock_by_qtr

Stock_by_qtr %>%
    ggplot(aes(x = year.qtr, color = symbol)) +
    geom_segment(aes(xend = year.qtr, y = min.close, yend = max.close),
                 size = 1) +
    geom_point(aes(y = max.close), size = 2) +
    geom_point(aes(y = min.close), size = 2) +
    facet_wrap(~ symbol, ncol = 2, scale = "free_y") +
    labs(title = "Select Sustainable Funds & S&P 500 Fund: Min/Max Price By Quarter",
         y = "Stock Price", color = "") +
    theme_tq() +
    scale_color_tq() +
    scale_y_continuous(labels = scales::dollar) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1),
          axis.title.x = element_blank())
```

## Data Manipulation Table 1 

```
Ra <- c("SUSA", "XVV") %>%
    tq_get(get  = "stock.prices",
           from = "2010-01-01",
           to   = "2015-12-31") %>%
    group_by(symbol) %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Ra")
Ra

Rb <- "IVV" %>%
    tq_get(get  = "stock.prices",
           from = "2010-01-01",
           to   = "2015-12-31") %>%
    tq_transmute(select     = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Rb")
Rb

RaRb <- left_join(Ra, Rb, by = c("date" = "date"))
RaRb
```

## Data Manipulation Table 2

```
RaRb_capm <- RaRb %>%
    tq_performance(Ra = Ra, 
                   Rb = Rb, 
                   performance_fun = table.CAPM)
RaRb_capm
```