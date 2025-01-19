-- creating Database 

create database SQL_Mandatory_Assignment_2

use SQL_Mandatory_Assignment_2


-- Q1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

create function chicken_bites(@call1 as varchar(200))
returns varchar(200)
as 
begin 
return(iif(@call1 = 'Quick Bites', 'Quick Chicken Bites', @call1)) 
end;

select RestaurantName, RestaurantType,dbo.chicken_bites2(RestaurantType)
from Jomato


--Q2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

create function display1()
returns table
as
return
( select RestaurantName,CuisinesType,max(No_of_Rating) as max_rating 
from Jomato 
group by RestaurantName,CuisinesType)

select * from dbo.display1()


--Q3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating,
--    ‘Good’ if it has above 3.5 and below 5 star rating,
--    ‘Average’ if it is above 3 and below 3.5 and 
--     ‘Bad’ if it is below 3 star rating.

select RestaurantName,RestaurantType,Rating,Area,
case 
when Rating > 4 then 'Excellent'
when Rating > 3.5 and Rating <= 4 then 'Good'
when Rating > 3 and Rating <= 3.5 then 'Average'
else 'Bad'
end as RatingStatus
from Jomato;

--Q4. Find the Ceil, floor and absolute values of the rating column and 
--    display the current date and separately display the year, month_name and day.

select RestaurantName,Rating,ceiling(Rating) as CeilRating,floor(Rating) as FloorRating,abs(Rating) as AbsoluteRating,
    getdate() as 'Current Date',year(getdate()) as 'Year',datename(month, getdate()) as 'Month Name',
    day(getdate()) as 'Day'
from Jomato;

--Q5. Display the restaurant type and total average cost using rollup.


select RestaurantType,sum(AverageCost) as 'Total Average Cost'
from Jomato
group by rollup(RestaurantType);
