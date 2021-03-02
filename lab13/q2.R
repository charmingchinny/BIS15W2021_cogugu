```{r}
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
