---
title: "Lab 13 Homework"
author: "Chinyere Ogugu"
date: "2021-03-03"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Libraries

```r
if (!require("tidyverse")) install.packages('tidyverse')
```

```
## Loading required package: tidyverse
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## √ ggplot2 3.3.3     √ purrr   0.3.4
## √ tibble  3.1.0     √ dplyr   1.0.4
## √ tidyr   1.1.3     √ stringr 1.4.0
## √ readr   1.4.0     √ forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```


```r
library(tidyverse)
library(shiny)
library(shinydashboard)
library(janitor)
```

## Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admissions <- readr::read_csv("data/UC_admit.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   Campus = col_character(),
##   Academic_Yr = col_double(),
##   Category = col_character(),
##   Ethnicity = col_character(),
##   `Perc FR` = col_character(),
##   FilteredCountFR = col_double()
## )
```

```r
UC_admit <- janitor::clean_names(UC_admissions) %>% 
  filter(ethnicity != "All")
```

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**  


```r
summary(UC_admit)
```

```
##     campus           academic_yr     category          ethnicity        
##  Length:1890        Min.   :2010   Length:1890        Length:1890       
##  Class :character   1st Qu.:2012   Class :character   Class :character  
##  Mode  :character   Median :2014   Mode  :character   Mode  :character  
##                     Mean   :2014                                        
##                     3rd Qu.:2017                                        
##                     Max.   :2019                                        
##                                                                         
##    perc_fr          filtered_count_fr
##  Length:1890        Min.   :    1    
##  Class :character   1st Qu.:  337    
##  Mode  :character   Median : 1324    
##                     Mean   : 4082    
##                     3rd Qu.: 5012    
##                     Max.   :34707    
##                     NA's   :1
```

```r
unique(UC_admit$campus)
```

```
## [1] "Davis"         "Berkeley"      "Irvine"        "Los_Angeles"  
## [5] "Merced"        "Riverside"     "San_Diego"     "Santa_Barbara"
## [9] "Santa_Cruz"
```

```r
unique(UC_admit$ethnicity)
```

```
## [1] "International"    "Unknown"          "White"            "Asian"           
## [5] "Chicano/Latino"   "American Indian"  "African American"
```

```r
UC_admit
```

```
## # A tibble: 1,890 x 6
##    campus academic_yr category   ethnicity        perc_fr filtered_count_fr
##    <chr>        <dbl> <chr>      <chr>            <chr>               <dbl>
##  1 Davis         2019 Applicants International    21.16%              16522
##  2 Davis         2019 Applicants Unknown          2.51%                1959
##  3 Davis         2019 Applicants White            18.39%              14360
##  4 Davis         2019 Applicants Asian            30.76%              24024
##  5 Davis         2019 Applicants Chicano/Latino   22.44%              17526
##  6 Davis         2019 Applicants American Indian  0.35%                 277
##  7 Davis         2019 Applicants African American 4.39%                3425
##  8 Davis         2018 Applicants International    19.87%              15507
##  9 Davis         2018 Applicants Unknown          2.83%                2208
## 10 Davis         2018 Applicants White            18.96%              14797
## # ... with 1,880 more rows
```



**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to make the app neat and clean.**

```r
UC_admit %>% 
  ggplot(aes(x=campus,y = filtered_count_fr, fill = ethnicity ))+ geom_col(size = 4)+ scale_y_log10()
```

```
## Warning: Removed 1 rows containing missing values (position_stack).
```

![](lab13_hw_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


```r
ui <- dashboardPage(
  dashboardHeader(title = "University Admissions"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
  selectInput("x", "Select Variable ", choices = c("campus", "academic_yr", "category"), 
              selected = "campus"),
    
  ), 
  box(title = "University of California Admissions by Ethnicity", x= "x", y="Filtered Count" , width = 10,
  plotOutput("plot", width = "600px", height = "500px")
  ) 
  ) 
  ) 
) 

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
  ggplot(UC_admit, aes_string(x = input$x, y = "filtered_count_fr", fill ="ethnicity")) + scale_y_log10()+
  geom_col()+ theme_light()+ labs()
  })
  
  session$onSessionEnded(stopApp)
  }

shinyApp(ui, server)
```

```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}


**3. Make alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "University Admissions"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
      selectInput("x", "Select Category", choices= c("campus", "ethnicity", "category"),   
  selected = "campus"), 
  ),
  box(title = "University of California Admissions by Year", width = 10,
  plotOutput("plot", width = "600px", height = "500px")
  ) 
  ) 
  ) 
)

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    UC_admit %>% 
      filter(academic_yr==input$x)
  ggplot(UC_admit, aes_string(x = "academic_yr", y = "filtered_count_fr", fill=input$"x")) +
  geom_col()+ theme_light()
  })
  
  session$onSessionEnded(stopApp)
  }

shinyApp(ui, server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
