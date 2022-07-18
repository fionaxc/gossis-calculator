library(shiny)
library(yaml)
devtools::install_github('jraffa/rGOSSIS1')
library(rGOSSIS1)

setwd("~/Dropbox (MIT)/HST_UROP/code/App-1/")
source("ui.R", local = TRUE)
source("server.R", local = TRUE)
shinyApp(ui = ui, server = server)
