View(flights)

  filter(flights, arr_delay > 120)
#had an arrival delay of two or more hours 
  
  filter(flights, dest == "IAH" | dest == "HOU")
# Flew to Houston (IAH or HOU)
  
filter(flights, carrier =="UA"| carrier =="AA"| carrier =="DL")  
#Operated by United, AA, Delta 

summerflights<-filter(flights, month >= 7, month <=9)
#Departed in summer (July, August, September)

filter(flights, arr_delay >=120, dep_delay<= 0)
#Arrived more than two hours late, but didn't leave late

filter(flights, arr_delay>=60, dep_delay - arr_delay>30)
#Were delayed by more than an hour late, but didn't leave late 

filter(flights, sched_dep_time >= 0, sched_dep_time<=600)
#Departed between midnight and 6am 

filter(flights, between(sched_dep_time, 0, 600))
#between() function 

filter(flights, (is.na(dep_time)))
#flights have a missing dep_time 

arrange(flights, !is.na(dep_time))
#sort all missing values of dep_time 

arrange(flights, desc(dep_delay))
#flights that are most delayed based on departure 

arrange(flights, dep_delay)
#flights that left earliest 

arrange(flights, desc(distance/air_time))
#fastest flights based on speed= distance/time

arrange(flights, desc(distance))
#travelled the longest 

arrange(flights, distance)
#travelled the shortest 

select(flights, dep_time, dep_delay, arr_time, arr_delay )
#select those respective columns 

select(flights, dep_time, dep_delay, dep_delay, dep_delay)
#R will just treat them as one 

vars<- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
# it selects one of each of the coloumns stored in the variable 

select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))
# set ignore.case = FALSE

