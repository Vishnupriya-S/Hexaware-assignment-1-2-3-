CREATE TABLE Customers (CustomerID int Primary Key,FirstName varchar(30),LastName varchar(20),Email varchar(30) UNIQUE,Phone varchar(10)NOT NULL,
Address varchar(40))

INSERT INTO Customers VALUES(101,'Asfan','Basha','asfanb@gmail.com','9012874910','23 Main St'),
(102,'Swathy','B','swathyb@gmail.com','8068120954','456 Elm St'),(103,'kani','M','kanim@gmail.com','7009451981','789 Oak St'),
(104,'Moni','Senthilkumar','monis@gmail.com','8009012870','02 Pine St'),(105,'Venkatesh','kumar','venkatk@gmail.com','7006501971','234 Maple St'),
(106,'Subash','B','subashb@gmail.com','809012893','567 Cedar St'),(107,'Nandhini','R','nandhinir@gmail.com','7009110936','890 Birch St'),
(108,'Renu','S','renus@gmail.com','8007451098','345 Walnut St'),(109,'Dhanush','S','dhanus@gmail.com','8008250810','678 Oak St'),
(110,'Vinu','R','vinur@gmail.com','7092700510','90 Cherry St'),(111,'Harry','william','harryw@gmail.com','8001967201','Royal st'),
(112,'Praga','V','pragav@gmail.com','9001876530','98 AB st'),(113,'Steve','smith','steves@gmail.com','8019709235','67 Zen st'),
(114,'John','chris','johnc@gmail.com','9071092345','110 Park st'),(115,'Taylor','swift','taylors@gmail.com','8019763101','07 TS st'),
(116,'Stella','merry','stellam@gmail.com','8035019732','6 Fourcorner')
select * from customers
drop table customers
CREATE TABLE Products(ProductID int Primary Key,ProductName varchar(30),Description varchar(40),Price int,categoryid int references categories(categoryid) )

INSERT INTO Products VALUES(1,'Laptop', 'Intel Core i5, 8GB RAM, 512GB SSD', 8000,001),
(2,'Smartphone', ' Snapdragon Processor, 128GB Storage', 6000,002),
(3,'Tablet', '256GB Storage', 4000,003),
(4,'Smartwatch', 'Fitness Tracker, Heart Rate Monitor', 1000,004),
(5,'Wireless Earbuds', 'Bluetooth 5.0, 24-Hour Battery', 2000,005),
(6,'Gaming Console', 'AMD Ryzen Processor, 1TB SSD', 4000,006),
(7,'Bluetooth Speaker', '360-degree Sound, 20-Hour Battery', 7000,007),
(8,'External Hard Drive', '2TB Storage, Backup Software Included', 9000,008),
(9,'Wireless Router', 'Dual-Band Gigabit, Parental Controls', 3000,009),
(10,'Printer', 'Wireless Printing', 5000,010)
select * from products




CREATE TABLE Orders(OrderID int Primary Key,CustomerID int references Customers(CustomerId),OrderDate date,TotalAmount int,status varchar(30))

INSERT INTO Orders VALUES(20001,101,'2024-01-12',10000,'Pending'),(20002,102,'2024-02-13',8000,'Shipped'),(20003,103,'2023-12-13',20000,'Pending'),(20004,104,'2024-02-01',7000,'Pending')
,(20005,105,'2024-01-13',13000,'Pending'),(20006,106,'2024-01-15',7000,'Shipped'),(20007,107,'2024-02-18',15000,'Pending'),(20008,108,'2024-02-29',8000,'Pending'),(20009,109,'2024-01-23',10000,'Pending')
,(20010,110,'2024-01-01',4000,'Shipped'),(20011,111,'2024-01-08',6000,'Shipped'),(20012,112,'2023-12-23',7500,'Pending'),(20013,113,'2024-02-17',2000,'Shipped'),(20014,114,'2024-01-03',11000,'Pending')
,(20015,115,'2023-03-13',7000,'Pending'),(20016,116,'2024-03-01',16000,'Shipped')
drop table Orders
CREATE TABLE OrderDetails(OrderDetailID int Primary Key,OrderID int references Orders(OrderId),ProductID int references Products(ProductId),Quantity int)

