# quant-finance

There are different optimization methods we can use in PortfolioAnalytics:
•weight_sum,weight,leverageSpecify constraint on the sum of the weights, seeweight_sum_constraint•
full_investmentSpecial case to setmin_sum=1andmax_sum=1of weight sum constraints
•dollar_neutral,activeSpecial case to setmin_sum=0andmax_sum=0of weight sum con-straints
•boxbox constraints for the individual asset weights, seebox_constraint•long_onlySpecial case to setmin=0andmax=1of box constraints
•groupspecify  the  sum  of  weights  within  groups  and  the  number  of  assets  with  non-zeroweights in groups, seegroup_constraint
12add.constraint
•turnoverSpecify a constraint for target turnover. Turnover is calculated from a set of initialweights, seeturnover_constraint
•diversificationtarget diversification of a set of weights, seediversification_constraint
•position_limitSpecify the number of non-zero, long, and/or short positions, seeposition_limit_constraint•returnSpecify the target mean return, seereturn_constraint
•factor_exposureSpecify risk factor exposures, seefactor_exposure_constraint•leverage_exposureSpecify a maximum leverage exposure, seeleverage_exposure_constraint
