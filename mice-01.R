





get.cols <- function(fine.name){
  
  INFLUD21_12_04_2021 <- readRDS(fine.name)
  
  colunas <- c("CLASSI_FIN", 
               "SEM_NOT", 
               #"DT_SIN_PRI", 
               #"DT_NASC", 
               "TP_IDADE",
               "SG_UF_NOT",
               #"CO_MUN_RES", 
               #"DT_NOTIFIC",      
               "NU_IDADE_N",
               #"FEBRE",
               #"GARGANTA",
               "SATURACAO", 
               #"VOMITO",
               "EVOLUCAO",
               "DIABETES",
               "OBESIDADE", 
               "TOMO_RES",
               #"CS_GESTANT",
               #"DOR_ABD", 
               #"DT_EVOLUCA", 
               #"CS_RACA", 
               #"CS_SEXO",
               #"PERD_OLFT", 
               #"PERD_PALA", 
               #"NEUROLOGIC", 
               #"FADIGA", 
               #"CRITERIO",
               "PNEUMOPATI", 
               "UTI", 
               "CARDIOPATI", 
               "VACINA", 
               "HOSPITAL",
               #"HEPATICA",
               "SUPORT_VEN", 
               #"ASMA",
               "ANTIVIRAL",
               "IMUNODEPRE"#,
               #"RENAL"#, 
               #"DT_INTERNA"
  )
  
  return (INFLUD21_12_04_2021[,colunas])
}

clean.with.nas <- function(x){
  ddf.with.na <- x %>%
    rename(IDADE = NU_IDADE_N) %>%
    filter(TP_IDADE == 3) %>%
    filter(SG_UF_NOT == "MG") %>%
    mutate_if(is.double, as.factor)  %>%
    mutate_if(is.character, as.factor) %>%
    select(-TP_IDADE) %>%
    mutate(IDADE = as.numeric(IDADE)) 
  
  return(ddf.with.na)
}

clean.without.nas <- function(x){
  ddf.without.na <- x %>%
    rename(IDADE = NU_IDADE_N) %>%
    filter(TP_IDADE == 3) %>%
    mutate_if(is.double, as.factor)  %>%
    mutate_if(is.character, as.factor) %>%
    select(-TP_IDADE) %>%
    mutate(IDADE = as.numeric(IDADE)) %>%
    na.omit()
  
  return(ddf.without.na)
}

impute.mice <- function(x, colunas){
  # colunas <-  c('CLASSI_FIN',
  #         'SG_UF_NOT',
  #         'IDADE',
  #         'SEM_NOT',
  #         'SATURACAO',
  #         'EVOLUCAO',
  #         'DIABETES',
  #         'OBESIDADE',
  #         'TOMO_RES',
  #         'DOR_ABD',
  #         'PERD_OLF',
  #         'PERD_PALA',
  #         'PNEUMOPATI',
  #         'UTI',
  #         'VACINA',
  #         'HOSPITAL',
  #         'SUPORT_VEN')
  z <- as.data.frame(sapply(x, function(x) sum(is.na(x))))
  to.impute <- z %>% filter(z !=0 ) %>% row.names()
  init = mice(x, maxit=0) 
  meth = init$method
  predM = init$predictorMatrix
  
  # meth[c("CLASSI_FIN'")]="polyreg"
  # #meth[c("SG_UF_NOT'")]=""
  # meth[c("IDADE'")]=""
  # meth[c("SEM_NOT'")]=""
  # meth[c("SATURACAO'")]="polyreg"
  # meth[c("EVOLUCAO'")]="polyreg"
  # meth[c("DIABETES'")]="polyreg"
  # meth[c("OBESIDADE'")]="polyreg"
  # meth[c("TOMO_RES'")]="polyreg"
  # #meth[c("DOR_ABD'")]="polyreg"
  # #meth[c("PERD_OLF'")]="polyreg"
  # #meth[c("PERD_PALA'")]="polyreg"
  # meth[c("PNEUMOPATI'")]="polyreg"
  # meth[c("UTI'")]="polyreg"
  # meth[c("CARDIOPATI'")]="polyreg"
  # meth[c("VACINA'")]="polyreg"
  # meth[c("HOSPITAL", "SUPORT_VEN")]="polyreg"
  # meth[c("ANTIVIRAL'")]="polyreg"
  # meth[c("IMUNODEPRE'")]="polyreg"
  
  meth[c(to.impute)]
  set.seed(103)
  imputed = mice(x, method=meth, predictorMatrix=predM, m=5)
}

get.scores <- function(evid){
  evidencia <- evid
  score.1 <- cpquery(fitted = fitt.s1,
                     event = (EVOLUCAO == "1") ,
                     evidence = evidencia, 
                     method = "lw")
  
  score.2  <- cpquery(fitted = fitt.s1,
                      event = (EVOLUCAO == "2") ,
                      evidence = evidencia,
                      method = "lw")
  
  score.3  <- cpquery(fitted = fitt.s1,
                      event = (EVOLUCAO == "3") ,
                      evidence = evidencia,
                      method = "lw")
  
  score.9  <- cpquery(fitted = fitt.s1,
                      event = (EVOLUCAO == "9") ,
                      evidence = evidencia,
                      method = "lw")
  
  return(c(score.1, score.2, score.3, score.9))
}