use database_1;
create table salesman (salesman_id integer, name varchar(20), city varchar(20), commission float);
insert into salesman values (5001,'James Hoog','New York',0.15),
                            (5002,'Nail Knite','Paris',0.13),
                            (5003,'Lauson Hen','San Jose',0.12),
                            (5005,'Pit Alex','London',0.11),
                            (5006,'Mc Lyon','Paris',0.14),
                            (5007,'Paul Adam','Rome',0.13);
select * from salesman;

create table customer (customer_id integer, cust_name varchar(20), city varchar(20), grade int,salesman_id int);
insert into customer values (3002,'Nick Rimando','New York',100,5001),
                            (3007,'Brad Davis','New York',200,5001),
                            (3005,'Graham Zusi','California',200,5002),
                            (3008,'Julian Green','London',300,5002),
                            (3004,'Fabian Johnson','Paris',300,5006),
                            (3009,'Geoff Cameron','Berlin',100,5003),
                            (3003,'Jozy Altidor','Moscow',200,5007),
                            (3001,'Brad Guzan','London',null,5005);

select * from customer;

#write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

select c.cust_name,c.city,s.name,s.commission
from customer c
join salesman s
on c.salesman_id=s.salesman_id
where s.commission*100 > 12;

-- write a SQL query to locate those salespeople 
-- who do not live in the same city where their customers live and
--  have received a commission of more than 12% from the company. 
-- Return Customer Name, customer city, Salesman, salesman city, commission.

select c.cust_name,c.city,s.name,s.city,s.commission
from customer c 
join salesman s
on c.salesman_id = s.salesman_id
where c.city != s.city and s.commission*100>12;

-- write a SQL query to find the details of an order.
-- Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
create table orders(ord_no int,purch_amt float,ord_date date,customer_id int,salesman_id int);
insert into orders values (70001,150.5,'2012-10-05',3005,5002),
						  (70009,270.65,'2012-09-10',3001,5005),
                          (70002,65.26,'2012-10-05',3002,5001),
                          (70004,110.5,'2012-08-17',3009,5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (70008,5760,'2012-09-10',3002,5001),
                          (70010,1983.43,'2012-10-10',3004,5006),
                          (70003,2480.4,'2012-10-10',3009,5003),
                          (70012,250.45,'2012-06-27',3008,5002),
						  (70011,75.29,'2012-08-17',3003,5007),
						 (70013,3045.6,'2012-04-25',3002,5001);

select o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade,s.name,s.commission
from orders o 
join customer c
on o.customer_id=c.customer_id
join salesman s
on s.salesman_id=o.salesman_id;

-- Write a SQL statement to join the tables salesman, customer and orders 
-- so that the same column of each table appears once and 
-- only the relational rows are returned. 

select *
from orders 
natural join customer
natural join salesman;


-- write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
-- The results should be sorted by ascending customer_id.  

select c.customer_id,c.cust_name,c.city,s.name,s.city
from customer c
join salesman s 
on c.salesman_id=s.salesman_id
order by customer_id asc;

-- write a SQL query to find those customers with a grade less than 300.
-- Return cust_name, customer city, grade, Salesman, salesman city. 
-- The result should be ordered by ascending customer_id. 

select c.cust_name as customer, c.city as customer_city,c.grade,s.name as salesman,s.city as salesman_city
from customer c
join salesman s
on c.salesman_id=s.salesman_id
where c.grade <= 300
order by c.customer_id asc;

-- Write a query to make a report with customer name, city, order number, order date, 
-- and order amount in ascending order according to the order date 
-- to determine whether any of the existing customers have placed an order or not.

select c.cust_name as customer_name, c.city,o.ord_no,o.ord_date,o.purch_amt
from orders o
right join customer c
on o.customer_id=c.customer_id
order by o.ord_date asc;


-- SQL statement to generate a report with
--  customer name, city, order number, order date, order amount, salesperson name, and commission 
--  to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt as order_amount,s.name,s.commission
from customer c
left join orders o
on c.customer_id=o.customer_id
left join salesman s 
on s.salesman_id=o.salesman_id;

-- Write a SQL statement to generate a list in ascending order of salespersons
-- who work either for one or more customers or have not yet joined any of the customers.

select s.name as salesperson,c.cust_name
from salesman s
right join customer c
on c.salesman_id=s.salesman_id
order by s.salesman_id;

-- write a SQL query to list all salespersons along 
-- with customer name, city, grade, order number, date, and amount.

select s.name,c.cust_name as customer_name,
       c.city as customer_city,c.grade,o.ord_no,o.ord_date,o.purch_amt
from salesman s
left join customer c
on c.salesman_id=s.salesman_id
right join orders o
on o.salesman_id=s.salesman_id;

create table company_mast (com_id int,com_name varchar(10));
insert into company_mast values (11,'samsung'),
                                (12,'iBall'),
                                (13,'epsion'),
                                (14,'zebronics'),
                                (15,'asus'),
                                (16,'frontech');
create table item_mast (pro_id int,pro_name varchar(30),pro_prize float,pro_com int);
insert into item_mast values(101,'Mother Board',3200.00,15),
							(102,'Ket Board',450.00,16),
                            (103,'ZIP drive',250.00,14),
                            (104,'speaker',550.00,16),
                            (105,'Monitor',5000.00,11),
                            (106,'DVD drive',900.00,12),
                            (107,'CD drive',800.00,12),
                            (108,'ptinter',2600.00,13),
                            (109,'refill cartridge',350.00,13),
                            (110,'mouse',250.00,12);
alter table item_mast modify column pro_name varchar(20);

-- write a SQL query to select all rows from both participating tables 
-- as long as there is a match between pro_com and com_id.

select * from company_mast
join item_mast 
on com_id=pro_com;

-- write a SQL query to calculate the average price of items of each company. 
-- Return average value and company name.

select avg(i.pro_prize),c.com_name
from item_mast i
join company_mast c
on i.pro_com=c.com_id
group by c.com_name;

-- write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. 
-- Return average value and company name.

select avg(i.pro_prize) as average,c.com_name
from item_mast i
join company_mast c
on i.pro_com=c.com_id
group by c.com_name having avg(i.pro_prize)>=350;