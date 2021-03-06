---
title: "Lab 14 Homework"
author: "Chinyere Ogugu"
date: "2021-03-05"
output: 
  html_document: 
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(qtl)
library(qtlcharts)
library(tidyverse)
library(ggmap)
library(here)
```

**1. We have a satellite collars on a number of different individuals and want to be able to quickly look at all of their recent movements at once. Please load all the data files from `us_individual_collar_data` and use for loop to create plots for all different individuals of the path they move on longitude and latitude.**

```r
US_collar<- list.files("data/us_individual_collar_data", pattern = "collar-data-*", full.names = TRUE)
```


```r
US_collar2 <- list.files("data/us_individual_collar_data", full.names = TRUE)
US_collar2
```

```
##  [1] "data/us_individual_collar_data/collar-data-A1-2016-02-26.txt" 
##  [2] "data/us_individual_collar_data/collar-data-B2-2016-02-26.txt" 
##  [3] "data/us_individual_collar_data/collar-data-C3-2016-02-26.txt" 
##  [4] "data/us_individual_collar_data/collar-data-D4-2016-02-26.txt" 
##  [5] "data/us_individual_collar_data/collar-data-E5-2016-02-26.txt" 
##  [6] "data/us_individual_collar_data/collar-data-F6-2016-02-26.txt" 
##  [7] "data/us_individual_collar_data/collar-data-G7-2016-02-26.txt" 
##  [8] "data/us_individual_collar_data/collar-data-H8-2016-02-26.txt" 
##  [9] "data/us_individual_collar_data/collar-data-I9-2016-02-26.txt" 
## [10] "data/us_individual_collar_data/collar-data-J10-2016-02-26.txt"
```

```r
for (i in 1:length(US_collar2)){
  data0 <- as.data.frame(read_csv(US_collar2[i]))
  print(
    ggplot(data0, aes(x=long,y=lat))+
      geom_path()+
      geom_point()+
      labs(title = US_collar2[i], x = "longitude", y = "latitude")
  )
}
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-3.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-5.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-6.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-7.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-8.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-3-9.png)<!-- -->![](lab14_hw_files/figure-html/unnamed-chunk-3-10.png)<!-- -->
<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

**2. Please load all the data files from `us_individual_collar_data` and combine all data into one data frame. Create a summary to show what is the maximum and minimum of recorded data points on longitude and latitude.**

```r
US_collar3 <- vector(mode = "integer", length = length(US_collar))

for (i in 1:length(US_collar)){
  data0 <- read_csv(US_collar[i])
  count <- nrow(data0)
  US_collar3[i] <- count
}
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```r
US_collar3
```

```
##  [1] 24 24 24 24 24 24 24 24 24 24
```

```r
US_collar3 <- data.frame(file_name = vector(mode = "character", length = length(US_collar)),
                      count = vector(mode = "integer", length = length(US_collar)))
for (i in 1:length(US_collar)){
  data0 <- read_csv(US_collar[i])
  count <- nrow(data0)
  US_collar3[i] <- count
US_collar3$file_name[i]<-US_collar[i]
US_collar3$count
}
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```r
US_collar3
```

```
##                                                        file_name count V3 V4 V5
## 1   data/us_individual_collar_data/collar-data-A1-2016-02-26.txt    24 24 24 24
## 2   data/us_individual_collar_data/collar-data-B2-2016-02-26.txt    24 24 24 24
## 3   data/us_individual_collar_data/collar-data-C3-2016-02-26.txt    24 24 24 24
## 4   data/us_individual_collar_data/collar-data-D4-2016-02-26.txt    24 24 24 24
## 5   data/us_individual_collar_data/collar-data-E5-2016-02-26.txt    24 24 24 24
## 6   data/us_individual_collar_data/collar-data-F6-2016-02-26.txt    24 24 24 24
## 7   data/us_individual_collar_data/collar-data-G7-2016-02-26.txt    24 24 24 24
## 8   data/us_individual_collar_data/collar-data-H8-2016-02-26.txt    24 24 24 24
## 9   data/us_individual_collar_data/collar-data-I9-2016-02-26.txt    24 24 24 24
## 10 data/us_individual_collar_data/collar-data-J10-2016-02-26.txt    24 24 24 24
##    V6 V7 V8 V9 V10
## 1  24 24 24 24  24
## 2  24 24 24 24  24
## 3  24 24 24 24  24
## 4  24 24 24 24  24
## 5  24 24 24 24  24
## 6  24 24 24 24  24
## 7  24 24 24 24  24
## 8  24 24 24 24  24
## 9  24 24 24 24  24
## 10 24 24 24 24  24
```


