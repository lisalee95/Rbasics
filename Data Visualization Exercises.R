ggplot(data =mpg) + geom_point(mapping =aes(x=displ, y=hwy, color ="blue"))
#1.the reason why it is not blue is because color was set under aes and not geom_point

ggplot(data =mpg) + geom_point(color ="blue", mapping=aes(x=displ, y=hwy))
#1.correct answer is the above

?mpg
#2.model name, trans, drv, trans, fl, class are categorical variables
#2.displ, year, cyl, , cty, hwy are continuous variables 

View(mpg)
#2.Allows us to see this information 


ggplot(data = mpg) + geom_point(color ="blue",mapping = aes (x=displ, y=hwy))
#Map for color 

ggplot(data = mpg) + geom_point(mapping = aes (x=displ, y=hwy, color= cty))
#map for color for cty 

ggplot(data = mpg) + geom_point( shape ="square", mapping = aes (x= displ, y=hwy))
#Map for shape, we put variables under aes if they are related to x and y variables

ggplot(data = mpg) + geom_point(mapping =aes (x=displ, y=hwy, size= cty))
#map for size

# For continuous variables, they are being mapped on a spectrum whereas for categorical 
#variables they are sorted into their bins  

ggplot(data = mpg) + geom_point(mapping =aes(x=displ, y=hwy, color = cty, size =cty))
#multiple legends are being created 

ggplot(data = mpg) + geom_point(mapping =aes(x= displ, y=hwy), stroke =3, shape =21)
#stroke adjusts the thickness of the borders 

ggplot(data =mpg) + geom_point(mapping =aes(x= displ, y=hwy, color = displ < 5))
# R returns us a boolean false/true response 

ggplot(data =mpg)+ geom_point(mapping = aes(x=drv, y = cyl)) + facet_wrap(~displ)
#It does not make sense to facet on a continuous variable 

ggplot (data=mpg) + geom_point (mapping = aes(x=drv, y=cyl)) + facet_grid(drv~ cyl)
#empty cells mean there are no observations with those combinations. For instance, there are
#no cars that are 4 wheel drive and have 5 cylinders. 

ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy))+ facet_grid(drv ~ .)
#. acts as a placeholder for no variable. For example, drv x 1 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#we can visualize trends in each facet. However, it is difficult to see the overall trend of 
#these facets. Coloring is ok for small data sets. However for larger data sets, they may 
#overlap and adjustments in jittering may not be enough 

#nrow sets the number of rows. In the example above, we displayed 2 rows. ncol sets
#the number of columns.

# we should put the variables with more unique values in columns so it will extend vertically 
#then horizontally 

ggplot(data =mpg, mapping =aes(x=trans, y=hwy)) +
  geom_boxplot()
#plots boxplot()

ggplot(data =mpg, mapping =aes(x=trans, y=hwy)) +
  geom_line()
#plots geomline 

#show.legend = FALSE will remove the legend 

#se argument removes the confidence intervals 

#they will look the same because they are both making use of the same data and have the same 
#mapping settings. By storing in ggplot, it is automatically resused for each layer

ggplot(data = mpg, mapping =aes(x=displ, y=hwy)) + 
  geom_point(size=3) + geom_smooth(se =FALSE)
# for top left 

ggplot(data =mpg, mapping = aes(x= displ, y=hwy)) + geom_point() + geom_smooth(aes(group= drv), se=FALSE)
#modification to above graph. Only difference is R draws a line for each drv. There are 3 types 
#of drv 

ggplot(data =mpg, mapping = aes(x=displ, y=hwy, color = drv)) + geom_point() + geom_smooth(se=FALSE) 
#aes by color for both geom_point() & geom_smooth() 

ggplot(data = mpg, mapping =aes(x=displ, y=hwy)) + geom_point(aes(color= drv)) + geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x=displ, y=hwy)) + geom_point(aes(color=drv)) + geom_smooth(aes(linetype=drv), se=FALSE)

ggplot(data =mpg, mapping =aes(x=displ, y=hwy)) + geom_point(size =4, color="white")+ geom_point(aes(color=drv))

stat_summary(aes(mpg))
#default geom associate with stat_summary() is geom_pointrange

ggplot(data = diamonds) + geom_col(mapping =aes(x= cut, y = depth))
ggplot(data = diamonds) + geom_bar(mapping=aes( cut, y= depth))
#geom_col automatically transforms into appropriate values but geom_bar uses stat_count to draw the graph

# we need to set group = 1 so the proportions used for each cut uses the subset rather than the 
#complete data set 

ggplot (data = mpg, mapping = aes(x= cty, y=hwy)) + geom_point() + geom_jitter()
#most of the points overlap, so we can add some randomness via geom_jitter 

?geom_jitter  
#width and height controls geom_jitter

ggplot(data = mpg, mapping =aes( x=cty, y=hwy)) + geom_point() + geom_count()
#rather than adding noise, the higer the frequency of those points, the bigger the size it is 

ggplot(data = mpg, mapping =aes( x=trans, y=hwy)) + geom_boxplot(position="dodge")
# the default position is position dodge 

bar <- ggplot(data = diamonds) + geom_bar (mapping =aes(x= cut, fill=cut), width=1) + 
  theme(aspect.ratio =1)+ labs(x= NULL, y=NULL) + bar +coord_polar()
ggplot(data = mpg, mapping = aes(x = factor(1), fill = class)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

#labs help with labels 