pacman::p_load("visdat")
pacman::p_load("tidyverse")
pacman::p_load("readr")
pacman::p_load("inspectdf")

devtools::install_github("alastairrushworth/inspectdf")

dat <- read_csv("sleep.csv")

sleep <- dat %>% select(SLQ050, RIDAGEYR)

head(dat)

str(dat)

glimpse(dat)

summary(dat)

vis_miss(dat)
vis_dat(dat)

ggplot(dat, aes(x = BMXBMI)) +
    geom_histogram()

x <- inspect_num(sleep)
show_plot(x)
inspect_types(dat)
y <- inspect_cor(dat)
show_plot(y)

z <- inspect_types(dat)
show_plot(z)

dat$SLQ050 <- as.factor(dat$SLQ050)
dat$HSD010 <- as.factor(dat$HSD010)
dat$DLQ100 <- as.factor(dat$DLQ100)

dat %>% group_by(SLQ050) %>% 
    summarize(mean_age = mean(RIDAGEYR),
              mean_sleep_hr = mean(SLD012),
              gen_health_con = mean(HSD010),
              mean_BMI = mean(BMXBMI),
              anxiety = mean(DLQ100))

plot(dat$SLQ050, dat$BMXBMI)

dat %>% 