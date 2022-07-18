source("generateInputUI.R", local = TRUE)

server = function(input, output) {

  output$ui <- renderUI({
    if (is.null(input$hasDiagnosisCode))
      return()
    
    
    switch(input$hasDiagnosisCode,
           "1" = generateInputUI(input$apache_3j_bodysystem),
           "0" = h4("Gossis score cannot be calculated without an admission ICU diagnosis code.")
    )
  })

  output$input_type_text <- renderText({
    input$hasDiagnosisCode
  })

  output$dynamic_value <- renderPrint({
    switch(input$hasDiagnosisCode,
           "1" = as.data.frame(reactiveValuesToList(input)),
           "0" = "Gossis score cannot be calculated without an admission ICU diagnosis code.")
  })
  

  
  output$gossis_score <- renderText({
    validate(
      need(is.numeric(input$age), 'Age must be of type numeric')
    )
    data = as.data.frame(reactiveValuesToList(input))
    #write.csv(data, "~/Dropbox (MIT)/HST_UROP/data/output_data.csv")
    gossis_score = calculateGossisScore(data)
  })



}

calculateGossisScore = function(data){
  diff_vars = setdiff(names(template_data), names(data))
  diff_cols = setNames(data.frame(matrix(ncol = length(diff_vars), nrow = 1)), diff_vars)
  merged_data = cbind(data, diff_cols)
  merged_data$data_source = "eicu"
  merged_data$hospital_death = 1
  merged_data = merged_data %>% mutate(across(starts_with("d1_"), as.numeric))
  merged_data = merged_data %>% mutate(across(ends_with("_apache"), as.numeric))
  merged_data = merged_data %>% mutate(across(c(elective_surgery, aids, cirrhosis, diabetes_mellitus, lymphoma, solid_tumor_with_metastasis, hepatic_failure), as.numeric))
  merged_data = preprocess_data(merged_data)
  merged_data = impute_data(merged_data, algo=3)
  merged_data = prepare_fit(merged_data)
  merged_data$gossis_prediction = gpredict(gossis1_ihmp, merged_data)
  return(merged_data$gossis_prediction)
}

