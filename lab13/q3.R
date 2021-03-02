```{r}
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

