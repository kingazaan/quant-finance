library(quantmod)
library(PerformanceAnalytics)

dt <- "2020-1-1"

name = 'ebs'
ebs <- getSymbols.yahoo(name, from=dt, auto.assign = F)
ebsClose <- getSymbols.yahoo(name, from=dt, auto.assign = F)[,6]

ebsReturns <- na.omit(dailyReturn(ebsClose, type='log'))

chartSeries(ebs)