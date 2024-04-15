create table Students(student_id int Primary Key,first_name varchar(30),last_name varchar(20),date_of_birth date,email varchar(30),phone_number varchar(10))

insert into Students values(101,'Asfan','Basha','2003-12-08','asfanb@gmail.com','9012874910'),
(102,'Swathy','B','2005-06-15','swathyb@gmail.com','8068120954'),(103,'kani','M','2003-12-15','kanim@gmail.com','7009451981'),
(104,'Moni','Senthilkumar','2015-02-12','monis@gmail.com','8009012870'),(105,'Venkatesh','kumar','2015-12-06','venkatk@gmail.com','7006501971'),
(106,'Subash','B','2009-05-09','subashb@gmail.com','8090128932'),(107,'Nandhini','R','2006-03-12','nandhinir@gmail.com','7009110936'),
(108,'Renu','S','2008-09-18','renus@gmail.com','8007451098'),(109,'Dhanush','S','2018-06-05','dhanus@gmail.com','8008250810'),
(110,'Vinu','R','2007-08-10','vinur@gmail.com','7092700510'),(111,'Harry','william','2001-07-26','harryw@gmail.com','8001967201'),
(112,'Praga','V','2002-01-15','pragav@gmail.com','9001876530'),(113,'Steve','smith','2007-04-28','steves@gmail.com','8019709235')

select * from Students
drop table Students

create table Courses(course_id int Primary Key,course_name varchar(20),credits int,teacher_id int references Teacher(teacher_id))
insert into Courses values(1,'Python',2,201),(2,'C',3,202),(3,'C++',4,203),(4,'ML',2,204),(5,'Java',4,205),(6,'NLP',3,206)
,(7,'DL',4,202),(8,'CV',2,204),(9,'OS',3,201),(10,'MATLAB',1,206)
select * from Courses

create table Enrollments(enrollment_id int Primary Key,student_id int references Students(student_id) ON DELETE CASCADE,course_id int references Courses(course_id)
,enrollment_date date)

insert into Enrollments values(10001,101,1,'2024-01-12'),(10002,102,2,'2024-01-17'),(10003,103,3,'2024-02-12'),(10004,104,4,'2024-02-16'),(10005,105,5,'2024-04-05')
,(10006,106,6,'2024-04-12'),(10007,107,1,'2024-02-22'),(10008,108,4,'2024-03-25'),(10009,109,3,'2024-03-02'),(10010,110,2,'2024-01-28'),
(10011,111,1,'2024-02-14'),(10012,112,2,'2024-04-18'),(10013,113,3,'2024-02-01')
insert into Enrollments (enrollment_id,student_id) values(10014,114)
select * from Enrollments
drop table Enrollments

create table Teacher(teacher_id int Primary Key,first_name varchar(30),last_name varchar(20),email varchar(30))
insert into Teacher values(201,'Riya','Ram','riyar@gmail.com'),(202,'Praga','S','pragas@gmail.com'),(203,'Vishnu','sundharam','vishnu@gmail.com'),
(204,'Sharan','B','sharanb@gmail.com'),(205,'Barani','T','baranit@gmail.com'),(206,'Hari','Kumar','harik@gmail.com')
select * from Teacher

create table Payments(payment_id int Primary Key,student_id int references Students(student_id),amount int ,payment_date date)

insert into Payments values (20001,101,3000,'2024-01-17'),(20002,102,4000,'2024-02-10'),(20003,103,5000,'2024-03-10'),(20004,104,6000,'2024-01-10')
,(20005,105,2000,'2024-01-20'),(20006,106,7000,'2024-02-25'),(20007,107,8000,'2024-02-26'),(20008,108,7500,'2024-01-01'),(20009,109,1000,'2024-02-11')
,(20010,110,6000,'2024-02-18'),(20011,111,4500,'2024-04-10'),(20012,112,1000,'2024-04-01'),(20013,113,3500,'2024-03-23')

select * from Payments

