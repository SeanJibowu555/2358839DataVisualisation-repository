# Install the Shiny package from source
options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("shiny")

# Load the shiny package
library(shiny)

# Verify the loaded version
print(packageVersion("shiny"))

library(ggplot2)

# Define URLs for the datasets
url1 <- "https://github.com/SeanJibowu555/2358839DataVisualisation-repository/blob/8fb65634bf3d7fe44f15739f276ca6a3df969efa/Q1.csv"
url2 <- "https://github.com/SeanJibowu555/2358839DataVisualisation-repository/blob/8fb65634bf3d7fe44f15739f276ca6a3df969efa/q2.csv"
url3 <- "https://github.com/SeanJibowu555/2358839DataVisualisation-repository/blob/8fb65634bf3d7fe44f15739f276ca6a3df969efa/Q3.csv"
url4 <- "https://github.com/SeanJibowu555/2358839DataVisualisation-repository/blob/8fb65634bf3d7fe44f15739f276ca6a3df969efa/Q4.csv"

# Load the datasets
dataset1 <- read.csv(url1)
dataset2 <- read.csv(url2)
dataset3 <- read.csv(url3)
dataset4 <- read.csv(url4)

# Define the UI
ui <- fluidPage(
  titlePanel("Shiny App with GitHub Data"),
  sidebarLayout(
    sidebarPanel(
      # UI inputs can be added here
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Question 1", plotOutput("plot1")),  # Add a plot output for the first question
        tabPanel("Question 2", plotOutput("plot2")),  # Add a plot output for the second question
        tabPanel("Question 3", plotOutput("plot3")),  # Add a plot output for the third question
        tabPanel("Question 4", plotOutput("plot4"))   # Add a plot output for the fourth question
      )
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Render the plot for Question 1
  output$plot1 <- renderPlot({
    ggplot(dataset1, aes(x = SmokingStatus, y = SleepDuration)) +
      geom_boxplot() +
      labs(title = "Sleep Duration by Smoking Status", x = "Smoking Status", y = "Sleep Duration")
  })
  
  # Render the plot for Question 2
  output$plot2 <- renderPlot({
    ggplot(dataset2, aes(x = SomeVariable1, y = SomeVariable2)) +
      geom_point() +
      labs(title = "Title for Question 2 Plot", x = "X-axis Label", y = "Y-axis Label")
  })
  
  # Render the plot for Question 3
  output$plot3 <- renderPlot({
    ggplot(dataset3, aes(x = SomeVariable3, y = SomeVariable4)) +
      geom_bar(stat = "identity") +
      labs(title = "Title for Question 3 Plot", x = "X-axis Label", y = "Y-axis Label")
  })
  
  # Render the plot for Question 4
  output$plot4 <- renderPlot({
    ggplot(dataset4, aes(x = SomeVariable5, y = SomeVariable6)) +
      geom_line() +
      labs(title = "Title for Question 4 Plot", x = "X-axis Label", y = "Y-axis Label")
  })
}

# Create Shiny app
shinyApp(ui = ui, server = server)

     
