create table Customers(customer_id int Primary Key,first_name varchar(30),last_name varchar(20),DOB Date,email varchar(30),phone_number varchar(10),address varchar(30))
insert into Customers values(1,'Asfan','Basha','2003-12-08','asfanb@gmail.com','9012874910','Bangalore'),
(2,'Swathy','B','2005-06-15','swathyb@gmail.com','8068120954','Pondicherry'),(3,'kani','M','2003-12-15','kanim@gmail.com','7009451981','Pune'),
(4,'Moni','Senthilkumar','2015-02-12','monis@gmail.com','8009012870','Hyderabad'),(5,'Venkatesh','kumar','2015-12-06','venkatk@gmail.com','7006501971','Calicut'),
(6,'Subash','B','2009-05-09','subashb@gmail.com','8090128932','Pune'),(7,'Kavi','B','2006-03-12','kavib@gmail.com','7009110936','Coimbatore'),
(8,'Renu','S','2008-09-18','renus@gmail.com','8007451098','Mumbai'),(9,'Dhanush','S','2018-06-05','dhanus@gmail.com','8008250810','Coimbatore'),
(10,'Vinu','R','2007-08-10','vinur@gmail.com','7092700510','Bangalore'),(11,'Harry','william','2001-07-26','harryw@gmail.com','8001967201','Chennai'),
(12,'Praga','V','2002-01-15','pragav@gmail.com','9001876530','Pune'),(13,'Steve','smith','2007-04-28','steves@gmail.com','8019709235','Coimbatore')
select* from Customers
create table Accounts(account_id int Primary Key,customer_id int references Customers(customer_id),account_type varchar(30),balance int)
insert into Accounts values(201,1,'savings',10000),(202,2,'current',11000),(203,3,'current',6000),(204,4,'zero_balance',1000),(205,5,'savings',5000)
,(206,6,'savings',4000),(207,7,'savings',0),(208,8,'current',3000),(209,9,'zero_balance',8000),(210,10,'zero_balance',200)
,(211,11,'savings',5000),(212,12,'current',3000),(213,13,'zero_balance',9000)
insert into accounts values (214,13,'savings',6300)
select* from accounts


create table Transactions(transaction_id int Primary Key,account_id int references Accounts(account_id),transaction_type varchar(30)
,amount int ,transaction_date date)
insert into Transactions values(1001,201,'deposit',200,'2024-04-12'),(1002,202,'withdraw',500,'2024-03-12'),(1003,203,'transfer',600,'2024-02-12')
,(1004,204,'deposit',500,'2024-02-11'),(1005,205,'withdraw',300,'2024-04-22'),(1006,206,'current',700,'2024-04-21'),(1007,207,'transfer',500,'2024-03-12')
,(1008,208,'withdraw',300,'2024-04-22'),(1009,209,'deposit',1000,'2024-01-22'),(1010,210,'withdraw',450,'2024-01-02')
,(1011,211,'deposit',200,'2024-03-12'),(1012,212,'trasfer',1200,'2024-03-26'),(1013,213,'deposit',500,'2024-04-25')

update transactions set account_id=208 where account_id=205
/*TASK-2
1. Write a SQL query to retrieve the name, account type and email of all customers.*/
select customers.first_name,customers.email,accounts.account_type from customers,accounts where customers.customer_id=accounts.customer_id

/*2. Write a SQL query to list all transaction corresponding customer.*/
select a.customer_id,* from transactions t,accounts a where a.account_id=t.account_id

/*3. Write a SQL query to increase the balance of a specific account by a certain amount.*/
update accounts set balance=3550 where customer_id=12

/*4. Write a SQL query to Combine first and last names of customers as a full_name.*/
select concat(first_name,' ',last_name) as FullName from Customers

/*5. Write a SQL query to remove accounts with a balance of zero where the account
type is savings.*/
delete from transactions where account_id in(select account_id from accounts where balance=0 and account_type='savings')
delete from accounts where balance=0 and account_type='savings'
select * from accounts

/*6.Write a SQL query to Find customers living in a specific city.*/
select first_name,address from customers where address in('Pune')

/*7. Write a SQL query to Get the account balance for a specific account.*/
select balance from accounts where account_id=201

/*8. Write a SQL query to List all current accounts with a balance greater than $1,000.*/
select customer_id from accounts where balance>1000

/*9. Write a SQL query to Retrieve all transactions for a specific account.*/
select * from transactions where account_id=212

/*10. Write a SQL query to Calculate the interest accrued on savings accounts based on a
given interest rate.*/
select account_id,balance * (0.02 / 100) AS interest_accrued from accounts where  account_type = 'savings'