/*Task-2 
1)1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John

© Hexaware Technologies Limited. All rights www.hexaware.com

b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/
 insert into Students values(114,'John','Doe','1995-08-15','john.doe@example.com','1234567890')

 /*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
insert a record into the "Enrollments" table with the enrollment date.*/
 insert into Enrollments values(1014,114,4,'2024-03-27')

 /*3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address.*/
 update Teacher set email='sara@gmail.com' where teacher_id=204

 /*4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
an enrollment record based on the student and course.*/
 delete from Enrollments where student_id=114
 select * from enrollments

 /*5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables.*/
 update Courses set course_name='R' where course_id=10
 update Courses set course_name='NLP' where course_id=6
 select * from Courses

 /*6. Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity.*/

 ALTER TABLE Enrollments DROP CONSTRAINT student_id
 ALTER TABLE Enrollments ADD CONSTRAINT FK_Student_Enrollment Foreign key(student_id) REFERENCES Students(student_id) ON DELETE CASCADE
 delete from Students where student_id=110

 /*7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount.*/
 update Payments set amount=10000 where payment_id=2001


 --TASK-3--
 /*1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student's ID.*/
 SELECT s.student_id,s.first_name,sum(p.amount) as'TotalAmount' from Students s INNER JOIN Payments p on s.student_id=p.student_id where s.student_id=103 
 group by s.student_id,s.first_name

 /*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.*/
 select course_name,count(student_id) as 'Total student' from Enrollments INNER JOIN Courses ON Courses.course_id=Enrollments.course_id group by course_name
 order by course_name 

 /*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.*/
 select s.first_name,e.course_id from Students s LEFT JOIN Enrollments e on s.student_id=e.student_id where e.course_id IS NULL

 /*4. Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.*/
 select s.first_name,s.last_name,c.course_name from Students s INNER JOIN Enrollments e on e.student_id=s.student_id INNER JOIN Courses c 
 on c.course_id=e.course_id

 /*5. Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.*/
 select c.course_name,concat(t.first_name,' ',t.last_name) as 'Staff Name' from Courses c INNER JOIN Teacher t on c.teacher_id=t.teacher_id

 /*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
"Students" table with the "Enrollments" and "Courses" tables.*/
 select e.course_id,s.first_name,e.enrollment_date from Students s INNER JOIN Enrollments e on e.student_id=s.student_id where e.course_id=9

 /*7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
"Students" table and the "Payments" table and filter for students with NULL payment records.*/
 select s.student_id,s.first_name from Students s LEFT JOIN Payments p on p.student_id=s.student_id where p.amount is null

 /*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.*/
 select c.course_name from Courses c LEFT JOIN Enrollments e on c.course_id=e.course_id where e.course_id is NULL

 /*9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
table to find students with multiple enrollment records.*/
 select enrol.student_id from Enrollments enrol INNER JOIN Enrollments e2 on enrol.student_id=e2.student_id and enrol.course_id <> e2.course_id

 /*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
table and the "Courses" table and filter for teachers with NULL course assignments.*/
 select c.course_id,t.teacher_id from Courses c LEFT JOIN Teacher t on c.teacher_id=t.teacher_id where t.teacher_id is NULL

 --TASK 4 -1--
/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.*/

 SELECT AVG(student_count) AS average_students_per_course FROM (SELECT course_id, COUNT(student_id) AS student_count FROM enrollments
GROUP BY course_id) AS course_counts
/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.*/

SELECT student_id FROM payments WHERE amount = (SELECT MAX(amount) FROM payments)

/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.*/
select course_name from courses c where c.course_id in
(select course_id from enrollments group by course_id having count(course_id)>1)


/*5. Identify students who are enrolled in all available courses. Use subqueries to compare a
student's enrollments with the total number of courses.*/
select student_id from (select student_id, count(course_id) AS enrolled_courses from enrollments GROUP BY student_id
) AS student_courses where enrolled_courses = (select count(*) from courses)
select* from enrollments
select* from courses

/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments.*/
select first_name from teacher where teacher_id NOT IN (select teacher_id from courses)

/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student
based on their date of birth.*/
select AVG(age) AS average_ag FROM (SELECT datediff(year, date_of_birth, getDATE()) AS age FROM students) AS student_ages

/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.*/
select course_id, course_name from courses where course_id NOT IN (select  course_id from enrollments);

/*9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments.*/
select student_id, SUM(amount) AS total_payments from  payments where student_id IN (select student_id from enrollments)
group by student_id
/*10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.*/
insert into payments values(20014,111,3000,'2024-03-27')
select  student_id,amount from payments where student_id in 
(select student_id from payments group by student_id having count(student_id)>1 ) 

/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.*/
select s.student_id,s.first_name,sum(p.amount) AS total_payments from  Students s
JOIN Payments p ON s.student_id = p.student_id
group by s.student_id, s.first_name

/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.*/

select c.course_name,count(e.student_id) as TotalStudent from courses c inner join enrollments e on c.course_id=e.course_id group by c.course_name 

/*13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/
select s.student_id,avg(amount) as AveragePayment from students s inner join payments p on p.student_id=s.student_id group by s.student_id 


