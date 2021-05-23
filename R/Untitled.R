

INFLUD21-29-03-2021.csv

dados <- read_csv("INFLUD21-29-03-2021.csv", 
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
                    CLASSI_OUT = col_character(), 
                    PERD_OLFT = col_factor(levels = c("1", "2", "9")), 
                    PERD_PALA = col_factor(levels = c("1", "2", "9")), 
                    VACINA = col_factor(levels = c("1", "2", "9")), 
                    CLASSI_FIN = col_factor(levels = c("1", "2", "3", "4", "5"))))