**3. Use the range of the latitude and longitude from Q2 to build an appropriate bounding box for your map and load a map from `stamen` in a terrain style projection and display the map. Then, build a final map that overlays the recorded path from Q1.**

```r
US_collar2 <- list.files("data/us_individual_collar_data", full.names = TRUE)
US_collar2
```

```
##  [1] "data/us_individual_collar_data/collar-data-A1-2016-02-26.txt" 
##  [2] "data/us_individual_collar_data/collar-data-B2-2016-02-26.txt" 
##  [3] "data/us_individual_collar_data/collar-data-C3-2016-02-26.txt" 
##  [4] "data/us_individual_collar_data/collar-data-D4-2016-02-26.txt" 
##  [5] "data/us_individual_collar_data/collar-data-E5-2016-02-26.txt" 
##  [6] "data/us_individual_collar_data/collar-data-F6-2016-02-26.txt" 
##  [7] "data/us_individual_collar_data/collar-data-G7-2016-02-26.txt" 
##  [8] "data/us_individual_collar_data/collar-data-H8-2016-02-26.txt" 
##  [9] "data/us_individual_collar_data/collar-data-I9-2016-02-26.txt" 
## [10] "data/us_individual_collar_data/collar-data-J10-2016-02-26.txt"
```

```r
for (i in 1:length(US_collar2)){
  data0 <- as.data.frame(read_csv(US_collar2[i]))
  print(
    ggplot(data0, aes(x=long,y=lat))+
      geom_path()+
      geom_point()+
      labs(title = US_collar2[i], x = "longitude", y = "latitude")
  )
}
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-3.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-4.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-5.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-6.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-7.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-8.png)<!-- -->

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   X1 = col_double(),
##   date = col_date(format = ""),
##   collar = col_character(),
##   time = col_datetime(format = ""),
##   lat = col_double(),
##   long = col_double()
## )
```

![](lab14_hw_files/figure-html/unnamed-chunk-6-9.png)<!-- -->![](lab14_hw_files/figure-html/unnamed-chunk-6-10.png)<!-- -->
</div>

