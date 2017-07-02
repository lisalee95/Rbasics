#read data into dataframe
house<- read.csv('C:/Users/Lisa Alexandra Lee/Downloads/housedata.csv')

#remove non-useful variables 
house$id<-NULL
house$date<-NULL
house$lat<-NULL
house$long<-NULL
house$sqft_living15<-NULL
house$zipcode<-NULL

#Getting overall sense of data 
summary(house)

#scatter plot of floors with housing prices
plot(house$price, house$floors)

#scatter plot of bathrooms with housing prices
plot(house$price, house$bathrooms)

#create best fit line based on one variable
mod1<- lm(bathrooms ~ price, house)
abline(mod1)

#fit linear model with all predictor variables 
mod <- lm(price ~ ., house)
summary(mod)

#create new observation
newhouse<- data.frame(bedrooms=2, bathrooms=3, sqft_living= 2000, sqft_lot=1581, floors=1.0, waterfront=0, view=0, condition=3, grade=6,sqft_above=1000, sqft_basement=0, yr_built=1995, yr_renovated=0,sqft_lot15=3000)

#predict value of new observation 
predict(mod, newhouse)
