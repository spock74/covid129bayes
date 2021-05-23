library(readr)
dados <- read_delim("NFLUD21-05-04-2021.csv", 
                    ";", escape_double = FALSE,  
                    trim_ws = TRUE,
                    col_types = cols(
                      DT_NOTIFIC = col_character(),# DD/MM/AAAA,
                      SEM_NOT = col_character(), #semana notificacao
                      DT_SIN_PRI = col_factor(levels = c("1", "2", "9")),
                      SEM_PRI = col_factor(levels = c("1", "2", "9")),
                      CS_SEXO = col_factor(levels = c("1", "2", "9")),
                      #1-Masculino 
                      #2-Feminino 
                      #9-Ignorado
                      DT_NASC = col_character(),
                      NU_IDADE_N = col_factor(levels = c("1", "2", "9")),
                      TP_IDADE = col_factor(levels = c("1", "2", "9")),
                      #1-Dia 
                      #2-Mes 
                      #3-Ano
                      CS_GESTANT = col_factor(levels = c("1", "2", "3" , "4", "5", "6", "9")),
                      #1-1Trimestre 
                      #2-2Trimestre
                      #3-3Trimestre 
                      #4-IdadeGestacional Ignorada
                      #5-Nao
                      #6-Nao se aplica 
                      #9-Ignorado
                      CS_RACA = col_factor(levels = c("1", "2","3", "4", "5", "9")), 
                      # 1-Branca 
                      # 2-Preta 
                      # 3-Amarela 
                      # 4-Parda 
                      # 5-Indigena 
                      # 9-Ignorado
                      CS_ESCOL_N = col_factor(levels = c("1", "2","3", "4", "5", "9")), 
                      # 0-Sem escolaridade-Analfabeto 
                      # 1-Fundamental 1o ciclo(1a a 5a serie)
                      # 2-Fundamental 2o ciclo (6a a 9a serie)
                      # 3-Medio (1o ao 3o ano) 
                      # 4-Superior
                      # 5-Nao se aplica 
                      # 9-Ignorado
                      SURTO_SG = col_factor(levels = c("1", "2", "9")), #1-Sim 2-Não 9-Ignorado
                      NOSOCOMIAL = col_factor(levels = c("1", "2", "9")),
                      AVE_SUINO = col_factor(levels = c("1", "2", "9")),
                      FEBRE = col_factor(levels = c("1", "2", "9")),
                      TOSSE = col_factor(levels = c("1", "2", "9")),
                      GARGANTA = col_factor(levels = c("1", "2", "9")),
                      DISPNEIA = col_factor(levels = c("1", "2", "9")),
                      DESC_RESP = col_factor(levels = c("1", "2", "9")),
                      SATURACAO = col_factor(levels = c("1", "2", "9")),
                      DIARREIA = col_factor(levels = c("1", "2", "9")),
                      VOMITO = col_factor(levels = c("1", "2", "9")),
                      OUTRO_SIN = col_factor(levels = c("1", "2", "9")),
                      FATOR_RISC = col_factor(levels = c("1", "2", "9")),
                      CARDIOPATI = col_factor(levels = c("1", "2", "9")),
                      HEMATOLOGI = col_factor(levels = c("1", "2", "9")),
                      SIND_DOWN = col_factor(levels = c("1", "2", "9")),
                      HEPATICA = col_factor(levels = c("1", "2", "9")),
                      ASMA = col_factor(levels = c("1", "2", "9")),
                      DIABETES = col_factor(levels = c("1", "2", "9")),
                      NEUROLOGIC = col_factor(levels = c("1", "2", "9")),
                      PNEUMOPATI = col_factor(levels = c("1", "2", "9")),
                      IMUNODEPRE = col_factor(levels = c("1", "2", "9")),
                      RENAL = col_factor(levels = c("1", "2", "9")),
                      OBESIDADE = col_factor(levels = c("1", "2", "9")),
                      OUT_MORBI = col_factor(levels = c("1", "2", "9")),
                      VACINA = col_factor(levels = c("1", "2", "9")),
                      DT_UT_DOSE = col_factor(levels = c("1", "2", "9")),
                      ANTIVIRAL = col_factor(levels = c("1", "2", "9")),
                      TP_ANTIVIR = col_factor(levels = c("1", "2", "3")),
                      # 1- Oseltamivir 
                      # 2- Zanamivir 
                      # 3- Outro
                      HOSPITAL = col_factor(levels = c("1", "2", "9")),
                      DT_INTERNA = col_factor(levels = c("1", "2", "9")),
                      UTI = col_factor(levels = c("1", "2", "9")),
                      DT_ENTUTI = col_factor(levels = c("1", "2", "9")),
                      DT_SAIDUTI = col_factor(levels = c("1", "2", "9")),
                      SUPORT_VEN = col_factor(levels = c("1", "2", "9")),
                      RAIOX_RES = col_factor(levels = c("1", "2","3", "4", "5", "6", "9")),
                      # 1-Normal
                      # 2-Infiltrado intersticial 
                      # 3-Consolidacao 
                      # 4-Misto
                      # 5-Outro
                      # 6-Nao realizado 
                      # 9-Ignorado
                      DT_RAIOX = col_factor(levels = c("1", "2", "9")),
                      DT_COLETA = col_factor(levels = c("1", "2", "9")),
                      TP_AMOSTRA = col_factor(levels = c("1", "2","3", "4", "5", "9")), 
                      # 1-Secrecao de Naso-orofaringe 
                      # 2-LavadoBroco-alveolar 
                      # 3-Tecidopost-mortem 
                      # 4-Outra,qual?
                      # 5-LCR 
                      # 9-Ignorado
                      PCR_RESUL = col_factor(levels = c("1", "2","3", "4", "5", "9")), 
                      # 1-Detectavel
                      # 2-Nao Detectavel 
                      # 3-Inconclusivo
                      # 4-Nao Realizado
                      # 5-Aguardando Resultado 
                      # 9-Ignorado
                      DT_PCR = col_character(),
                      POS_PCROUT = col_factor(levels = c("1", "2", "9")), 
                      # 1-Sim 
                      # 2-Nao 
                      # 9-Ignorado
                      CLASSI_FIN = col_factor(levels = c("1", "2","3", "4", "5")), 
                      # 1-SRAG por influenza 
                      # 2-SRAG por outro virus respiratorio
                      # 3-SRAG por outro agente etiologico,qual:
                      # 4-SRAG nao especificado 
                      # 5-SRAG por COVID-19
                      CRITERIO = col_factor(levels = c("1", "2","3", "4")),
                      # 1. Laboratorial
                      # 2. ClinicoEpidemiologico 
                      # 3. Clinico
                      # 4. ClinicoImagem
                      EVOLUCAO = col_factor(levels = c("1", "2", "3", "9")), 
                      # 1-Cura
                      # 2-Obito
                      # 3-Obito por outras causas 
                      # 9-Ignorado
                      DT_EVOLUCA = col_factor(levels = c("1", "2", "9")),
                      DOR_ABD = col_factor(levels = c("1", "2", "9")),
                      FADIGA = col_factor(levels = c("1", "2", "9")),
                      PERD_OLFT = col_factor(levels = c("1", "2", "9")),
                      PERD_PALA = col_factor(levels = c("1", "2", "9")),
                      DT_TOMO = col_factor(levels = c("1", "2", "9")),
                      RES_IGG = col_factor(levels = c("1", "2", "9")),
                      RES_IGM = col_factor(levels = c("1", "2", "9")),
                      RES_IGA = col_factor(levels = c("1", "2", "9"))
                    )
)