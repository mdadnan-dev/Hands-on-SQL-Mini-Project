

-- Q1. Insert a new record in your Orders table.

insert into Orders Values
(5002,1234,101,'2023-02-01',1000.00)

select * from orders

-- Q2 
-- Add Primary key constraint for SalesmanId column in Salesman table.
select * from salesman

alter table Salesman 
alter column SalesmanId int not null

alter table salesman
add constraint pk_salesmanID primary key (SalesmanId)


-- Add default constraint for City column in Salesman table.
alter table salesman 
add constraint df_City_Salesman default('India') for city

select * from salesman


-- Add Foreign key constraint for SalesmanId column in Customer table.
select *
from Customer
where SalesmanId not in (select SalesmanId from Salesman);

update customer
set salesmanid = 104
where salesmanid not in (select SalesmanId from Salesman)

alter table customer
add constraint fk_salesmanId_Customer foreign key (SalesmanId) references Salesman(SalesmanId) 





-- Add not null constraint in Customer_name column for the Customer table

alter table customer
alter column CustomerName varchar(255) not null



-- Q3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500

select * 
from customer
where CustomerName like '%n' and PurchaseAmount > 500


-- Q4. Using SET operators,
--     retrieve the first result with unique SalesmanId values from two tables,

select salesmanId
from customer
union
select salesmanId 
from orders

--     and the other result containing SalesmanId with duplicates from two tables

select SalesmanId
from customer
union all 
select SalesmanId
from orders

-- Q5. Display the below columns which has the matching data.
--    Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500

select * 
from orders o 
join salesman s on o.salesmanid = s.salesmanid
join customer c on c.salesmanid = o.salesmanid
where c.PurchaseAmount between 500 and 1500

-- Q6. Using right join fetch all the results from Salesman and Orders table

select *
from salesman s
right join orders o on s.SalesmanId = o.SalesmanId 






