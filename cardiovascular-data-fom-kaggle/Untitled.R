

dd_am2 <- readRDS('dd_am2.rds')
dd_am2 <- sample_frac(dd_am2, .3)

dd_am2 = as.data.frame(dd_am2)
bn2 <- iamb(dd_am2)
fitted <- bn.fit(bn2,dd_am2)
graphviz.chart(fitted, grid = FALSE, bg = "beige", bar.col = "black")
