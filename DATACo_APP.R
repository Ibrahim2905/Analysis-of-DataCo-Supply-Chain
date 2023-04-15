ui <- fluidPage(
  titlePanel("Supply Chain Analysis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("plot_type", "Select Plot Type",
                  choices = c("Order Item Discount Distribution" = "Order Item Discount Distribution",
                              "Count of Mode of Transaction" = "Count of Mode of Transaction",
                              "Average Time Delivery" = "Average Time Delivery",
                              "Total number of orders from different product category" = "Total number of orders from different product category",
                              "Number of Orders from different product categories" = "Number of Orders from different product categories"),
                  selected = "Order Item Discount Distribution")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  
  # Render plot based on user selection
  output$plot <- renderPlot({
    plot_type <- input$plot_type
    
    if (plot_type == "Order Item Discount Distribution") {
      ggplot(supply_chain, aes(x = Order.Item.Discount)) +
        geom_histogram(binwidth = 1, fill = "blue", color = "black") +
        labs(title = "Order Item Discount Distribution",
             x = "Order Item Discount",
             y = "Count")
    } else if (plot_type == "Count of Mode of Transaction") {
      pie(type_count)
      title(main = "Count of Mode of Transaction")
    } else if (plot_type == "Average Time Delivery") {
      bwplot(~Days.for.shipping..real., data = supply_chain)
    } else if (plot_type == "Total number of orders from different product category") {
      fig
    } else if (plot_type == "Number of Orders from different product categories") {
      fig2
    }
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)





