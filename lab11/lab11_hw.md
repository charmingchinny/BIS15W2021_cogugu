---
title: "Lab 11 Homework"
author: "Chinyere Ogugu"
date: "2021-03-15"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

**In this homework, you should make use of the aesthetics you have learned. It's OK to be flashy!**

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(here)
library(naniar)
library(skimr)
```

## Resources
The idea for this assignment came from [Rebecca Barter's](http://www.rebeccabarter.com/blog/2017-11-17-ggplot2_tutorial/) ggplot tutorial so if you get stuck this is a good place to have a look.  

## Gapminder
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use. This is the same data that we will use for midterm 2 so this is good practice.

```r
#install.packages("gapminder")
library("gapminder")
```

## Questions
The questions below are open-ended and have many possible solutions. Your approach should, where appropriate, include numerical summaries and visuals. Be creative; assume you are building an analysis that you would ultimately present to an audience of stakeholders. Feel free to try out different `geoms` if they more clearly present your results.  

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NA's are treated in the data.**  

```r
skim(gapminder)
```


Table: Data summary

|                         |          |
|:------------------------|:---------|
|Name                     |gapminder |
|Number of rows           |1704      |
|Number of columns        |6         |
|_______________________  |          |
|Column type frequency:   |          |
|factor                   |2         |
|numeric                  |4         |
|________________________ |          |
|Group variables          |None      |


**Variable type: factor**

|skim_variable | n_missing| complete_rate|ordered | n_unique|top_counts                             |
|:-------------|---------:|-------------:|:-------|--------:|:--------------------------------------|
|country       |         0|             1|FALSE   |      142|Afg: 12, Alb: 12, Alg: 12, Ang: 12     |
|continent     |         0|             1|FALSE   |        5|Afr: 624, Asi: 396, Eur: 360, Ame: 300 |


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|        mean|           sd|       p0|        p25|        p50|         p75|         p100|hist  |
|:-------------|---------:|-------------:|-----------:|------------:|--------:|----------:|----------:|-----------:|------------:|:-----|
|year          |         0|             1|     1979.50|        17.27|  1952.00|    1965.75|    1979.50|     1993.25|       2007.0|▇▅▅▅▇ |
|lifeExp       |         0|             1|       59.47|        12.92|    23.60|      48.20|      60.71|       70.85|         82.6|▁▆▇▇▇ |
|pop           |         0|             1| 29601212.32| 106157896.74| 60011.00| 2793664.00| 7023595.50| 19585221.75| 1318683096.0|▇▁▁▁▁ |
|gdpPercap     |         0|             1|     7215.33|      9857.45|   241.17|    1202.06|    3531.85|     9325.46|     113523.1|▇▁▁▁▁ |

**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**

```r
gapminder %>% 
  group_by(year) %>% 
  summarize(mean_lifeExp=mean(lifeExp))
```

```
## # A tibble: 12 x 2
##     year mean_lifeExp
##  * <int>        <dbl>
##  1  1952         49.1
##  2  1957         51.5
##  3  1962         53.6
##  4  1967         55.7
##  5  1972         57.6
##  6  1977         59.6
##  7  1982         61.5
##  8  1987         63.2
##  9  1992         64.2
## 10  1997         65.0
## 11  2002         65.7
## 12  2007         67.0
```


```r
gapminder %>% 
  group_by(year) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
   ggplot(aes(x = as.factor(year), y=mean_lifeExp, group = 1)) +
  geom_line()+ 
  labs(title = "Change in Life Expectancy", x = "Year", y = "Ave. Life Expectancy")
```

![](lab11_hw_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

**3. How do the distributions of life expectancy compare for the years 1952 and 2007?**

```r
gapminder %>% 
  filter(year== 1952 | year ==2007) %>% 
  mutate(year=as.factor(year)) %>% 
  ggplot(aes(x = lifeExp, group=year, fill =year)) +
  geom_density(alpha  =0.6, color = "black")+
  labs(title = "Comparison of Distribution of Life Expectancy", x="life expectancy", y="Distribution")
```

![](lab11_hw_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

```r
gapminder %>% 
  group_by(continent, year) %>% 
  filter(between(year, 1952, 2007)) %>% 
  summarize(min=min(lifeExp), mean=mean(lifeExp), max=max(lifeExp))
