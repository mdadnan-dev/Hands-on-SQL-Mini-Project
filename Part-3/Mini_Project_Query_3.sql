-- create a database 

create database SQL_Mandaatory_Assignment_3;
 
use SQL_Mandaatory_Assignment_3
  
select * from Jomato

 
--Q1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
 
create procedure Jomato_Display
as
select RestaurantName, RestaurantType, CuisinesType 
from Jomato
where TableBooking != 0
go

exec Jomato_Display



--Q2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
 
begin transaction
 
update Jomato
set CuisinesType = 'Cafeteria'
where CuisinesType = 'Cafe'

select * from Jomato
where CuisinesType = 'Cafeteria'

rollback
 
select * from Jomato 
where CuisinesType = 'Cafe'
 
--Q3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
 
select top 5 Area, Rating, row_number() over (order by Rating desc) as 'Row Number'
from Jomato

--Q4. Use the while loop to display the 1 to 50.
 
declare @counter int = 1

while @counter <= 50
begin
    print @counter; 
	set @counter = @counter + 1
end



--Q5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
-- Step 1: Create the view

create view TopRatingRestaurants as
select top 5 Area, Rating, row_number() over (order by Rating desc) as 'Row Number'
from Jomato

select * from TopRatingRestaurants;


--Q6. Write a trigger that sends an email notification to the restaurant owner whenever a new record is inserted

create trigger NotifyRestaurantOwner1
on Jomato
after insert
as
begin
    declare @RestaurantName nvarchar(255);
    declare @EmailBody nvarchar(1000);

   
    select @RestaurantName = RestaurantName from inserted;

    
    set @EmailBody = 'A new restaurant named "' + @RestaurantName + '" has been added to the database.';

    exec msdb.dbo.sp_send_dbmail
        @profile_name = 'YourMailProfileName',
        @recipients = 'restaurant_owner@example.com',
        @subject = 'New Restaurant Added', 
        @body = @EmailBody; 
end;

insert into Jomato (OrderID, RestaurantName, RestaurantType, Rating, No_of_rating, AverageCost, OnlineOrder, TableBooking, CuisinesType, Area, Localaddress, Delivery_time)
values (1, 'New Restaurant', 'Type', 5, 100, 500, 1, 0, 'Indian', 'Some Area', '123 Street', 30);




select * from Jomato


























