ui <- fluidPage(
  
  # App title ----
  titlePanel("Gossis Score Calculator"),
  
  #Dynamic Columns
  fluidRow(
    
    column(2, wellPanel(
      radioButtons("hasDiagnosisCode", label = "Do you have an admission diagnosis code?",
                              choices = c("Yes" = 1,
                                          "No" = 0),
                              selected = 1),
      
      selectInput("apache_3j_bodysystem",
                  h5("Bodysystem"),
                  choices = list("Cardiovascular", "Gastrointestinal", "Hematological", "Metabolic", "Neurological", "Renal/Genitourinary", "Respiratory", "Trauma", "Muscoskeletal/Skin disease", "Undefined"))
    )),
    
    column(6, wellPanel(
      # This outputs the dynamic UI component
      uiOutput("ui")
    )),
    
    column(4,
           tags$p("Input type:"),
           verbatimTextOutput("input_type_text"),
           tags$p("Dynamic input value:"),
           verbatimTextOutput("dynamic_value")
           # tags$p("Predicted GOSSIS Score"),
           # verbatimTextOutput("gossis_score")
    )
  ),
  
    # Main panel for displaying outputs ----
    mainPanel(
      h3("Gossis Score: "),
      textOutput("gossis_score")
    )
)


