show tables;
#creating a table 

create table Table_2(
id integer,
E_name varchar(30),
E_number integer unique,
E_department_id integer,
PRIMARY KEY (id)
);
show tables;
#creating another table
create table Dept_details(
E_department_id integer,
E_package integer,
primary key (E_department_id)
);

#inserting values to table_2

insert into table_2 values ( 101,'employ-1',123456,90),
(102,'employ-2',78906,91),
(103,'employ-3',876678,90)
;

#inserting values to Dept_details

insert into Dept_details values (90,500000),
(91,600000);

show tables;

#using alter command in various cases i.e (add,delete,modify
alter table table_2
add abc integer;

desc table_2;

alter table table_2
drop column abc;

desc table_2;

alter table table_2
add attendence int;

alter table table_2
modify column attendence float;

desc table_2;

