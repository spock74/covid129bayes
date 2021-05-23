##
## main scrit scratchpad before to transfer to Rmarkdow
##

#Carrega CSV na variavel dados
source('prepare_data.R')

# Salva arquivo "INFLUD21-05-04-2021.csv" originalno formato RDS
saveRDS(dados, './dados/INFLUD21-05-04-2021.rds')

# problemas de parsing do CSV file
problemas_de_parsing <- problems(dados)
# save problemas parsing
saveRDS(problemas_de_parsing, './dados/problemas_de_parsing.rds')

# Remove Colunas Vazias do data.frame
source('remove_colunas_vazias.R')
ncol(dados)
dados.no.empty.cols <- remove.colunas.vazias(dados)
ncol(dados.no.empty.cols)
dados <- dados.no.empty.cols
rm(dados.no.empty.cols)

# salvar dados sem colunas vazias e com tipo de coluna castted para os tipos default (errados -> dever ser factors)
write.csv2(x = dados, file = './dados/dados_no_empty_cols_default_r_types.csv', sep = ';')
write_rds(x = dados, file = './dados/dados_no_empty_cols_default_r_types.csv')

# selecionar colunas de interesse (grupamento clinico)
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
              'HOSPITAL', 
              'EVOLUCAO',
              'RENAL', 
              'DIABETES',
              'OBESIDADE', 
              'PERD_OLFT',
              'PERD_PALA', 
              'VACINA',
              'CLASSI_FIN'
)
# separar grupo de variaveis para analise
colunas_clinicas <- dados[, colunas]

# salvar dados somente com colunas do grupamento clinico de interesse
write.csv2(colunas_clinicas, './dados/grupamento_clinico_03_wrong_data_types.csv', sep = ';')
# ler dados clinicos e corrigir data type das colunas
# dados <- read_csv("x_to_be_factors.csv", 
#     col_types = cols(
#         FEBRE = col_factor(levels = c("1", "2", "9")), 
#         TOSSE = col_factor(levels = c("1", "2", "9")), 
#         GARGANTA = col_factor(levels = c("1", "2", "9")), 
#         DISPNEIA = col_factor(levels = c("1", "2", "9")), 
#         DESC_RESP = col_factor(levels = c("1", "2", "9")), 
#         SATURACAO = col_factor(levels = c("1", "2", "9")), 
#         DIARREIA = col_factor(levels = c("1", "2", "9")), 
#         VOMITO = col_factor(levels = c("1", "2", "9")), 
#         OUTRO_SIN = col_factor(levels = c("1", "2", "9")), 
#         HOSPITAL = col_factor(levels = c("1", "2", "9")), 
#         EVOLUCAO = col_factor(levels = c("1", "2", "3", "9")), 
#         RENAL = col_factor(levels = c("1", "2", "9")), 
#         DIABETES = col_factor(levels = c("1", "2", "9")), 
#         OBESIDADE = col_factor(levels = c("1", "2", "9")), 
#         PERD_OLFT = col_factor(levels = c("1", "2", "9")), 
#         PERD_PALA = col_factor(levels = c("1", "2", "9")), 
#         VACINA = col_factor(levels = c("1", "2", "9")), 
#         CLASSI_FIN = col_factor(levels = c("1", "2", "3", "4", "5"))))
grupamento_clinico_03_correct_data_types <- read_delim("dados/grupamento_clinico_03_wrong_data_types.csv", 
                                                     ";", 
                                                     escape_double = FALSE, 
                                                     col_types = cols(
                                                     FEBRE = col_factor(levels = c("1", "2", "9")),
                                                     TOSSE = col_factor(levels = c("1", "2", "9")),
                                                     GARGANTA = col_factor(levels = c("1", "2", "9")),
                                                     DISPNEIA = col_factor(levels = c("1", "2", "9")),
                                                     DESC_RESP = col_factor(levels = c("1", "2", "9")),
                                                     SATURACAO = col_factor(levels = c("1", "2", "9")),
                                                     DIARREIA = col_factor(levels = c("1", "2", "9")),
                                                     VOMITO = col_factor(levels = c("1", "2", "9")),
                                                     OUTRO_SIN = col_factor(levels = c("1", "2", "9")),
                                                     HOSPITAL = col_factor(levels = c("1", "2", "9")),
                                                     EVOLUCAO = col_factor(levels = c("1", "2", "3", "9")),
                                                     RENAL = col_factor(levels = c("1", "2", "9")),
                                                     DIABETES = col_factor(levels = c("1", "2", "9")),
                                                     OBESIDADE = col_factor(levels = c("1", "2", "9")),
                                                     PERD_OLFT = col_factor(levels = c("1", "2", "9")),
                                                     PERD_PALA = col_factor(levels = c("1", "2", "9")),
                                                     VACINA = col_factor(levels = c("1", "2", "9")),
                                                     CLASSI_FIN = col_factor(levels = c("1", "2", "3", "4", "5"))))

#save grupamento clinico agora castted para colunas com tipos corretos (no caso: factors)
saveRDS(grupamento_clinico_03_correct_data_types, 'dados/grupamento_clinico_03_correct_data_types.rds')
dados_clinicos <- select(grupamento_clinico_03_correct_data_types, -X1)
rm(grupamento_clinico_03_correct_data_types, grupamento_clinico_03_wrong_data_types)
dados_clinicos[1222, 12] == colunas_clinicas[1222, 12]
rm(colunas_clinicas, colunas_lidas, problemas_de_parsing, dados)

# POR FIM, FUNCOES DE BNLEARN NAO ACEITAM O TIPO TIBBLE (DE DPLYR):
dados_clinicos <- as.data.frame(dados_clinicos)
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