INSERT INTO OrderDetails VALUES(1001,20001,1,5),(1002,20002,2,10),(1003,20003,3,7),(1004,20004,4,10),(1005,20005,5,8),(1006,20006,6,1),(1007,20007,7,3),(1008,20008,8,4)
,(1009,20009,9,9),(1010,20010,10,5),(1011,20011,2,10),(1012,20012,1,6),(1013,20013,4,2),(1014,20014,1,1),(1015,20015,5,6),(1016,20016,4,10)

CREATE TABLE Inventory(InventoryID int Primary Key,ProductID int references Products(ProductID),QuantityInStock int,LastStockUpdate date)

INSERT INTO Inventory VALUES(2001,1,10,'2024-01-12'),(2002,2,15,'2024-02-14'),(2003,3,25,'2024-02-20'),(2004,4,30,'2024-01-01'),(2005,5,40,'2024-03-25')
,(2006,6,55,'2024-04-14'),(2007,7,40,'2024-01-26'),(2008,8,5,'2024-02-07'),(2009,9,18,'2024-01-08'),(2010,10,53,'2024-02-19')

CREATE TABLE categories(CategoryID int Primary key,CategoryName varchar(30))
insert into categories values(001,'Electronics'),(002,'Electronics'),(003,'Electronics'),(004,'Electronics'),(005,'Electronics')
,(006,'Electronics'),(007,'Electronics'),(008,'Electronics'),(009,'Electronics'),(010,'Electronics')

--TASK-2-1--
select concat(FirstName,' ',LastName),Email from Customers
--2--
select O.OrderDate,C.FirstName,C.LastName from Orders O,Customers C where O.CustomerID=C.CustomerID

--3--
insert into Customers Values(117,'Kavi','B','kavib@gmail.com','9019875109','3053 PV st')

--4--
update Products set Price=Price*1.1

--5--
declare @OrderIDdelete int
set @OrderIDdelete=216
delete from OrderDetails where OrderID=@OrderIDdelete
delete from Orders where OrderId=@OrderIDdelete

--6--
insert into Orders values (217,117,'2024-04-09',6500,'pending')

--7--
declare @CustomerID int


declare @Phone varchar(10)
declare @Address varchar(40)
set @CustomerID=116

set @Phone='9085102901'
set @Address='ZY st'
update Customers set Phone=@Phone,Address=@Address where CustomerID=@CustomerID 
select* from customers

--8--
update Orders set TotalAmount=(Select (p.Price*o.Quantity) from Products p INNER JOIN OrderDetails o on P.ProductID=o.ProductID  WHERE o.OrderID = Orders.OrderID)

--9--
declare @CustomerIDchange int
set @CustomerIDchange=114
Delete from OrderDetails where OrderID 
IN (select OrderID from Orders where CustomerID = @CustomerIDchange) 
Delete from Orders where CustomerID=@CustomerIDchange
--10--
insert into Products values(11,'Surveillance','360 degree view',11000,010)

--11--
select * from Orders

declare @StatusChange varchar(10)
declare @OrderID int
set @StatusChange='Pending'
set @OrderID=217
update Orders set status=@StatusChange where OrderID=@OrderID
select * from Orders

--12--
select customerid,orderid from orders

--TASK 3--
/*1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
customer name) for each order.*/
select OrderID,FirstName,LastName from Customers INNER JOIN Orders on Customers.CustomerID=Orders.CustomerID

/*Write an SQL query to find the total revenue generated by each electronic gadget product.
Include the product name and the total revenue.*/
select ProductName,sum(Price*Quantity) as 'Total Revenue' from Products INNER JOIN OrderDetails on Products.ProductID=OrderDetails.ProductID group by ProductName
/*3. Write an SQL query to list all customers who have made at least one purchase. Include their
names and contact information.*/
select FirstName,Phone,count(OrderID) as 'OrderCounts' from Orders INNER JOIN Customers on Orders.CustomerID=Customers.CustomerID 
group by OrderID,FirstName,Phone order by OrderCounts

/*4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
total quantity ordered. Include the product name and the total quantity ordered.*/
select ProductName,SUM(Quantity) as 'Highestorder' from Products  INNER JOIN OrderDetails on Products.ProductID=OrderDetails.ProductID group by ProductName
order by Highestorder DESC

/*5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
categories.*/
select ProductName,CategoryName from Products INNER JOIN categories on Products.CategoryID=categories.CategoryID group by ProductName,CategoryName

/*6. Write an SQL query to calculate the average order value for each customer. Include the
customer's name and their average order value.*/
select FirstName,avg(TotalAmount) as 'Average Order value' from Orders INNER JOIN Customers on Orders.CustomerID=Customers.CustomerID group by FirstName

