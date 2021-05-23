# https://stackoverflow.com/questions
# /54922515/bnlearn-r-error-variable-variable1-must-have-at-least-two-levels
# bnlearn expects a data.frame : doesn't work with tibbles, So keep 
# your data as a data.frame by omitting the line DataFull <- as_tibble(DataFull)
# as.data.frame(x)


library(tidyverse)
library(haven)
library(bnlearn)
library(Rgraphviz)

library(readr)

cardio_train <- read_delim("cardio_train_copia.csv", 
                          ";", escape_double = FALSE, col_types = cols( 
                          gender = col_factor(levels = c("1", 
                          "2")), cholesterol = col_factor(levels = c("1", 
                          "2", "3")), gluc = col_factor(levels = c("1", 
                          "2", "3")), alco = col_factor(levels = c("0", 
                          "1")), cardio = col_factor(levels = c("0", 
                          "1"))), trim_ws = TRUE)

genero = '1'
genero = '2'


cardio_train = filter(cardio_train, gender == genero, ap_hi>ap_lo, ap_lo > 40, ap_lo<200, ap_hi>60, ap_hi<300)
set.seed(2)
amostra = sample_frac(cardio_train, size = .9, replace = F)

ccc <- select(amostra, age, height, weight, ap_lo, ap_hi)
ccc2 <- discretize(ccc, method = 'hartemink', breaks = 4)
dados <- cbind(select(amostra, -age, -height, -weight, -ap_lo, -ap_hi), ccc2)
summary(dados)


# -----------------------------------------------------------------------------
dd_f = select(dados, -ap_lo, -height, -gender, -id, -smoke, -active)
res_f = gs(dd_f)
R = 100
graphviz.plot(res_f, main = "Markov Blanket - GLUCOSE", 
              sub = "Feminino", 
              highlight = list(nodes=c("gluc", mb(res_f, "gluc"))))
              

fitted = bn2.fit(bn2, dd_am)
graphviz.chart(bn2, grid = TRUE, bg = "beige", bar.col = "black")



              
              str.diff_f = boot.strength(dd_f, R = R, algorithm = "iamb")
strength_f = filter(str.diff_f, strength>0)
strength_f
# -----------------------------------------------------------------------------
dd_m_sample = sample_n(dd_m, nrow(dd_f), replace = F)
res_m_sample = iamb(dd_m_sample)
graphviz.plot(res_m_sample,  main = "Masculino", sub = "subtitulo", highlight = list(nodes=c("gluc", mb(res, "gluc"))))
str.diff_m_sample = boot.strength(dd_m_sample, R = 100, algorithm = "iamb")
strength_m_sample = filter(str.diff_m_sample, strength>0)
strength_m_sample    
# -----------------------------------------------------------------------------          

X <- paste("[X1][X3][X5][X6|X8][X2|X1][X7|X5][X4|X1:X2]",
           "[X8|X3:X7][X9|X2:X7][X10|X1:X9]", sep = "")
dag2 <- model2network(X)
par(mfrow = c(1,2))
graphviz.plot(dag2)
graphviz.plot(cpdag(dag2))

bn <- custom.fit(dag, cpt)

graphviz.plot(moral(dag2))

bn.fit.barchart(bn.mle$T, main = "Travel",
                xlab = "Pr(T | R,O)", ylab = "")







library(bnlearn)
data(learning.test)
pdag = iamb(learning.test)
pdag
dag = set.arc(pdag, from = "B", to = "A")
dag = pdag2dag(pdag, ordering = c("A", "B", "C", "D", "E", "F"))
fit = bn.fit(dag, learning.test)
fit


print(fit$D, perm = c("D", "C", "A"))

bn.fit.barchart(fit$D)




Probabilistic reasoning on BNs works in the framework of Bayesian statistics and focuses on the computation of posterior probabilities or densities.
For example, suppose we have learned a BN B with DAG G and parameters Θ. We want to use B to investigate the effects of a new piece of evidence E using the knowledge encoded in B, that is, to investigate the posterior distribution

