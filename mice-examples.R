dat <- read.csv(url("https://goo.gl/4DYzru"), header=TRUE, sep=",")

sapply(dat, function(x) sum(is.na(x)))
original <- dat
set.seed(10)
dat[sample(1:nrow(dat), 20), "Cholesterol"] <- NA
dat[sample(1:nrow(dat), 20), "Smoking"] <- NA
dat[sample(1:nrow(dat), 20), "Education"] <- NA
dat[sample(1:nrow(dat), 5), "Age"] <- NA
dat[sample(1:nrow(dat), 5), "BMI"] <- NA
sapply(dat, function(x) sum(is.na(x)))
library(dplyr) 
dat <- dat %>%
  mutate(
    Smoking = as.factor(Smoking),
    Education = as.factor(Education),
    Cholesterol = as.numeric(Cholesterol)
  )
str(dat)
library(mice)
init = mice(dat, maxit=0) 
meth = init$method
predM = init$predictorMatrix
predM[, c("BMI")]=0

meth[c("Cholesterol")]="norm" 
meth[c("Smoking")]="logreg" 
meth[c("Education")]="polyreg"

set.seed(103)
imputed = mice(dat, method=meth, predictorMatrix=predM, m=5)


init = mice(colunas.para.inferencia, maxit=0) 
meth = init$method
predM = init$predictorMatrix
meth[c("TOMO_RES")]="polyreg"
set.seed(103)
sapply(colunas.para.inferencia, function(x) sum(is.na(x)))
imputed = mice(colunas.para.inferencia, method=meth, predictorMatrix=predM, m=5)