/*7. Write an SQL query to find the order with the highest total revenue. Include the order ID,
customer information, and the total revenue.*/
select o.OrderID,c.CustomerID,c.FirstName,o.TotalAmount as 'Total Revenue' from Orders o INNER JOIN Customers c on o.CustomerID=c.CustomerID order by o.OrderID

/*8. Write an SQL query to list electronic gadgets and the number of times each product has been
ordered.*/
select p.ProductName,count(o.ProductID) as'Productcount' from Products p INNER JOIN OrderDetails o on p.ProductID=o.ProductID group by p.ProductName 
order by Productcount DESC

/*9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
Allow users to input the product name as a parameter.*/
declare @gadget varchar(30)
set @gadget='Laptop'
select c.CustomerID,c.FirstName,p.ProductName from Customers c INNER JOIN Orders o on o.CustomerID=c.CustomerID INNER JOIN OrderDetails od ON 
od.OrderID = o.OrderID INNER JOIN Products p ON p.ProductID = od.ProductID WHERE p.ProductName = @gadget
  
/*10. Write an SQL query to calculate the total revenue generated by all orders placed within a
specific time period. Allow users to input the start and end dates as parameters.*/
declare @start date
declare @end date
set @start='2024-02-13'
set @end='2024-02-17'
select sum(Quantity*Price) as 'Total Revenue' from OrderDetails INNER JOIN Products on OrderDetails.ProductID=Products.ProductID
INNER JOIN Orders on Orders.OrderID=OrderDetails.OrderID where OrderDate between @start and @end

--TASK-4 --
/*1. Write an SQL query to find out which customers have not placed any orders.*/
select Customers.FirstName , Customers.Email  From Customers where Customers.CustomerID NOT IN (select o.CustomerID from Orders o)

/*2. Write an SQL query to find the total number of products available for sale.*/
select count(ProductName) as'TotalProductForSale' from Products where ProductName in (select ProductName from Products)

/*3. Write an SQL query to calculate the total revenue generated by TechShop.*/
select sum(TotalAmount) as 'TotalRevenue'  from Orders where TotalAmount in
(select TotalAmount from Orders)

/*4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
Allow users to input the category name as a parameter.*/
declare @Category varchar(30)
set @category='Electronics'

select avg(od.Quantity) as 'AverageQuantity' from OrderDetails od where Quantity in (select od.Quantity as 'orderquantity' from OrderDetails od 
inner join Products p on od.ProductID=p.ProductID
inner join categories c on p.CategoryID=c.CategoryID where c.CategoryName=@Category) 

/*5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
to input the customer ID as a parameter.*/
declare @CustomerId int
set @CustomerId=112
select * from Orders o where TotalAmount=(select TotalAmount from Orders where CustomerID=@CustomerId)
/*6. Write an SQL query to find the customers who have placed the most orders. List their names
and the number of orders they've placed.*/
select count(od.OrderID) as'TotalOrders' ,c.FirstName from Orders od JOIN Customers c on c.CustomerID=od.CustomerID where od.CustomerID in 
(select c.CustomerID from Customers c )group by c.FirstName

/*7. Write an SQL query to find the most popular product category, which is the one with the highest
total quantity ordered across all orders.*/
select c.CategoryName,SUM(od.Quantity) as 'Highestorder' from OrderDetails od where Quantity in (select Quantity from OrderDetails od INNER JOIN products p on 
p.ProductID=od.ProductID inner join categories c on p.CategoryID=c.CategoryID)
order by Highestorder DESC


/*8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
on electronic gadgets. List their name and total spending.*/
select FirstName,max(TotalAmmount) as'HighestTotalRevenue' from (select c.FirstName from customers c inner join orders o on o.customerID=c.customerID 
group by c.FirstName)

/*9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
Allow users to input the product name as a parameter.*/
declare @ProductName varchar(30)
set @ProductName='Laptop'
Select c.customerid, c.firstname from customers c join orders o on c.customerid = o.customerid
join orderdetails od on o.orderid = od.orderid join  products p on od.productid = p.productid where p.productname = @ProductName

/*10. Write an SQL query to calculate the total revenue generated by all orders placed within a
specific time period. Allow users to input the start and end dates as parameters.*/
declare @startdate date
declare @enddate date
set @startdate='2024-01-12'
set @enddate='2024-02-18'
select sum(Totalamount) as TotalRevenue from orders where orderdate between @startdate and @enddate
