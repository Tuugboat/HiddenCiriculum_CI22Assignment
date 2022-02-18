#this file simply re-cleans the data and builds all of the figures from the raw data pulled directly from the NLSY97.
#It should be feasibly possible to download that file, title it NLSY97_Incarceration02_raw.csv, then run this full script
#And regenerate every figure from scratch.
#Do note that you will still be required to go into the main latex file and build from there
#Probably possible to run the console command pdflatex .. from here but that seems extra


#Note: if here() is throwing errors it is almost certainly because main.R was opened directly. Go up a directory level and open the .Rproj
#in that folder
source(here("R/build/NLSY97_clean.R"))
source(here("R/output/figure_MonthsIncarcerated_by_racegender.R"))
source(here("R/output/table_MonthsIncarcerated_by_racegender.R"))
source(here("R/output/table_regress_MonthsIncarcerated_by_racegender.R"))
