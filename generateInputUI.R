
generateInputUI = function(bodysystem){
  fluidPage(
    fluidRow(
      column(12, wellPanel(
        
        numericInput("age",
             h5("Age"),
             value = 65),
        
        
        selectInput("apache_3j_diagnosis",
                    h5(paste("ICU Admit Diagnosis: ", bodysystem)),
                    choices = getApacheDx(bodysystem) ) ,
        
        selectInput("icu_admit_source",
                    h5("ICU Admit Source"),
                    choices = list("Accident & Emergency",
                                   "Floor Operating Room / Recovery",
                                   "Other Hospital",
                                   "Other ICU")),
        radioButtons("elective_surgery", 
                     h5("Was Patient Admitted for Elective Surgery?"),
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0)
        )
        
      )),
    
    h4("Vital Signs", offset = 2),
    VitalSignsInputs(),
    
    h4("Lab Tests", offset = 2),
    LabTestsInputs(),
    
    h4("Arterial Blood Gas (ABG) Tests", offset = 2),
    ABGInputs(),
    
    h4("Comorbidities", offset = 2),
    h5("Do you have the following comorbidities?"),
    ComorbInputs(),
    
    h4("Other"),
    OtherInputs(),
    
    submitButton("Submit"),
    p("Click the button to submit your values.")
  )

}

VitalSignsInputs = function(){
  return(list(
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_heartrate_min",
                     h5("Heartrate (min)"),
                     value = 0, min = 0, max = 350),
        
        numericInput("d1_heartrate_max",
                     h5("Heartrate (max)"),
                     value = 0, min = 0, max = 350),
        
        numericInput("heart_rate_apache",
                     h5("Heartrate Apache"),
                     value = 0, min = 0, max = 300))),
      
      column(4, wellPanel(
        numericInput("d1_resprate_min",
                     h5("Resprate (min)"),
                     value = 0, min = 0, max = 300),
        
        numericInput("d1_resprate_max",
                     h5("Resprate (max)"),
                     value = 0, min = 0, max = 300),
        
        numericInput("resprate_apache",
                     h5("Resprate Apache"),
                     value = 0, min = 0, max = 80))),
      
      column(4, wellPanel(
        numericInput("d1_temp_min",
                     h5("Temperature (min)"),
                     value = 30, min = 25, max = 46),
        
        numericInput("d1_temp_max",
                     h5("Temperature (max)"),
                     value = 30, min = 15, max = 46),
        
        numericInput("temp_apache",
                     h5("Temperature Apache"),
                     value = 30, min = 25, max = 46)))
    ),
    
    fluidRow(    
      column(3, wellPanel(
        numericInput("d1_spo2_min",
                     h5("SpO2 (min)"),
                     value = 0, min = 0, max = 100),
        
        numericInput("d1_spo2_max",
                     h5("SpO2 (max)"),
                     value = 0, min = 0, max = 100)),
      ),
      
      column(3, wellPanel(
        numericInput("d1_sysbp_min",
                     h5("Systolic BP (min)"),
                     value = 0, min = 0, max = 400),
        
        numericInput("d1_sysbp_max",
                     h5("Systolic BP (max)"),
                     value = 0, min = 0, max = 400)),
      ),
      
      column(3, wellPanel(
        numericInput("d1_diasbp_min",
                     h5("Diastolic BP (min)"),
                     value = 0, min = 0, max = 300),
        
        numericInput("d1_diasbp_max",
                     h5("Diastolic BP (max)"),
                     value = 0, min = 0, max = 300)),
      ),
      
      column(3, wellPanel(
        numericInput("d1_mbp_min",
                     h5("MBP (min)"),
                     value = 0, min = 0, max = 300),
        
        numericInput("d1_mbp_max",
                     h5("MBP (max)"),
                     value = 0, min = 0, max = 300)),
      )
    )
  ))
}

