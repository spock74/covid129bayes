library(gRain)
library(bnlearn)

val.str = paste("[PKC][PKA|PKC][praf|PKC:PKA]", 
                "[pmek|PKC:PKA:praf][p44.42|pmek:PKA]",
                "[pakts473|p44.42:PKA][P38|PKC:PKA]",
                "[pjnk|PKC:PKA][plcg][PIP3|plcg]",
                "[PIP2|plcg:PIP3]")

val = model2network(val.str)
isachs = isachs[, 1:11]

for (i in names(isachs))
  levels(isachs[, i]) = c("LOW", "AVG", "HIGH") 

fitted = bn.fit(val, isachs, method = "bayes"



cpquery(bn, 
        event = (IDADE == "`(37,73])`") & (T == "car"), 
        evidence = list(A = "young"), 
        method = "lw", n = 10^6)

cpquery(fitt, 
        event =  (UTI == 2) & (DIABETES == 1) & (ASMA == 2), 
        evidence = list(EVOLUCAO = "2"), 
        method = "lw", n = 10^6)






junction = compile(as.grain(fitt))



jedu = setEvidence(junction, nodes = "UTI", states = "9")

pp <- querygrain(jedu, nodes = c("IDADE", "EVOLUCAO", "ANTIVIRAL"),
          type = "marginal")



SxT = cpdist(fitt, nodes = c("IDADE", "EVOLUCAO", "ANTIVIRAL"), evidence = UTI == "1")
ggplot(SxT, aes(IDADE)) + geom_histogram(stat = "count")

