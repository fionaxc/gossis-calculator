library(shiny)
library(yaml)
devtools::install_github('jraffa/rGOSSIS1')
library(rGOSSIS1)
library(dplyr)

setwd("~/Dropbox (MIT)/HST_UROP/gossis-calculator/")
template_data = read.csv(paste(getwd(), "/data/template_data.csv"))
source("ui.R", local = TRUE)
source("server.R", local = TRUE)
shinyApp(ui = ui, server = server)

