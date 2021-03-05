library(quantmod)
library(PerformanceAnalytics)

#Using the whole TCM portfolio split by their sectors
tickersCommServices <- c("ATVI", "GOOGL", "FB", "DIS")
tickersConsDisc <- c("AMZN", "NKE", "PHM")
tickersConsStaples <- c("STZ", "COST", "WMT")
tickersEnergy <- c("XOM")
tickersFinancials <- c("BAC", "SCHW")
tickersHealthCare <- c("ABT", "ABMD", "CVS", "HQY", "ISRG", "MRK")
tickersIndustrials <- c("CAT", "LMT", "WM", "XYL")
tickersInfoTech <- c("ACN", "ADBE", "AYX", "AAPL", "AMAT", "CIEN", "FTNT", "MSFT", "PYPL", "CRM", "V")
tickersMaterials <- c("STLD")
tickersRealEstate <- c("SPG")
cash <- c("CASH_USD")

allTicks <- list(tickersCommServices,
              tickersConsDisc,
              tickersConsStaples,
              tickersEnergy,
              tickersFinancials,
              tickersHealthCare,
              tickersIndustrials,
              tickersInfoTech,
              tickersMaterials,
              tickersRealEstate
#             , cash
              )

#true weights of TCM portfolio as of 3/4/2021 by sector 
trueweightsCommServices <- c(.0339, .0375, .0317, .0357)
trueweightsConsDisc <- c(.0346, .0138, .0246)
trueweightsConsStaples <- c(.0264, .0240, .0221)
trueweightsEnergy <- c(.0135)
trueweightsFinancials <- c(.0318, .0438)
trueweightsHealthCare <- c(.0297, .0146, .0215, .0290, .0310, .0195)
trueweightsIndustrials <- c(.0370, .0185, .0203, .0307)
trueweightsInfoTech <- c(.0349, .0195, .0175, .0367, .0277, .0187, .0246, .0178, .0601, .0189, .0266)
trueweightsMaterials <- c(.0385)
trueweightsRealEstate <- c(.0244)
#trueweightsCash <- c(.0088)

allTrueWeights <- list(trueweightsCommServices, 
                         trueweightsConsDisc, 
                         trueweightsConsStaples, 
                         trueweightsEnergy, 
                         trueweightsFinancials, 
                         trueweightsHealthCare, 
                         trueweightsIndustrials, 
                         trueweightsInfoTech, 
                         trueweightsMaterials, 
                         trueweightsRealEstate 
#                       , trueweightsCash
                         )


scalar <- function(x) {x/sum(x)}

weightsCommServices <-  scalar(trueweightsCommServices)
weightsConsDisc <- scalar(trueweightsConsDisc)
weightsConsStaples <- scalar(trueweightsConsStaples)
weightsEnergy <- scalar(trueweightsEnergy)
weightsFinancials <- scalar(trueweightsFinancials)
weightsHealthCare <- scalar(trueweightsHealthCare)
weightsIndustrials <- scalar(trueweightsIndustrials)
weightsInfoTech <- scalar(trueweightsInfoTech)
weightsMaterials <- scalar(trueweightsMaterials)
weightsRealEstate <- scalar(trueweightsRealEstate)
weightsCash <- scalar(trueweightsCash)



#populated all of the portfolio prices
pricesCommServices <- pricesConsDisc <- pricesConsStaples <- pricesEnergy <- pricesFinancials <- pricesHealthCare <- pricesIndustrials <- pricesInfoTech <- pricesMaterials <- pricesRealEstate <- NULL

