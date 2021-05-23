
# dplyr remove columns with only NA
dd %>% select_if(~!all(is.na(.))) 
dd <- as.data.frame(dd)

colunas <- c( 
  'FEBRE', 
  'TOSSE', 
  'GARGANTA',
  'DISPNEIA', 
  'DESC_RESP',
  'SATURACAO', 
  'DIARREIA',
  'VOMITO', 
  #'OUTRO_SIN',
  #'HOSPITAL', 
  #'EVOLUCAO',
  #'RENAL', 
  #'DIABETES',
  #'OBESIDADE', 
  #'PERD_OLFT',
  #'PERD_PALA', 
  #'VACINA',
  #'CLASSI_FIN',
  #'CS_SEXO',
  #'CS_GESTANT',
  #'PUERPERA' ,
  #'CARDIOPATI', 
  #'HEMATOLOGI' ,
  #'SIND_DOWN' ,
  #'HEPATICA' ,
  #'ASMA'#,
  #'ANTIVIRAL'
  #'TP_ANTIVIR'
  #'RAIOX_RES'
)

# separar grupo de variaveis para analise
colunas_clinicas <- dd[, colunas]
# POR FIM, FUNCOES DE BNLEARN NAO ACEITAM O TIPO TIBBLE (DE DPLYR):
dados_clinicos <- as.data.frame(colunas_clinicas)
nrow(dados_clinicos)
dados_clinicos_no_na <- na.omit(dados_clinicos)
nrow(dados_clinicos_no_na)
class(dados_clinicos)




glimpse(dados_clinicos_no_na)
#convert all coluns to factors
df <- dados_clinicos_no_na
df <- df %>% mutate_if(is.double,as.factor)
df <- df %>% mutate_if(is.character,as.factor)
glimpse(df)

s1 <- sample_n(df, 10000, FALSE)
bn1 <- mmhc(s1)
fitted.1 <- bn.fit(bn1, s1)
graphviz.chart(fitted.1)