/*12. Write a SQL query to Find customers not living in a specific city.*/
select first_name,address from customers where address not in ('Pune','Mumbai')

/*TASK 3
1.Write a SQL query to Find the average account balance for all customers.*/
select avg(balance) as AverageBalance from accounts

/*2. Write a SQL query to Retrieve the top 10 highest account balances.*/
select customer_id,max(balance) as Highestaccount from accounts group by customer_id

create table Customers(customer_id int Primary Key,first_name varchar(30),last_name varchar(20),DOB Date,email varchar(30),phone_number varchar(10),address varchar(30))
insert into Customers values(1,'Asfan','Basha','2003-12-08','asfanb@gmail.com','9012874910','Bangalore'),
(2,'Swathy','B','2005-06-15','swathyb@gmail.com','8068120954','Pondicherry'),(3,'kani','M','2003-12-15','kanim@gmail.com','7009451981','Pune'),
(4,'Moni','Senthilkumar','2015-02-12','monis@gmail.com','8009012870','Hyderabad'),(5,'Venkatesh','kumar','2015-12-06','venkatk@gmail.com','7006501971','Calicut'),
(6,'Subash','B','2009-05-09','subashb@gmail.com','8090128932','Pune'),(7,'Kavi','B','2006-03-12','kavib@gmail.com','7009110936','Coimbatore'),
(8,'Renu','S','2008-09-18','renus@gmail.com','8007451098','Mumbai'),(9,'Dhanush','S','2018-06-05','dhanus@gmail.com','8008250810','Coimbatore'),
(10,'Vinu','R','2007-08-10','vinur@gmail.com','7092700510','Bangalore'),(11,'Harry','william','2001-07-26','harryw@gmail.com','8001967201','Chennai'),
(12,'Praga','V','2002-01-15','pragav@gmail.com','9001876530','Pune'),(13,'Steve','smith','2007-04-28','steves@gmail.com','8019709235','Coimbatore')
select* from Customers
create table Accounts(account_id int Primary Key,customer_id int references Customers(customer_id),account_type varchar(30),balance int)
insert into Accounts values(201,1,'savings',10000),(202,2,'current',11000),(203,3,'current',6000),(204,4,'zero_balance',1000),(205,5,'savings',5000)
,(206,6,'savings',4000),(207,7,'savings',0),(208,8,'current',3000),(209,9,'zero_balance',8000),(210,10,'zero_balance',200)
,(211,11,'savings',5000),(212,12,'current',3000),(213,13,'zero_balance',9000)
select* from accounts

create table Transactions(transaction_id int Primary Key,account_id int references Accounts(account_id),transaction_type varchar(30)
,amount int ,transaction_date date)
insert into Transactions values(1001,201,'deposit',200,'2024-04-12'),(1002,202,'withdraw',500,'2024-03-12'),(1003,203,'transfer',600,'2024-02-12')
,(1004,204,'deposit',500,'2024-02-11'),(1005,205,'withdraw',5000,'2024-01-12'),(1006,206,'current',700,'2024-04-21'),(1007,207,'transfer',500,'2024-03-12')
,(1008,208,'withdraw',300,'2024-04-22'),(1009,209,'deposit',1000,'2024-01-22'),(1010,210,'withdraw',450,'2024-01-02')
,(1011,211,'deposit',200,'2024-03-12'),(1012,212,'trasfer',1200,'2024-03-26'),(1013,213,'deposit',500,'2024-04-25')

/*TASK-2
1. Write a SQL query to retrieve the name, account type and email of all customers.*/
select customers.first_name,customers.email,accounts.account_type from customers,accounts where customers.customer_id=accounts.customer_id

/*2. Write a SQL query to list all transaction corresponding customer.*/
select a.customer_id,* from transactions t,accounts a where a.account_id=t.account_id

/*3. Write a SQL query to increase the balance of a specific account by a certain amount.*/
update accounts set balance=3550 where customer_id=12

/*4. Write a SQL query to Combine first and last names of customers as a full_name.*/
select concat(first_name,' ',last_name) as FullName from Customers

/*5. Write a SQL query to remove accounts with a balance of zero where the account
type is savings.*/
delete from transactions where account_id in(select account_id from accounts where balance=0 and account_type='savings')
delete from accounts where balance=0 and account_type='savings'
select * from accounts

/*6.Write a SQL query to Find customers living in a specific city.*/
select first_name,address from customers where address in('Pune')

/*7. Write a SQL query to Get the account balance for a specific account.*/
select balance from accounts where account_id=201

/*8. Write a SQL query to List all current accounts with a balance greater than $1,000.*/
select customer_id from accounts where balance>1000

