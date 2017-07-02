#find correlation between 5 stocks for 3 month period
#UL(Unilever), KHC(Kraft Heinz), JPM (JP Morgan), BAC (BankofAmerica), C(CitiGroup) 

#read data into dataframe
all_prices<-read.csv('allprices.csv', header = TRUE)


#remove irrelevant  variable
all_prices$DATE<- NULL

#convert prices to log returns
compute_pairwise_correlations<-function(all_prices){
returns<-apply(all_prices,2, function(x) diff(log(x)))

#plot the pairwise relationships 
pairs(returns, main ="Pairwise return scatter plot")

#calculate pairwise correlations
correlation_matrix<- cor(returns, use="complete.obs")
return(correlation_matrix)
}
correlation_matrix

