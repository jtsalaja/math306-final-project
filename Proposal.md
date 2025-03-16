MATH 306: Proposal
================
2025-03-16

## Proposal

### A brief description of the dataset

### Data visualisations

### A brief description of the topic that you are proposing to work with

### A brief description of the application that you are proposing to work with

``` r
library(dplyr)
library(mosaic)
library(ggplot2)
```

## Data

The dataset that we chose contains information on 500 startups, focusing
on various characteristics such as industry, funding, valuation,
revenue, market share, profitability, and geographic region. The
population of interest is startups across different sectors, and the
data includes 12 variables. Among these, numerical variables include
funding rounds, funding amount (in millions of USD), valuation (in
millions of USD), revenue (in millions of USD), number of employees,
market share percentage, and the year the startup was founded. These
variables provide insight into the financial and operational scale of
the startups. Categorical variables include startup name, industry
(e.g., AI, FinTech, HealthTech), profitability (binary indicator:
profitable or not), exit status (IPO, acquired, or private), and region
(e.g., Europe, South America, North America). We hope that this dataset
provides a diverse set of variables, both numerical and categorical,
that could be used for classification tasks aimed at understanding
startup performance and outcomes.

### Preparing dataset

``` r
startups <- read.csv("startup_data.csv")

colnames(startups) <- c("startup_name", "industry", "funding_rounds", "funding_amount", "valuation", "revenue", "employees", "market_share_percent", "profitable", "year_founded", "region", "exit_status")

colnames(startups)
```

    ##  [1] "startup_name"         "industry"             "funding_rounds"      
    ##  [4] "funding_amount"       "valuation"            "revenue"             
    ##  [7] "employees"            "market_share_percent" "profitable"          
    ## [10] "year_founded"         "region"               "exit_status"

## Data Visualisations

#### Funding amount vs. Valuation by Industry

``` r
ggplot(startups, aes(x = funding_amount, y = valuation, color = industry)) +
  geom_point() +
  scale_color_viridis_d() +
  labs(
    title = "Funding Amount vs. Valuation by Industry",
    x = "Funding Amount (M USD)",
    y = "Valuation (M USD)"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")
```

![](Proposal_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

This plot shows the relationship between funding and valuation, key
metrics for startup success. By separating the data by industry, we can
see which industries are more likely to attract higher funding and
achieve higher valuations.

#### Market Share Distribution by Region

``` r
ggplot(startups, aes(x = region, y = market_share_percent, fill = region)) +
  geom_boxplot() +
  scale_fill_viridis_d() +
  labs(
    title = "Market Share Distribution by Region",
    x = "Region",
    y = "Market Share (%)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
```

![](Proposal_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

This boxplot visualizes the distribution of market share across
different regions. It helps to compare the spread of market share within
each region and helps us see which regions have the highest and lowest
market share.

#### Employees vs. Revenue by Exit Status

``` r
ggplot(startups, aes(x = employees , y = revenue)) +
  geom_point(aes(color = exit_status), size = 3) +
  scale_color_viridis_d() +
  facet_wrap(~exit_status) +
  labs(
    title = "Employees vs. Revenue by Exit Status",
    x = "Employees",
    y = "Revenue (M USD)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
```

![](Proposal_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

This faceted scatter plot shows how employee count relates to revenue
within each exit status category. By faceting the data, we can examine
whether startups of different exit statuses tend to have different
relationships between these two variables. This could reveal trends,
such as whether large, high-revenue startups are more likely to be
acquired or go public.