for (ticker in tickersCommServices) {
  pricesCommServices <- cbind(pricesCommServices,
                             getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersConsDisc) {
  pricesConsDisc <- cbind(pricesConsDisc,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersConsStaples) {
  pricesConsStaples <- cbind(pricesConsStaples,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersEnergy) {
  pricesEnergy <- cbind(pricesEnergy,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersFinancials) {
  pricesFinancials <- cbind(pricesFinancials,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersHealthCare) {
  pricesHealthCare <- cbind(pricesHealthCare,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersIndustrials) {
  pricesIndustrials <- cbind(pricesIndustrials,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersInfoTech) {
  pricesInfoTech <- cbind(pricesInfoTech,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersMaterials) {
  pricesMaterials <- cbind(pricesMaterials,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}
for (ticker in tickersRealEstate) {
  pricesRealEstate <- cbind(pricesRealEstate,
                              getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}

#throw all of the prices into a list, in order iterate when necessary
allPrices <- list(pricesCommServices,
                  pricesConsDisc,
                  pricesConsStaples,
                  pricesEnergy,
                  pricesFinancials,
                  pricesHealthCare,
                  pricesIndustrials,
                  pricesInfoTech,
                  pricesMaterials,
                  pricesRealEstate)

#check empty values
for (price in allPrices) {
  print(colSums(is.na(price)))
}


#calculate returns for each sector
#### feel free to use a different return calculator
returnsCommServices <- na.omit(ROC(pricesCommServices))
returnsConsDisc <- na.omit(ROC(pricesConsDisc))
returnsConsStaples <- na.omit(ROC(pricesConsStaples))
returnsEnergy <- na.omit(ROC(pricesEnergy))
returnsFinancials <- na.omit(ROC(pricesFinancials))
returnsHealthCare <- na.omit(ROC(pricesHealthCare))
returnsIndustrials <- na.omit(ROC(pricesIndustrials))
returnsInfoTech <- na.omit(ROC(pricesInfoTech))
returnsMaterials <- na.omit(ROC(pricesMaterials))
returnsRealEstate <- na.omit(ROC(pricesRealEstate))

#calculate WEIGHTED returns for each sector
returnCommServices <- Return.portfolio(returnsCommServices, weights=weightsCommServices)
returnConsDisc <- Return.portfolio(returnsConsDisc, weights=weightsConsDisc)
returnConsStaples <- Return.portfolio(returnsConsStaples, weights=weightsConsStaples) 
returnEnergy <- Return.portfolio(returnsEnergy, weights=weightsEnergy)
returnFinancials <- Return.portfolio(returnsFinancials, weights=weightsFinancials)
returnHealthCare <- Return.portfolio(returnsHealthCare, weights=weightsHealthCare)
returnIndustrials <- Return.portfolio(returnsIndustrials, weights=weightsIndustrials) 
returnInfoTech <- Return.portfolio(returnsInfoTech, weights=weightsInfoTech)
returnMaterials <- Return.portfolio(returnsMaterials, weights=weightsMaterials)
returnRealEstate <- Return.portfolio(returnsRealEstate, weights=weightsRealEstate)


####recreate all steps, but for entire portfolio

#combine all tickers except cash
ticsVector <- NULL
for (tickers in allTicks) {
  ticsVector = c(ticsVector, tickers)
}
print (ticsVector)

#combine all weightings and re-scale them without cash
weightsVector <- NULL
for (weights in allTrueWeights) {
  weightsVector = c(weightsVector, weights)
}
weightsVector <- scalar(weightsVector)
print (weightsVector)


#combine all prices together for complete portfolio
pricesPortfolio <- NULL

for (ticker in ticsVector) {
  pricesPortfolio <- cbind(pricesPortfolio,
                           getSymbols.yahoo(ticker, from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4])
}

print(pricesPortfolio)

returnsPortfolio <- na.omit(ROC(pricesPortfolio))
returnPortfolio <- Return.portfolio(returnsPortfolio, weights=weightsVector)
print(returnPortfolio)

  
#populate benchmark (S&P 500) prices
pricesBenchmark <- getSymbols.yahoo("^GSPC", from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4]

#calculate benchmark returns
returnsBenchmark <- na.omit(ROC(pricesBenchmark))

#check empty values
print(colSums(is.na(pricesBenchmark)))

########
#use the CAPM model to identify required return based on risk
#alpha is excess return on investment relative to the benchmarks
#beta is measure of risk, is a coefficient of the CAPM model
#sharpe ratio describes how much alpha you are making, in terms of standard deviation
########

#DETERMINE A RISK-FREE RATE, and TIME PERIOD IN DAYS!!!!
rf = 0.015
period = 252

#can now look at the beta, alpha, and sharpe ratio of our portfolio vs the benchmark
betaPortfolio = CAPM.beta(returnPortfolio, returnsBenchmark, rf/period)
print(betaPortfolio)
alphaPortfolio = CAPM.jensenAlpha(returnPortfolio, returnsBenchmark, rf/period)
print(alphaPortfolio)
sharpePortfolio = SharpeRatio(returnPortfolio, rf/period)
print(sharpePortfolio)

#finally, lets look at our annualized and calendar returns
table.AnnualizedReturns(returnPortfolio)

table.CalendarReturns(returnPortfolio)

#curiosity, looking at health care
#do the benchmark stuff, but for XLV (Health Care ETF)

#populate benchmark (XLV) prices
pricesXLV <- getSymbols.yahoo("XLV", from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4]

#calculate benchmark returns
returnsXLV <- na.omit(ROC(pricesXLV))

#check empty values
print(colSums(is.na(pricesXLV)))

#can now look at the beta, alpha, and sharpe ratio of our portfolio vs the Health Care benchmark
betaHealthCare = CAPM.beta(returnHealthCare, returnsXLV, rf/period)
print(betaHealthCare)
alphaHealthCare = CAPM.jensenAlpha(returnHealthCare, returnsXLV, rf/period)
print(alphaHealthCare)
sharpeHealthCare = SharpeRatio(returnHealthCare, rf/period)
print(sharpeHealthCare)

#do the benchmark stuff, but for XLK (Info Tech ETF)

#populate benchmark (XLK) prices
pricesXLK <- getSymbols.yahoo("XLK", from="2020-01-01", periodicity='daily', auto.assign=FALSE)[,4]

#calculate benchmark returns
returnsXLK <- na.omit(ROC(pricesXLK))

#check empty values
print(colSums(is.na(pricesXLK)))

#can now look at the beta, alpha, and sharpe ratio of our portfolio vs the Info Techbenchmark
betaInfoTech = CAPM.beta(returnInfoTech, returnsXLK, rf/period)
print(betaInfoTech)
alphaInfoTech = CAPM.jensenAlpha(returnInfoTech, returnsXLK, rf/period)
print(alphaInfoTech)
sharpeInfoTech = SharpeRatio(returnInfoTech, rf/period)
print(sharpeInfoTech)

