library(bnstruct)

asia  <- BNDataset("asia_10000.data", "asia_10000.header", starts.from = 0)
child <- BNDataset("Child_data_NA_5000.data", "Child_data_NA_5000.header", starts.from = 0)


asia <- asia()
child <- child()

dataset <- child()
net <- BN(dataset)
# ou 
net <- learn.network(dataset)
dag(net)
wpdag(net)
cpts(net)
plot(net,plot.wpdag=T)

plot(net, method="qgraph",
                label.scale.equal=T,
                node.width = 1.6,
                plot.wpdag=T)


dataset <- asia()
net <- learn.network(dataset)
interventions <- list(intervention.vars=c(2, 4), intervention.vals=c(1,2))
engine <- InferenceEngine(net, interventions = interventions)
test.updated.bn(engine) # TRUE
get.most.probable.values(updated.bn(engine))

class(updated.bn(engine))
plot(updated.bn(engine))
plot(net)




d <- readRDS('dd_am2.rds')

dataset.from.data <- BNDataset(data = d,
                     discreteness = rep('d',5),
                     starts.from = 1,
                     variables = c("gender", "cholesterol", "gluc", "smoke", "active"),
                     node.sizes = c(2,3,3,2,2))


