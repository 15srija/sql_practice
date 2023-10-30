use database_1;
create table employee(
      EmployeeID int,
      Name varchar(20),
      salary int);
show tables;
select * from employee;
insert into employee values(101,'smith',5000),
						 (102,  'bill',10000),
                         (103, 'mark',15000),
                         (104, 'zen',3000),
                         (105, 'zoe', 4000);

#Find all the employee whose salary is more than the average salary of all employees. 
#Name of the relation: Employee 
with average_salary (avg_sal) as (select avg(salary) from employee)
select *
from employee e, average_salary av where e.salary>av.avg_sal;


create table sales(store_id int,store_name varchar(20),product varchar(20),quantity int,cost int);
insert into sales values(1,'apple store1','iphone 12 pro',1,1000),
                        (1,'apple store1','macbook',3,2000),
						(1,'apple store1','airpods pro',2,100),
                        (2,'apple store2','iphone 12 pro',1,1000),
                        (3,'apple store3','iphone 12 pro',1,1000),
                        (3,'apple store3','macbook',4,2000),
                        (3,'apple store3','macbook air',2,1100),
                        (3,'apple store3','iphone 12',3,1000),
                        (3,'apple store3','airpods pro',2,200),
                        (4,'apple store4','iphone 12 pro',1,1000),
                        (4,'apple store4','macbook 12 pro',4,2500);
                        
select * from sales;
# find stores whose sales where better than the average sales across all stores

