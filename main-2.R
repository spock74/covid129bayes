##
## main scrit scratchpad before to transfer to Rmarkdow
##

#Carrega CSV na variavel dados
source('read_data_2.R')

colunas <- c( 
  'FEBRE', 
  'TOSSE', 
  'GARGANTA',
  'DISPNEIA', 
  'DESC_RESP',
  'SATURACAO', 
  'DIARREIA',
  'VOMITO', 
  'OUTRO_SIN',
  #'HOSPITAL', 
  'EVOLUCAO',
  'RENAL', 
  'DIABETES',
  'OBESIDADE', 
  'PERD_OLFT',
  'PERD_PALA', 
  'VACINA',
  'CLASSI_FIN',
  'CS_SEXO',
  'CS_GESTANT',
  'PUERPERA' ,
  'CARDIOPATI', 
  #'HEMATOLOGI' ,
  #'SIND_DOWN' ,
  #'HEPATICA' ,
  'ASMA',
  'ANTIVIRAL'
  #'TP_ANTIVIR'
  #'RAIOX_RES'
)

# separar grupo de variaveis para analise
colunas_clinicas <- dados[, colunas]
# POR FIM, FUNCOES DE BNLEARN NAO ACEITAM O TIPO TIBBLE (DE DPLYR):
dados_clinicos <- as.data.frame(colunas_clinicas)
nrow(dados_clinicos)
dados_clinicos_no_na <- na.omit(dados_clinicos)
nrow(dados_clinicos_no_na)

######### teste #########
n_amostras = 10000
bn1 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn2 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn3 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn4 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn1, main="n_amostras = 10000", shape = "rectangle")
graphviz.plot(bn2, main="n_amostras = 10000", shape = "rectangle")
graphviz.plot(bn3, main="n_amostras = 10000", shape = "rectangle")
graphviz.plot(bn4, main="n_amostras = 10000", shape = "rectangle")

n_amostras <- 20000
bn5 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn6 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn7 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn8 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn5, main="n_amostras = 2000", shape = "rectangle")
graphviz.plot(bn6, main="n_amostras = 2000", shape = "rectangle")
graphviz.plot(bn7, main="n_amostras = 2000", shape = "rectangle")
graphviz.plot(bn8, main="n_amostras = 2000", shape = "rectangle")

n_amostras <- 50000
bn9  <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn10 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn11 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn12 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn9,  main="n_amostras = 50000", shape = "rectangle")
graphviz.plot(bn10, main="n_amostras = 50000", shape = "rectangle")
graphviz.plot(bn11, main="n_amostras = 50000", shape = "rectangle")
graphviz.plot(bn12, main="n_amostras = 50000", shape = "rectangle")

n_amostras <- 70000
bn13 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn14 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn15 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn16 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn13, main="n_amostras = 70000", shape = "rectangle")
graphviz.plot(bn14, main="n_amostras = 70000", shape = "rectangle")
graphviz.plot(bn15, main="n_amostras = 70000", shape = "rectangle")
graphviz.plot(bn16, main="n_amostras = 70000", shape = "rectangle")


n_amostras <- 80000
bn17 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn18 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn19 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn20 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn17, main="n_amostras = 80000", shape = "rectangle")
graphviz.plot(bn18, main="n_amostras = 80000", shape = "rectangle")
graphviz.plot(bn19, main="n_amostras = 80000", shape = "rectangle")
graphviz.plot(bn20, main="n_amostras = 80000", shape = "rectangle")

n_amostras <- 90000
bn21 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn22 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn23 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn24 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn21, main="n_amostras = 90000 2", shape = "rectangle")
graphviz.plot(bn22, main="n_amostras = 90000 2", shape = "rectangle")
graphviz.plot(bn23, main="n_amostras = 90000 2", shape = "rectangle")
graphviz.plot(bn24, main="n_amostras = 90000 2", shape = "rectangle")


n_amostras <- 90000
bn21 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn22 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn23 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
bn24 <- mmhc(sample_n(tbl = dados_clinicos_no_na, size = n_amostras, replace = FALSE))
par(mfrow=c(2,2))
graphviz.plot(bn21, main="n_amostras = 90000 3", shape = "rectangle")
graphviz.plot(bn22, main="n_amostras = 90000 3", shape = "rectangle")
graphviz.plot(bn23, main="n_amostras = 90000 3", shape = "rectangle")
graphviz.plot(bn24, main="n_amostras = 90000 3", shape = "rectangle")

bn13 <- mmhc(dados_clinicos_no_na)
bn14 <- mmhc(dados_clinicos_no_na)
bn15 <- mmhc(dados_clinicos_no_na)
bn16 <- mmhc(dados_clinicos_no_na)
par(mfrow=c(2,2))
graphviz.plot(bn13, main="n_amostras = All 92825", shape = "rectangle")
graphviz.plot(bn14, main="n_amostras = All 92825", shape = "rectangle")
graphviz.plot(bn15, main="n_amostras = All 92825", shape = "rectangle")
graphviz.plot(bn16, main="n_amostras = All 92825", shape = "rectangle")















bn.v.1 <- mmhc(dados_clinicos_no_na_vacina)
bn.v.2 <- mmhc(dados_clinicos_no_na_vacina)
bn.v.3 <- mmhc(dados_clinicos_no_na_vacina)
bn.v.4 <- mmhc(dados_clinicos_no_na_vacina)
par(mfrow=c(2,2))
graphviz.plot(bn.v.1, main="Vacinados, N = 15622", shape = "rectangle")
graphviz.plot(bn.v.2, main="Vacinados, N = 15622", shape = "rectangle")
graphviz.plot(bn.v.3, main="Vacinados, N = 15622", shape = "rectangle")
graphviz.plot(bn.v.4, main="Vacinados, N = 15622", shape = "rectangle")

bn.nv.v.1 <- mmhc(dados_clinicos_no_na_NO_vacina)
bn.nv.v.2 <- mmhc(dados_clinicos_no_na_NO_vacina)
bn.nv.v.3 <- mmhc(dados_clinicos_no_na_NO_vacina)
bn.nv.v.4 <- mmhc(dados_clinicos_no_na_NO_vacina)
par(mfrow=c(2,2))
graphviz.plot(bn.nv.v.1, main="Não Vacinados, N = 37516", shape = "rectangle")
graphviz.plot(bn.nv.v.2, main="Não Vacinados, N = 37516", shape = "rectangle")
graphviz.plot(bn.nv.v.3, main="Não Vacinados, N = 37516", shape = "rectangle")
graphviz.plot(bn.nv.v.4, main="Não Vacinados, N = 37516", shape = "rectangle")