LabTestsInputs = function(){
  return(list(
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_albumin_min",
                     h5("Albumin (min)"),
                     value = 1.5, min = 0.5, max = 6.5, step = 0.1),
        
        numericInput("d1_albumin_max",
                     h5("Albumin (max)"),
                     value = 1.5, min = 0.5, max = 6.5, step = 0.1),
        
        numericInput("albumin_apache",
                     h5("Albumin Apache"),
                     value = 3.0, min = 0.5, max = 6.5, step = 0.1))),
      
      column(4, wellPanel(
        numericInput("d1_bilirubin_min",
                     h5("Bilirubin (min)"),
                     value = 0.6, min = 0.2, max = 60, step = 0.1),
        
        numericInput("d1_bilirubin_max",
                     h5("Bilirubin (max)"),
                     value = 0.6, min = 0.2, max = 60, step = 0.1),
        
        numericInput("bilirubin_apache",
                     h5("Bilirubin Apache"),
                     value = 1.2, min = 0.2, max = 60, step = 0.1))),
      
      column(4, wellPanel(
        numericInput("d1_bun_min",
                     h5("Blood Urea Nitrogen (min)"),
                     value = 23.4, min = 1, max = 300),
        
        numericInput("d1_bun_max",
                     h5("Blood Urea Nitrogen (max)"),
                     value = 23.4, min = 1, max = 300),
        
        numericInput("bun_apache",
                     h5("Blood Urea Nitrogen Apache"),
                     value = 0)))
    ),
    
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_creatinine_min",
                     h5("Creatinine (min)"),
                     value = 0.7, min = 0.1, max = 30, step = 0.1),
        
        numericInput("d1_creatinine_max",
                     h5("Creatinine (max)"),
                     value = 0.7, min = 0.1, max = 30, step = 0.1),
        
        numericInput("creatinine_apache",
                     h5("Creatinine Apache"),
                     value = 0.8, min = 0.1, max = 25, step = 0.1))),
      
      column(4, wellPanel(
        numericInput("d1_glucose_min",
                     h5("Glucose (min)"),
                     value = 96, min = 0, max = 2000),
        
        numericInput("d1_glucose_max",
                     h5("Glucose (max)"),
                     value = 96, min = 0, max = 2000),
        
        numericInput("glucose_apache",
                     h5("Glucose Apache"),
                     value = 100, min = 10, max = 900))),
      
      column(4, wellPanel(
        numericInput("d1_hematocrit_min",
                     h5("Hematocrit (min)"),
                     value = 40, min = 5, max = 75),
        
        numericInput("d1_hematocrit_max",
                     h5("Hematocrit (max)"),
                     value = 40, min = 5, max = 75),
        
        numericInput("hematocrit_apache",
                     h5("Hematocrit Apache"),
                     value = 40, min = 5, max = 75)))
    ),
    
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_sodium_min",
                     h5("Sodium (min)"),
                     value = 145, min = 90, max = 215),
        
        numericInput("d1_sodium_max",
                     h5("Sodium (max)"),
                     value = 145, min = 90, max = 215),
        
        numericInput("sodium_apache",
                     h5("Sodium Apache"),
                     value = 145, min = 100, max = 215))),
      
      column(4, wellPanel(
        numericInput("d1_wbc_min",
                     h5("White Blood Cell (min)"),
                     value = 10, min = 0, max = 300),
        
        numericInput("d1_wbc_max",
                     h5("White Blood Cell (max)"),
                     value = 10, min = 0, max = 300),
        
        numericInput("wbc_apache",
                     h5("White Blood Cell Apache"),
                     value = 10, min = 0, max = 300))),
      
      column(4, wellPanel(
        numericInput("d1_calcium_min",
                     h5("Calcium (min)"),
                     value = 2.5, min = 0, max = 150, step = 0.1),
        
        numericInput("d1_calcium_max",
                     h5("Calcium (max)"),
                     value = 2.5, min = 0, max = 150, step = 0.1)))
    ),
    
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_inr_min",
                     h5("INR (min)"),
                     value = 1, min = 0, max = 25),
        
        numericInput("d1_inr_max",
                     h5("INR (max)"),
                     value = 1, min = 0, max = 25))),
      
      column(4, wellPanel(
        numericInput("d1_hco3_min",
                     h5("Bicarbonate (min)"),
                     value = 30, min = 0, max = 80),
        
        numericInput("d1_hco3_max",
                     h5("Bicarbonate (max)"),
                     value = 30, min = 0, max = 80))),
      
      column(4, wellPanel(
        numericInput("d1_hemaglobin_min",
                     h5("Hemaglobin (min)"),
                     value = 10, min = 0, max = 100),
        
        numericInput("d1_hemaglobin_max",
                     h5("Hemaglobin (max)"),
                     value = 10, min = 0, max = 100)))
    ),
    
    fluidRow(     
      column(4, wellPanel(
        numericInput("d1_lactate_min",
                     h5("Lactate (min)"),
                     value = 1, min = 0, max = 30),
        
        numericInput("d1_lactate_max",
                     h5("Lactate (max)"),
                     value = 1, min = 0, max = 30))),
      
      column(4, wellPanel(
        numericInput("d1_platelets_min",
                     h5("Platelets (min)"),
                     value = 200, min = 0, max = 2000),
        
        numericInput("d1_platelets_max",
                     h5("Platelets (max)"),
                     value = 200, min = 0, max = 2000))),
      
      column(4, wellPanel(
        numericInput("d1_potassium_min",
                     h5("Potassium (min)"),
                     value = 3.8, min = 0.05, max = 12, step = 0.01),
        
        numericInput("d1_potassium_max",
                     h5("Potassium (max)"),
                     value = 3.8, min = 0.05, max = 12, step = 0.01)))
    )
  
  ))
}