```

```
## `summarise()` has grouped output by 'continent'. You can override using the `.groups` argument.
```

```
## # A tibble: 60 x 5
## # Groups:   continent [5]
##    continent  year   min  mean   max
##    <fct>     <int> <dbl> <dbl> <dbl>
##  1 Africa     1952  30    39.1  52.7
##  2 Africa     1957  31.6  41.3  58.1
##  3 Africa     1962  32.8  43.3  60.2
##  4 Africa     1967  34.1  45.3  61.6
##  5 Africa     1972  35.4  47.5  64.3
##  6 Africa     1977  36.8  49.6  67.1
##  7 Africa     1982  38.4  51.6  69.9
##  8 Africa     1987  39.9  53.3  71.9
##  9 Africa     1992  23.6  53.6  73.6
## 10 Africa     1997  36.1  53.6  74.8
## # ... with 50 more rows
```



**5. How has life expectancy changed between 1952-2007 for each continent?**

```r
gapminder %>% 
  group_by(year,continent) %>% 
  summarize(mean=mean(lifeExp)) %>% 
   ggplot(aes(x = year, y=mean, group= continent, color=continent)) +
  geom_line()+
  labs(title = "Change in Life Expectancy by Continent")
```

```
## `summarise()` has grouped output by 'year'. You can override using the `.groups` argument.
```

![](lab11_hw_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

```r
gapminder %>% 
  ggplot(aes(x=lifeExp, y=gdpPercap))+ geom_point(size= .01) + scale_y_log10() + geom_smooth(method = lm, se=F)+ labs(title = "GDP vs Life Expectancy", x="Life Expectancy", y="GDP per Capita")
```

```
## `geom_smooth()` using formula 'y ~ x'
```

![](lab11_hw_files/figure-html/unnamed-chunk-10-1.png)<!-- -->


**7. Which countries have had the largest population growth since 1952?**

```r
gapminder %>% 
  select(country, year, pop) %>% 
  filter(year==1952 | year==2007) %>% 
  pivot_wider(names_from = year, names_prefix = "year_", values_from = pop) %>% mutate(popgrowth=year_2007-year_1952) %>% arrange(desc(popgrowth))
```

```
## # A tibble: 142 x 4
##    country       year_1952  year_2007 popgrowth
##    <fct>             <int>      <int>     <int>
##  1 China         556263527 1318683096 762419569
##  2 India         372000000 1110396331 738396331
##  3 United States 157553000  301139947 143586947
##  4 Indonesia      82052000  223547000 141495000
##  5 Brazil         56602560  190010647 133408087
##  6 Pakistan       41346560  169270617 127924057
##  7 Bangladesh     46886859  150448339 103561480
##  8 Nigeria        33119096  135031164 101912068
##  9 Mexico         30144317  108700891  78556574
## 10 Philippines    22438691   91077287  68638596
## # ... with 132 more rows
```

**8. Use your results from the question above to plot population growth for the top five countries since 1952.**

```r
gapminder %>% 
  filter(country=="China" | country== "India" | country == "United States" | country == "Indonesia" | country == "Brazil") %>% 
  select(country, year, pop) %>% 
  ggplot(aes(x=year, y=pop, color=country))+ geom_line()+ theme(plot.title=element_text(hjust=1), axis.text.x = element_text(angle = 50, hjust=.5))+ labs(title= "Population Growth since 1952", x="year", y="population")
```

![](lab11_hw_files/figure-html/unnamed-chunk-12-1.png)<!-- -->
**9. How does per-capita GDP growth compare between these same five countries?**

```r
gapminder %>% 
  filter(country=="China"| country=="India" | country=="United States" | country=="Indonesia" | country=="Brazil") %>% 
  select(year, country, gdpPercap) %>% 
  ggplot(aes(x=year, y=gdpPercap, group=country, color=country))+
  geom_line()+ labs (title= "GDP per Capita since 1952",x="year" , y= "gdp per capita")
```

![](lab11_hw_files/figure-html/unnamed-chunk-13-1.png)<!-- -->
# Didn't use faceting
**10. Make one plot of your choice that uses faceting!**

```r
gapminder %>% 
  select(country, year, pop) %>% 
  filter(year==2007) %>% arrange(desc(pop))
```

```
## # A tibble: 142 x 3
##    country        year        pop
##    <fct>         <int>      <int>
##  1 China          2007 1318683096
##  2 India          2007 1110396331
##  3 United States  2007  301139947
##  4 Indonesia      2007  223547000
##  5 Brazil         2007  190010647
##  6 Pakistan       2007  169270617
##  7 Bangladesh     2007  150448339
##  8 Nigeria        2007  135031164
##  9 Japan          2007  127467972
## 10 Mexico         2007  108700891
## # ... with 132 more rows
```

```r
gapminder %>% 
   select(country, year, pop) %>% 
  filter(year==2007) %>% 
  top_n(10, country) %>% 
  ggplot(aes(x=reorder(country,pop), y=pop))+ geom_col(fill= "skyblue2")+ theme_classic() +coord_flip()+ 
  labs(title= "Most Populated Countries (2007)", x= "Country", y="Population")
```

![](lab11_hw_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