/*9. Write a SQL query to Retrieve all transactions for a specific account.*/
select * from transactions where account_id=212

/*10. Write a SQL query to Calculate the interest accrued on savings accounts based on a
given interest rate.*/


/*12. Write a SQL query to Find customers not living in a specific city.*/
select first_name,address from customers where address not in ('Pune','Mumbai')

/*TASK 3
1.Write a SQL query to Find the average account balance for all customers.*/
select avg(balance) as AverageBalance from accounts

/*2. Write a SQL query to Retrieve the top 10 highest account balances.*/
select customer_id,max(balance) from accounts group by customer_id

/*3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.*/
select amount from transactions where transaction_date='2024-04-12' and transaction_type='deposit'

/*4. Write a SQL query to Find the Oldest and Newest Customers.*/
select min(dob) as Oldest_customer ,max(dob) as Newest_customer from customers

/*5. Write a SQL query to Retrieve transaction details along with the account type.*/
select account_type,* from transactions inner join accounts on transactions.account_id=accounts.account_id

/*6. Write a SQL query to Get a list of customers along with their account details.*/
select * from customers inner join accounts on customers.customer_id=accounts.customer_id

/*7. Write a SQL query to Retrieve transaction details along with customer information for a
specific account.*/
select * from transactions t inner join accounts a on t.account_id=a.account_id inner join customers c on a.customer_id=c.customer_id
WHERE t.account_id = 212

/*8. Write a SQL query to Identify customers who have more than one account.*/
select c.first_name from customers c inner join accounts a on c.customer_id=a.customer_id group by c.customer_id,c.first_name having count(c.customer_id)>1

/*9. Write a SQL query to Calculate the difference in transaction amounts between deposits and
withdrawals.*/

select difference((select sum(amount) from transactions where transaction_type='deposit'),
(select sum(amount) from transactions where transaction_type='withdraw')) 
as DiffTransaction

/*10. Write a SQL query to Calculate the average daily balance for each account over a specified
period.*/
select account_id,avg(amount) AS average_daily_balance FROM transactions
where transaction_date BETWEEN '2024-03-12' AND '2024-04-12' group by account_id


/*11. Calculate the total balance for each account type.*/
select account_type,sum(balance) as TotalBalance from accounts group by account_type

/*12. Identify accounts with the highest number of transactions order by descending order.*/
select * from transactions order by amount desc

/*13. List customers with high aggregate account balances, along with their account types.*/
select customer_id,account_type,balance from accounts order by balance desc

/*14. Identify and list duplicate transactions based on transaction amount, date, and account.*/

select t.transaction_id from transactions t join transactions t1 on t.amount=t1.amount and t.account_id=t1.account_id and t.transaction_date=t1.transaction_date
and t.transaction_id<>t1.transaction_id

/*TASK 4
1. Retrieve the customer(s) with the highest account balance.*/
select * from accounts where balance=
(select max(balance) from accounts) 

/*2. Calculate the average account balance for customers who have more than one account.*/
select avg(balance) as AverageAccountBalance from accounts where customer_id=
(select customer_id from accounts group by customer_id having count(customer_id)>1)

/*3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.*/
select account_id,balance from accounts where balance>(select avg(balance) as AverageAccountBalance from accounts)

/*4. Identify customers who have no recorded transactions.*/
select customer_id,first_name from customers where customer_id not in (select customer_id from accounts inner join transactions on
accounts.account_id=transactions.account_id)

/*5. Calculate the total balance of accounts with no recorded transactions.*/
select sum(balance) as TotalBalance from accounts where account_id not in (select account_id from transactions)

/*6. Retrieve transactions for accounts with the lowest balance.*/
select * from transactions inner join accounts on transactions.account_id=accounts.account_id where accounts.account_id in (
select account_id from accounts where balance=
(select min(balance) from accounts))

/*7. Identify customers who have accounts of multiple types.*/

select c.customer_id,c.first_name from customers c inner join accounts a on a.customer_id=c.customer_id group by c.customer_id,c.first_name
having count(account_type)>1

/*8. Calculate the percentage of each account type out of the total number of accounts.*/
select account_type,count(*) as NoOfAccounts,(count(*)*100/(select count(*) from accounts)) as percentage from accounts group by account_type


/*9. Retrieve all transactions for a customer with a given customer_id.*/
select * from transactions where account_id in(select account_id from accounts where customer_id= 11)

/*10. Calculate the total balance for each account type, including a subquery within the SELECT
clause.*/
select account_type,(select sum(balance) from accounts a where a.account_type = accounts.account_type) AS total_balance from accounts group by account_type
