
# LOAD LIBRARIES
library(tidyverse)
library(RNHANES)
library(ggsci)
library(ggthemes)
library(nhanesA)
library(janitor)
library(magrittr)
library(tidyverse)


# looking for file names in each data type
nhanesTables(data_group='DEMO', year=2018)
nhanesTables(data_group='DIET', year=2018)
nhanesTables(data_group='EXAM', year=2018)
nhanesTables(data_group='LAB', year=2018)
nhanesTables(data_group='Q', year=2018)






###############################


# Ingest the NHANES data

# All NHANES databases.

#Demo
demo_raw <- nhanes('DEMO_J') %>% tibble()

#reading in some files of interest from the diet data
#added diet - affects sleep?
total_nutrient <- nhanes('DR1TOT_J') %>% tibble()
ind_foods <- nhanes('DR1IFF_J') %>% tibble()
diet_supp <- nhanes('DSQTOT_J') %>% tibble()

#reading in some files of interest from the exam data
bp <- nhanes('BPX_J') %>% tibble()
body_measures <- nhanes('BMX_J') %>% tibble()
dexa_femur <- nhanes('DXXFEM_J') %>% tibble()
dexa_body <- nhanes('DXX_J') %>% tibble()
dexa_spine <- nhanes('DXXSPN_J') %>% tibble()
liver_US <- nhanes('LUX_J') %>% tibble()


#reading in some files of interest from the lab data

urine_flow <- nhanes('UCFLOW_J') %>% tibble()
fasting_q <- nhanes('FASTQX_J') %>% tibble()
hba1c <- nhanes('GHB_J') %>% tibble()
urine_alb_cr <- nhanes('ALB_CR_J') %>% tibble()
uine_preg <- nhanes('UCPREG_J') %>% tibble()
cbc <- nhanes('CBC_J') %>% tibble()
crp <- nhanes('HSCRP_J') %>% tibble()
total_chol <- nhanes('TCHOL_J') %>% tibble()
hdl <- nhanes('HDL_J') %>% tibble()
biochem <- nhanes('BIOPRO_J') %>% tibble()
iron_status <- nhanes('FETIB_J') %>% tibble()
LDL <- nhanes('TRIGLY_J') %>% tibble()
cotinine <- nhanes('COT_J') %>% tibble()
lead <- nhanes('PBCD_J') %>% tibble() #added 4/27
mercury <- nhanes('IHGEM_J') %>% tibble() #added 4/27
VOC <- nhanes('VOCWB_J') %>% tibble() #added 4/27

##reading in some files of interest from the questionnaire data

cvs_health<- nhanes('CDQ_J') %>% tibble()
phy_activ <- nhanes('PAQ_J') %>% tibble()
phys_activ_youth <- nhanes('PAQY_J') %>% tibble()
health_insurance <- nhanes('HIQ_J') %>% tibble()
disability <- nhanes('DLQ_J') %>% tibble()
diabetes <- nhanes('DIQ_J') %>% tibble()
Physical_Functioning <- nhanes('PFQ_J') %>% tibble()
recent_smoke <- nhanes('SMQRTU_J') %>% tibble() #fixed nhanes code
househol_smoke <- nhanes('SMQFAM_J') %>% tibble()
smoking <- nhanes('SMQ_J') %>% tibble()
med_conditions <- nhanes('MCQ_J') %>% tibble()
current_health <- nhanes('HSQ_J') %>% tibble()
alcohol_use <- nhanes('ALQ_J') %>% tibble()
Aspirin_use <- nhanes('RXQASA_J') %>% tibble()
prescrition_med <- nhanes('RXQ_RX_J') %>% tibble()
house_char <- nhanes('HOQ_J') %>% tibble()
derm <- nhanes('DEQ_J') %>% tibble()
new_culture <- nhanes('ACQ_J') %>% tibble()
sleep_disorder <- nhanes('SLQ_J') %>% tibble()
occupattion <- nhanes('OCQ_J') %>% tibble()
depression_screen <- nhanes('DPQ_J') %>% tibble()
drug_use <- nhanes('DUQ_J') %>% tibble()
childhood <- nhanes('ECQ_J') %>% tibble()
diet_behav <- nhanes('DBQ_J') %>% tibble()
pesticide <- nhanes('PUQMEC_J') %>% tibble() #added 4/27
vol_toxicant <- nhanes('VTQ_J') %>% tibble() #added 4/27


#Following is one of the most efficient ways that I have found for left joining
#let us know if there is a better way to do this. I included three files just to check the code and will all the other ones


#left join
nhanes_combined <- list(demo_raw, alcohol_use, bODY_measures,Aspirin_use) %>%
  Reduce(function(df1, df2) inner_join(df1, df2, by = "SEQN"), .)




# remove duplicate records


# preprocessing


# ml models