ABGInputs = function(){
  return(list(
    
    fluidRow(
      column(4, wellPanel(
        numericInput("d1_arterial_ph_min",
                     h5("Arterial pH (min)"),
                     value = 7.4, min = 6.5, max = 8, step = 0.01),
        
        numericInput("d1_arterial_ph_max",
                     h5("Arterial pH (max)"),
                     value = 7.4, min = 6.5, max = 8, step = 0.01),
        
        numericInput("ph_apache",
                     h5("Arterial pH Apache"),
                     value = 7.4, min = 6.5, max = 8, step = 0.01))),
      
      column(4, wellPanel(
        numericInput("d1_arterial_po2_min",
                     h5("Arterial pO2 (min)"),
                     value = 80, min = 15, max = 720),
        
        numericInput("d1_arterial_ph_max",
                     h5("Arterial pO2 (max)"),
                     value = 80, min = 15, max = 720),
        
        numericInput("pao2_apache",
                     h5("Arterial pO2 Apache"),
                     value = 80, min = 15, max = 720))),
      
      column(4, wellPanel(
        numericInput("d1_arterial_pco2_min",
                     h5("Arterial pH (min)"),
                     value = 40, min = 5, max = 250),
        
        numericInput("d1_arterial_pco2_max",
                     h5("Arterial pH (max)"),
                     value = 40, min = 5, max = 250),
        
        numericInput("paco2_apache",
                     h5("Arterial Partial CO2 Apache"),
                     value = 40, min = 5, max = 250)))
    ),
    
    fluidRow(
      column(4, wellPanel(
        numericInput("d1_pao2fio2ratio_min",
                     h5("Arterial pH (min)"),
                     value = 275, min = 15, max = 3000),
        
        numericInput("d1_pao2fio2ratio_max",
                     h5("Arterial pH (max)"),
                     value = 275, min = 15, max = 3000))),

      
      column(4, wellPanel(
        numericInput("fio2_apache",
                     h5("Fraction of Inspired Oxygen Apache"),
                     value = 0.21, min = 0.2089, max = 1, step = 0.001),
        
        numericInput("paco2_for_ph_apache",
                     h5("Partial Pressure of CO2 Apache"),
                     value = 40, min = 5, max = 250),
        
        numericInput("map_apache",
                     h5("Mean Arterial Pressure Apache"),
                     value = 0, min = 0, max = 300)))
      )
      
  ))

}

ComorbInputs = function(){
  return(list(
    
    fluidRow(
      column(4, wellPanel(
        radioButtons("aids", 
                     label = "AIDS",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("cirrhosis", 
                     label = "Cirrhosis",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("diabetes_mellitus", 
                     label = "Diabetes mellitus",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0))),
      
      column(4, wellPanel(
        radioButtons("hepatic_failure", 
                     label = "Hepatic Failure",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("immunosuppression", 
                     label = "Immunosuppression",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("leukemia", 
                     label = "Leukemia",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0))),
      
      column(4, wellPanel(
        radioButtons("lymphoma", 
                     label = "Lymphoma",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
    
        radioButtons("solid_tumor_with_metastasis", 
                     label = "Solid Tumor With Metastasis",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0)))
    )
  ))
    
}

OtherInputs = function(){
  return(list(
    
    fluidRow(
      column(6, wellPanel(
        sliderInput("gcs_eyes_apache", 
                    label = h4("GCS Eyes Apache"), 
                    min = 0, 
                    max = 4, 
                    value = 0),
        
        sliderInput("gcs_motor_apache", 
                    label = h4("GCS Motor Apache"), 
                    min = 0, 
                    max = 6, 
                    value = 0),
        
        sliderInput("gcs_verbal_apache", 
                    label = h4("GCS Verbal Apache"), 
                    min = 0, 
                    max = 5, 
                    value = 0))),
      
      column(6, wellPanel(
        radioButtons("intubated_apache", 
                     label = "Intubated?",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("ventilated_apache", 
                     label = "Ventilated?",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0),
        
        radioButtons("arf_apache", 
                     label = "Acute Renal Failure?",
                     choices = c("Yes" = 1,
                                 "No" = 0),
                     selected = 0)))
    )
      
  ))
}

#Returns a list of Apache descriptions for inputted bodysystem corresponding to apache code
#Possible Inputs: ["Cardiovascular", "Gastrointestinal", "Hematological", "Metabolic", "Neurological", "Renal/Genitourinary", "Respiratory", "Trauma", "Muscoskeletal/Skin disease", "Undefined"]
getApacheDx = function(bodysystem){
  apache_diagnosis_map = read.csv(paste(getwd(),"/data/apache_diagnosis_map.csv"))
  if(! bodysystem %in% names(table(apache_diagnosis_map$group))){
    warning("Bodysystem Invalid")
  }
  #Returns list of text descriptions of the APACHE codes corresponding to input bodysystem
  apache_dx_list = apache_diagnosis_map[which(apache_diagnosis_map$group == bodysystem), "code"]
  names(apache_dx_list) = apache_diagnosis_map[which(apache_diagnosis_map$group == bodysystem), "dx"]
  return(apache_dx_list)
}
