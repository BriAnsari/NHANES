
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
demo_raw <- nhanes('DEMO_J')

#reading in some files of interest from the diet data
#added diet - affects sleep?
total_nutrient <- nhanes('DR1TOT_J') 
ind_foods <- nhanes('DR1IFF_J') 
diet_supp <- nhanes('DSQTOT_J') 

#reading in some files of interest from the exam data
bp <- nhanes('BPX_J') 
body_measures <- nhanes('BMX_J') 
dexa_femur <- nhanes('DXXFEM_J') 
dexa_body <- nhanes('DXX_J') 
dexa_spine <- nhanes('DXXSPN_J') 
liver_US <- nhanes('LUX_J') 

#reading in some files of interest from the lab data

urine_flow <- nhanes('UCFLOW_J') 
fasting_q <- nhanes('FASTQX_J') 
hba1c <- nhanes('GHB_J') 
urine_alb_cr <- nhanes('ALB_CR_J') 
uine_preg <- nhanes('UCPREG_J') 
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
Aspirin_use <- nhanes('RXQASA_J') 
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
weight_history<-nhanes('WHQ_J')%>% tibble() #4/27 JOE added
mental_health <-nhanes('DPQ_J')%>% tibble() #4/27 JOE added




############EDA#####################
###################################
###################################

#checking for correlated data

#alcohol use
distinct_observation <- alcohol_use %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# aspirin

distinct_observation <- Aspirin_use %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#biochem

distinct_observation <- biochem %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#body measure
distinct_observation <- body_measures %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#bp

distinct_observation <- bp %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#cbc

distinct_observation <- cbc %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#childhood

distinct_observation <- childhood %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#conitine

distinct_observation <- cotinine %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#crp
distinct_observation <- crp %>% 
distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# current health

distinct_observation <- current_health %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# cvs_health

distinct_observation <- cvs_health %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#demo

distinct_observation <- demo_raw %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#depression

distinct_observation <- depression_screen %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#derm

distinct_observation <- derm %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#dexa_body #5114

distinct_observation <- dexa_body %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#dexa femur #2898

distinct_observation <- dexa_femur %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# dexa_spine # 2898

distinct_observation <- dexa_spine %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#diabetes #8897

distinct_observation <- diabetes %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#  diet_behav #9254

distinct_observation <- diet_behav %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#diet supp #9254

distinct_observation <- diet_supp %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# diability #8897

distinct_observation <- disability %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# drug use 4572

distinct_observation <- drug_use %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation


#fasting_q #8366

distinct_observation <- fasting_q %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#hba1c #6401

distinct_observation <- hba1c %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# hdl #7435

distinct_observation <- hdl %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# health insurance #9254
distinct_observation <- health_insurance %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#house char #9254
distinct_observation <- house_char %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#household smoke #9254

distinct_observation <- househol_smoke %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#ind_foods # 112683######################
################caution: correlated data##

distinct_observation <- ind_foods %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#iron status # 6401

distinct_observation <- iron_status %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# ldl #3036

distinct_observation <- LDL %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# lead #8366

distinct_observation <- lead %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# liver # 6401

distinct_observation <- liver_US %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#med condition #8897
distinct_observation <- med_conditions %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#mental health #5533

distinct_observation <- mental_health %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# mercury # 8366

distinct_observation <- mercury %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# new culture # 8421
distinct_observation <- new_culture %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# occupation #6161

distinct_observation <- occupattion %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#pesticide # 7435

distinct_observation <- pesticide %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# phys_activ #5856

distinct_observation <- phy_activ %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation


# phys actuve youth # 2778

distinct_observation <- phys_activ_youth %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# physical functioning #8421

distinct_observation <- Physical_Functioning %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# prescription # 19643
############### caution:correlated data

distinct_observation <- prescrition_med %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# recent smoke #6401

distinct_observation <- recent_smoke %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#sleep disorder 6161

distinct_observation <- sleep_disorder %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#smoking 6724

distinct_observation <-  smoking %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# total chol 7435

distinct_observation <- total_chol %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# total nutrition # 8704

distinct_observation <- total_nutrient %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# urine preg #1057

distinct_observation <- uine_preg %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# urin alb/cr #7936

distinct_observation <- urine_alb_cr %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

#urine floe 7936

distinct_observation <- urine_flow %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# voc 3172
distinct_observation <- VOC %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# vol_toxi 3172

distinct_observation <- vol_toxicant %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation

# weight hist # 6161

distinct_observation <- weight_history %>% 
  distinct(SEQN) %>% 
  summarise(dist=n()) %>% 
  pull(dist)

distinct_observation


################### merge datasets#####
########################################
library(sjlabelled)

demo_nl<-remove_all_labels(demo_raw)
depression_nl <- remove_all_labels(depression_screen)
sleep_nl <- remove_all_labels(sleep_disorder)


combined <- demo_nl %>% 
  left_join(sleep_nl)
 
### remove 9 from LSQ050

table(combined$SLQ050)

combined <- combined[!(combined$SLQ050==9),]

table(combined$SLQ050)


### check data format

str(combined)

combined1 <- as.factor(combined)

combined1$SLQ
# random forest for variable selection
library(randomForest)
rf_mdl <- rfImpute(SLQ050 ~., data = combined1,iter=5,ntree500)
randomForest::varImpPlot(rf_mdl, n.var = 15)



#tomorrows goal

# if rf works -> data exploration
# if doesnt -> we chooose manually

# sample code select variables and pivot longer
aspirin <- Aspirin_use %>% 
  as_tibble() %>% 
  select(SEQN, RXQ515, RXQ520) %>% 
  sjlabelled::remove_all_labels() %>% 
  pivot_longer(cols = starts_with("RXQ"), 
               names_to = "question",
               values_to =  "answer") %>% 
  na.omit()

# sample code pivot wider

food_wide <- ind_foods %>% 
  sjlabelled::remove_all_labels() %>% 
  select(SEQN, DR1ILINE, DR1IKCAL, DR1IGRMS) %>% 
  pivot_wider(id_cols = SEQN,
              names_from = DR1ILINE, 
              values_from = c(DR1IKCAL, DR1IGRMS))

names(food_wide) <- stringr::str_remove(string = names(food_wide),
                                        pattern = "DR1I")










# preprocessing


# ml models