## Load the Data
We will use the data from an experiment on hypertension in the mouse [Sugiyama et al., Genomics 71:70-77, 2001](https://www.sciencedirect.com/science/article/pii/S0888754300964012?via%3Dihub)

```r
?hyper
```

```
## starting httpd help server ... done
```

```r
data(hyper)
```

**4. Create a summary of the hypertension data. How many individuals and phenotypes are included in this data set? How many gene markers and chromosomes are included in this data set? Please create a table to show the number of markers on each chromosome.**

```r
summary(hyper)
```

```
##     Backcross
## 
##     No. individuals:    250 
## 
##     No. phenotypes:     2 
##     Percent phenotyped: 100 100 
## 
##     No. chromosomes:    20 
##         Autosomes:      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
##         X chr:          X 
## 
##     Total markers:      174 
##     No. markers:        22 8 6 20 14 11 7 6 5 5 14 5 5 5 11 6 12 4 4 4 
##     Percent genotyped:  47.7 
##     Genotypes (%):    
##           Autosomes:    BB:50.1  BA:49.9 
##        X chromosome:    BY:53.0  AY:47.0
```


```r
markers <- nmar(hyper)
hyper1 <- data.frame(chromosome = 1:20,      
                   No_of_markers = markers)
hyper1
```

```
##    chromosome No_of_markers
## 1           1            22
## 2           2             8
## 3           3             6
## 4           4            20
## 5           5            14
## 6           6            11
## 7           7             7
## 8           8             6
## 9           9             5
## 10         10             5
## 11         11            14
## 12         12             5
## 13         13             5
## 14         14             5
## 15         15            11
## 16         16             6
## 17         17            12
## 18         18             4
## 19         19             4
## X          20             4
```

**5. Please make an interactive genetic map of markers for the hypertension data.**

```r
iplotMap(hyper)
```

```
## Set screen size to height=700 x width=1000
```

```{=html}
<div id="htmlwidget-83beeec17b13b7d2dad4" style="width:672px;height:480px;" class="iplotMap html-widget"></div>
<script type="application/json" data-for="htmlwidget-83beeec17b13b7d2dad4">{"x":{"data":{"chr":["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","2","2","2","2","2","2","2","2","3","3","3","3","3","3","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","5","5","5","5","5","5","5","5","5","5","5","5","5","5","6","6","6","6","6","6","6","6","6","6","6","7","7","7","7","7","7","7","8","8","8","8","8","8","9","9","9","9","9","10","10","10","10","10","11","11","11","11","11","11","11","11","11","11","11","11","11","11","12","12","12","12","12","13","13","13","13","13","14","14","14","14","14","15","15","15","15","15","15","15","15","15","15","15","16","16","16","16","16","16","17","17","17","17","17","17","17","17","17","17","17","17","18","18","18","18","19","19","19","19","X","X","X","X"],"pos":[3.3,19.7,32.8,35,37.2,41.5,43.7,43.7,49.2,54.6,64.5,67.8,69.9,74.3,75.4,82,82,82,82,86.3,94,115.8,7.7,17.5,29.5,49.2,54.6,66.7,85.2,98.4,2.2,17.5,37.2,44.8,57.9,66.7,0,14.2,16.4,17.5,18.6,21.9,23,23,25.1,28.4,29.5,30.6,31.7,31.7,32.8,33.9,35,47,56.8,74.3,0,5.5,10.9,14.2,15.3,18.6,32.8,51.4,60.1,66.7,73.2,74.3,77.6,82,0,9.8,21.9,25.1,29.5,40.4,51.4,56.8,63.4,65.6,66.7,1.1,13.1,26.2,28.4,37.2,53.6,55.6,6.6,19.7,33.9,40.4,59,75.4,12,24,40.4,56.8,68.9,2.2,15.3,50.3,69.9,75.4,2.2,4.4,4.4,8.7,8.7,10.9,13.1,17.5,17.5,19.7,25.1,43.7,60.1,80.9,1.1,16.4,23,40.4,56.8,5.7,7.7,16.4,40.4,59,0,16.4,36.1,52.5,67.8,5.5,5.5,7.7,13.1,16.4,16.4,17.5,17.5,29.5,55.7,63.4,0,25.1,31.7,32.8,51.4,51.4,1.1,1.1,1.1,2.2,3.3,3.3,5.5,6.6,10.9,19.7,33.9,50.3,2.2,14.2,26.2,37.2,0,17.5,32.8,55.7,1.1,20.8,29.5,43.7],"marker":["D1Mit296","D1Mit123","D1Mit156","D1Mit178","D1Mit19","D1Mit7","D1Mit46","D1Mit132","D1Mit334","D1Mit305","D1Mit26","D1Mit94","D1Mit218","D1Mit100","D1Mit102","D1Mit14","D1Mit105","D1Mit159","D1Mit267","D1Mit15","D1Mit456","D1Mit155","D2Mit359","D2Mit82","D2Mit241","D2Mit14","D2Mit62","D2Mit280","D2Mit229","D2Mit266","D3Mit164","D3Mit6","D3Mit11","D3Mit14","D3Mit44","D3Mit19","D4Mit149","D4Mit41","D4Mit108","D4Mit237","D4Mit286","D4Mit214","D4Mit53","D4Mit89","D4Mit111","D4Mit288","D4Mit164","D4Mit178","D4Mit80","D4Mit81","D4Mit276","D4Mit152","D4Mit302","D4Mit175","D4Mit16","D4Mit14","D5Mit193","D5Mit61","D5Mit387","D5Mit148","D5Mit13","D5Mit55","D5Mit312","D5Mit188","D5Mit213","D5Mit31","D5Mit99","D5Mit101","D5Mit409","D5Mit169","D6Mit86","D6Mit273","D6Mit188","D6Mit8","D6Mit213","D6Mit36","D6Mit135","D6Mit59","D6Mit295","D6Mit201","D6Mit15","D7Mit306","D7Mit25","D7Mit297","D7Mit30","D7Mit37","D7Mit71","D7Nds4","D8Mit3","D8Mit292","D8Mit25","D8Mit45","D8Mit271","D8Mit156","D9Mit297","D9Mit27","D9Mit8","D9Mit24","D9Mit18","D10Mit166","D10Mit214","D10Mit11","D10Mit14","D10Mit297","D11Mit74","D11Mit2","D11Mit78","D11Mit79","D11Mit80","D11Mit82","D11Mit163","D11Mit110","D11Mit136","D11Mit20","D11Mit310","D11Mit35","D11Mit67","D11Mit48","D12Mit37","D12Mit110","D12Mit34","D12Mit118","D12Mit20","D13Mit16","D13Mit59","D13Mit91","D13Mit148","D13Mit78","D14Mit48","D14Mit14","D14Mit37","D14Mit7","D14Mit266","D15Mit11","D15Mit175","D15Mit53","D15Mit111","D15Mit56","D15Mit22","D15Mit206","D15Mit152","D15Mit156","D15Mit108","D15Mit79","D16Mit32","D16Mit4","D16Mit171","D16Mit5","D16Mit70","D16Mit106","D17Mit164","D17Mit143","D17Mit57","D17Mit113","D17Mit131","D17Mit46","D17Mit45","D17Mit23","D17Mit11","D17Mit10","D17Mit53","D17Mit221","D18Mit67","D18Mit17","D18Mit50","D18Mit4","D19Mit59","D19Mit40","D19Mit53","D19Mit137","DXMit55","DXMit22","DXMit16","DXMit130"],"chrname":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","X"]},"chartOpts":{"shiftStart":false}},"evals":[],"jsHooks":[]}</script>
```

**6. Make a plot shows the pattern of missing genotype data in the hypertension dataset. Please reorder the recorded individuals according to their blood pressure phenotypes. Is there a specific pattern of missing genotype? Please explain it.**

```r
plotMissing(hyper, main="", reorder=1)
```

![](lab14_hw_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

**7. Based on your answer from previous question, you probably noticed that there are gene markers without data. Please use the function `drop.nullmarkers` to remove markers that have no genotype data. After this, make a new summary to show the number of markers on each chromosome. How many gene markers were dropped? Where were the dropped markers located? Please use the data without nullmarkers for the following questions.**

```r
hyper_dropnull <- drop.nullmarkers(hyper)
summary(hyper_dropnull)
```

```
##     Backcross
## 
##     No. individuals:    250 
## 
##     No. phenotypes:     2 
##     Percent phenotyped: 100 100 
## 
##     No. chromosomes:    20 
##         Autosomes:      1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
##         X chr:          X 
## 
##     Total markers:      173 
##     No. markers:        22 8 6 20 14 11 7 6 5 5 14 5 5 4 11 6 12 4 4 4 
##     Percent genotyped:  48 
##     Genotypes (%):    
##           Autosomes:    BB:50.1  BA:49.9 
##        X chromosome:    BY:53.0  AY:47.0
```

```r
plotMissing(hyper_dropnull, main="", reorder=1)
```

![](lab14_hw_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

**8. Please conduct single-QTL analysis and create a table to give the maximum LOD score on each chromosome based on their blood pressure phenotypes. Which gene marker has the higiest LOD score? Which chromosome contains the gene marker that has the highest LOD score? Then, creates an interactive chart with LOD curves from a genome scan for all chromosomes.**

```r
hyper_qtl <- calc.genoprob(hyper, step=1)
hyper_qtlanalysis <-scanone(hyper_qtl)
summary(hyper_qtlanalysis)
```

```
##           chr  pos   lod
## c1.loc45    1 48.3 3.529
## c2.loc45    2 52.7 1.612
## c3.loc33    3 35.2 0.784
## D4Mit164    4 29.5 8.094
## c5.loc68    5 68.0 1.554
## c6.loc23    6 23.0 1.862
## D7Mit297    7 26.2 0.400
## D8Mit271    8 59.0 0.791
## D9Mit18     9 68.9 0.750
## c10.loc8   10 10.2 0.261
## c11.loc36  11 38.2 0.668
## D12Mit37   12  1.1 0.429
## D13Mit78   13 59.0 0.313
## D14Mit7    14 52.5 0.106
## c15.loc14  15 19.5 1.730
## D16Mit70   16 51.4 0.370
## D17Mit46   17  3.3 0.207
## D18Mit17   18 14.2 0.506
## D19Mit59   19  0.0 0.792
## cX.loc38    X 39.1 0.998
```

```r
plot(hyper_qtlanalysis, ylab="LOD Score")
```

![](lab14_hw_files/figure-html/unnamed-chunk-15-1.png)<!-- -->
<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

**9. Based on your genome scan results, create a table which only includes those chromosomes with LOD > 1. Creates an interactive chart with LOD curves linked to estimated QTL effects for only those chromosomes with LOD > 1. Find the gene maker with the highest LOD score and describe how does the genetype of this marker influence the individual's phenotype.**

```r
summary(hyper_qtlanalysis, threshold=1)
```

```
##           chr  pos  lod
## c1.loc45    1 48.3 3.53
## c2.loc45    2 52.7 1.61
## D4Mit164    4 29.5 8.09
## c5.loc68    5 68.0 1.55
## c6.loc23    6 23.0 1.86
## c15.loc14  15 19.5 1.73
```

```r
iplotScanone(hyper_qtlanalysis, chr =c(1,2,4,5,6,15))
```

```{=html}
<div id="htmlwidget-1c159ec5293c75b724fa" style="width:672px;height:480px;" class="iplotScanone html-widget"></div>
<script type="application/json" data-for="htmlwidget-1c159ec5293c75b724fa">{"x":{"scanone_data":{"chr":["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","4","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","6","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15"],"pos":[3.3,4.3,5.3,6.3,7.3,8.3,9.3,10.3,11.3,12.3,13.3,14.3,15.3,16.3,17.3,18.3,19.3,19.7,20.3,21.3,22.3,23.3,24.3,25.3,26.3,27.3,28.3,29.3,30.3,31.3,32.3,32.8,33.3,34.3,35,35.3,36.3,37.2,37.3,38.3,39.3,40.3,41.3,41.5,42.3,43.3,43.7,43.7,44.3,45.3,46.3,47.3,48.3,49.2,49.3,50.3,51.3,52.3,53.3,54.3,54.6,55.3,56.3,57.3,58.3,59.3,60.3,61.3,62.3,63.3,64.3,64.5,65.3,66.3,67.3,67.8,68.3,69.3,69.9,70.3,71.3,72.3,73.3,74.3,74.3,75.3,75.4,76.3,77.3,78.3,79.3,80.3,81.3,82,82,82,82,82.3,83.3,84.3,85.3,86.3,86.3,87.3,88.3,89.3,90.3,91.3,92.3,93.3,94,94.3,95.3,96.3,97.3,98.3,99.3,100.3,101.3,102.3,103.3,104.3,105.3,106.3,107.3,108.3,109.3,110.3,111.3,112.3,113.3,114.3,115.3,115.8,7.7,8.7,9.7,10.7,11.7,12.7,13.7,14.7,15.7,16.7,17.5,17.7,18.7,19.7,20.7,21.7,22.7,23.7,24.7,25.7,26.7,27.7,28.7,29.5,29.7,30.7,31.7,32.7,33.7,34.7,35.7,36.7,37.7,38.7,39.7,40.7,41.7,42.7,43.7,44.7,45.7,46.7,47.7,48.7,49.2,49.7,50.7,51.7,52.7,53.7,54.6,54.7,55.7,56.7,57.7,58.7,59.7,60.7,61.7,62.7,63.7,64.7,65.7,66.7,66.7,67.7,68.7,69.7,70.7,71.7,72.7,73.7,74.7,75.7,76.7,77.7,78.7,79.7,80.7,81.7,82.7,83.7,84.7,85.2,85.7,86.7,87.7,88.7,89.7,90.7,91.7,92.7,93.7,94.7,95.7,96.7,97.7,98.4,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,14.2,15,16,16.4,17,17.5,18,18.6,19,20,21,21.9,22,23,23,23,24,25,25.1,26,27,28,28.4,29,29.5,30,30.6,31,31.7,31.7,32,32.8,33,33.9,34,35,35,36,37,38,39,40,41,42,43,44,45,46,47,47,48,49,50,51,52,53,54,55,56,56.8,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,74.3,0,1,2,3,4,5,5.5,6,7,8,9,10,10.9,11,12,13,14,14.2,15,15.3,16,17,18,18.6,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32.8,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,51.4,52,53,54,55,56,57,58,59,60,60.1,61,62,63,64,65,66,66.7,67,68,69,70,71,72,73,73.2,74,74.3,75,76,77,77.6,78,79,80,81,82,82,0,1,2,3,4,5,6,7,8,9,9.8,10,11,12,13,14,15,16,17,18,19,20,21,21.9,22,23,24,25,25.1,26,27,28,29,29.5,30,31,32,33,34,35,36,37,38,39,40,40.4,41,42,43,44,45,46,47,48,49,50,51,51.4,52,53,54,55,56,56.8,57,58,59,60,61,62,63,63.4,64,65,65.6,66,66.7,5.5,5.5,6.5,7.5,7.7,8.5,9.5,10.5,11.5,12.5,13.1,13.5,14.5,15.5,16.4,16.4,16.5,17.5,17.5,17.5,18.5,19.5,20.5,21.5,22.5,23.5,24.5,25.5,26.5,27.5,28.5,29.5,29.5,30.5,31.5,32.5,33.5,34.5,35.5,36.5,37.5,38.5,39.5,40.5,41.5,42.5,43.5,44.5,45.5,46.5,47.5,48.5,49.5,50.5,51.5,52.5,53.5,54.5,55.5,55.7,56.5,57.5,58.5,59.5,60.5,61.5,62.5,63.4],"lod":[0.41174,0.42569,0.43856,0.45005,0.45987,0.46774,0.47345,0.47683,0.47775,0.47617,0.47213,0.46571,0.45708,0.44647,0.43417,0.42047,0.40572,0.3996,0.45082,0.54331,0.64359,0.74992,0.86024,0.97231,1.084,1.1933,1.2985,1.3984,1.492,1.5786,1.6577,1.6944,1.7071,1.6918,1.652,1.8438,2.4599,2.9441,2.9507,3.0106,3.0599,3.099,3.1282,3.1329,3.231,3.3175,3.3422,3.3422,3.3871,3.4473,3.4906,3.5178,3.5295,3.5267,3.511,3.3297,3.1027,2.8263,2.4983,2.1244,2.0066,2.0598,2.1248,2.176,2.2134,2.2373,2.248,2.2462,2.2322,2.2068,2.1708,2.1624,2.5847,2.9784,3.2576,3.3629,3.3429,3.2207,3.0964,3.1721,3.2998,3.3387,3.2942,3.1759,3.1759,3.2163,3.2198,3.3638,3.4558,3.477,3.4315,3.3253,3.1662,3.0291,3.0291,3.0292,3.0292,2.9574,2.6759,2.331,1.9331,1.5125,1.5125,1.4993,1.4827,1.4623,1.4377,1.4085,1.3743,1.3345,1.3031,1.2945,1.2636,1.2292,1.1914,1.1503,1.1062,1.0592,1.0096,0.95777,0.9041,0.84899,0.7929,0.73633,0.67978,0.62378,0.56884,0.51544,0.46402,0.41498,0.36863,0.32522,0.28491,0.26594,0.22479,0.26456,0.30634,0.34861,0.38964,0.42773,0.46144,0.48973,0.51202,0.52818,0.53687,0.54396,0.57922,0.61374,0.64701,0.67853,0.70785,0.7346,0.75849,0.77927,0.79684,0.81112,0.82213,0.82866,0.83923,0.89252,0.94594,0.99872,1.05,1.099,1.1449,1.187,1.2245,1.2569,1.2838,1.3048,1.3197,1.3284,1.3309,1.3274,1.3182,1.3036,1.2843,1.2608,1.2477,1.3398,1.4976,1.5946,1.6124,1.5517,1.4452,1.4487,1.4796,1.5021,1.5149,1.5171,1.5079,1.4871,1.4549,1.4118,1.3586,1.2969,1.2284,1.1551,1.1551,1.0506,0.94549,0.84046,0.7365,0.6347,0.53627,0.44253,0.35487,0.27467,0.20323,0.1417,0.090904,0.051367,0.023231,0.0063054,6.4385e-05,0.0037624,0.016493,0.025937,0.027007,0.029188,0.031405,0.033631,0.035837,0.038001,0.040082,0.042058,0.043903,0.045595,0.047118,0.048457,0.049613,0.050309,2.0619,2.3173,2.5826,2.8534,3.1257,3.3955,3.6598,3.9158,4.1616,4.3956,4.6166,4.8236,5.0155,5.1916,5.3507,5.3804,5.5238,5.5317,5.4854,6.5634,6.5579,6.5364,6.5093,6.5726,6.7016,6.7941,6.8497,6.7947,5.8422,5.8422,5.8422,6.2185,6.3167,6.3079,6.2903,6.2546,6.2033,6.1784,7.4728,8.0937,7.6406,6.3749,6.3483,5.1376,5.1376,5.1199,4.8876,4.8664,4.7649,4.6946,3.7287,3.7287,3.6753,3.6169,3.5533,3.4844,3.4101,3.3303,3.2451,3.1544,3.0584,2.957,2.8506,2.7396,2.7396,2.8489,2.9331,2.9865,3.0054,2.9873,2.9319,2.8408,2.7173,2.5672,2.433,2.4441,2.4964,2.5425,2.5815,2.6125,2.6349,2.6482,2.652,2.6461,2.6305,2.6053,2.5708,2.5272,2.4751,2.4153,2.3484,2.2756,2.1977,2.1736,0.37286,0.36829,0.35234,0.32502,0.2884,0.24633,0.22466,0.20702,0.17296,0.14101,0.1117,0.085523,0.064921,0.066246,0.08013,0.095027,0.11073,0.11395,0.14927,0.163,0.20267,0.26052,0.31259,0.33804,0.31808,0.26856,0.22031,0.1743,0.13159,0.093324,0.060576,0.034305,0.015234,0.0037821,1.5798e-08,0.0036044,0.014026,0.030491,0.04742,0.048961,0.057103,0.065963,0.075525,0.08576,0.096621,0.10805,0.11999,0.13236,0.14508,0.15805,0.1712,0.18442,0.19763,0.21074,0.22368,0.23638,0.24877,0.26079,0.26549,0.27591,0.29321,0.31029,0.32701,0.34323,0.35882,0.37368,0.38771,0.40085,0.40211,0.55232,0.73973,0.93395,1.1217,1.2946,1.4488,1.5448,1.5489,1.5541,1.5465,1.5273,1.4975,1.4584,1.4112,1.4009,1.3833,1.3524,1.3664,1.3626,1.3296,1.2961,1.3192,1.3598,1.3756,1.3671,1.3353,1.3353,0.11721,0.17826,0.25552,0.34671,0.44628,0.54623,0.63824,0.71576,0.7751,0.81554,0.83534,0.85432,0.95086,1.049,1.1469,1.2429,1.3357,1.424,1.5069,1.5839,1.6545,1.7184,1.7756,1.8212,1.8278,1.862,1.8505,1.8054,1.7993,1.6725,1.4983,1.291,1.06,0.9416,0.96863,1.0201,1.0669,1.1074,1.1405,1.165,1.1801,1.1853,1.1807,1.1666,1.1437,1.1323,1.1426,1.1547,1.1594,1.1562,1.1442,1.1235,1.094,1.0565,1.0118,0.96128,0.90637,0.88355,0.90184,0.91753,0.91395,0.8919,0.85381,0.8142,0.83358,0.92506,0.99991,1.0491,1.0668,1.0519,1.0082,0.98427,0.94664,0.7874,0.64101,0.66672,0.65953,1.0675,1.0675,0.93131,0.77795,0.74597,0.8289,0.93355,1.037,1.1371,1.2322,1.2863,1.3055,1.3425,1.363,1.3673,1.3673,1.4195,1.7054,1.7054,1.7054,1.7234,1.7298,1.7229,1.7015,1.6647,1.6122,1.5443,1.4623,1.368,1.2646,1.1558,1.0458,1.0458,1.0491,1.0512,1.0519,1.0511,1.0488,1.0447,1.0388,1.031,1.0213,1.0095,0.99575,0.97996,0.96219,0.9425,0.92098,0.89775,0.87296,0.84679,0.81943,0.7911,0.76203,0.73245,0.7026,0.67271,0.64298,0.61363,0.60782,0.66056,0.72486,0.78521,0.83952,0.88608,0.92353,0.95096,0.96666],"marker":["D1Mit296","","","","","","","","","","","","","","","","","D1Mit123","","","","","","","","","","","","","","D1Mit156","","","D1Mit178","","","D1Mit19","","","","","","D1Mit7","","","D1Mit46","D1Mit132","","","","","","D1Mit334","","","","","","","D1Mit305","","","","","","","","","","","D1Mit26","","","","D1Mit94","","","D1Mit218","","","","","","D1Mit100","","D1Mit102","","","","","","","D1Mit14","D1Mit105","D1Mit159","D1Mit267","","","","","","D1Mit15","","","","","","","","D1Mit456","","","","","","","","","","","","","","","","","","","","","","","D1Mit155","D2Mit359","","","","","","","","","","D2Mit82","","","","","","","","","","","","","D2Mit241","","","","","","","","","","","","","","","","","","","","","D2Mit14","","","","","","D2Mit62","","","","","","","","","","","","","","D2Mit280","","","","","","","","","","","","","","","","","","","D2Mit229","","","","","","","","","","","","","","D2Mit266","D4Mit149","","","","","","","","","","","","","","","D4Mit41","","","D4Mit108","","D4Mit237","","D4Mit286","","","","D4Mit214","","","D4Mit53","D4Mit89","","","D4Mit111","","","","D4Mit288","","D4Mit164","","D4Mit178","","D4Mit80","D4Mit81","","D4Mit276","","D4Mit152","","","D4Mit302","","","","","","","","","","","","","D4Mit175","","","","","","","","","","D4Mit16","","","","","","","","","","","","","","","","","","","D4Mit14","D5Mit193","","","","","","D5Mit61","","","","","","D5Mit387","","","","","D5Mit148","","D5Mit13","","","","D5Mit55","","","","","","","","","","","","","","","D5Mit312","","","","","","","","","","","","","","","","","","","","D5Mit188","","","","","","","","","","D5Mit213","","","","","","","D5Mit31","","","","","","","","D5Mit99","","D5Mit101","","","","D5Mit409","","","","","","D5Mit169","D6Mit86","","","","","","","","","","D6Mit273","","","","","","","","","","","","","D6Mit188","","","","","D6Mit8","","","","","D6Mit213","","","","","","","","","","","","D6Mit36","","","","","","","","","","","","D6Mit135","","","","","","D6Mit59","","","","","","","","D6Mit295","","","D6Mit201","","D6Mit15","D15Mit11","D15Mit175","","","D15Mit53","","","","","","D15Mit111","","","","D15Mit56","D15Mit22","","","D15Mit206","D15Mit152","","","","","","","","","","","","","D15Mit156","","","","","","","","","","","","","","","","","","","","","","","","","","","D15Mit108","","","","","","","","D15Mit79"],"chrname":["1","2","4","5","6","15"],"lodname":"lod"},"pxg_data":null,"pxg_type":"none","chartOpts":null},"evals":[],"jsHooks":[]}</script>
```
### The higher the LOD score the higher chance that a gene can be linked to a certain phenotype, that genotype has a higher chance of expressing high blood pressure. 

**10. Please save your interactive chart from Q9 as a html file `hyper_iplotScanone.html` and make sure your upload it to your github repository with your lab14 homework as well.**

</div>

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
