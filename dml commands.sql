show databases;
use database_1;
show tables;
desc tab_python;
desc table_py;
select * from table_s;
show databases;
use database_1;
show tables;
drop table table_2;
truncate table dept_details;
select * from dept_details;
select * from table_s;
select s_name,s_class from table_s;
select distinct s_class from table_s;
alter table table_s add prec integer;
insert into table_s values (121,"satya",'cse',95);
select * from table_s where s_name like "s%";    #display names starting with 's' 
select * from table_s where s_name like "%ee%";   # display names with 'ee'
select distinct s_name from table_s;
update table_s set prec=70 where s_id=101;
delete from table_s where s_id='101';
select s_class,count(s_id) from table_s group by s_class;
select branch,min(prec) from table_s group by branch having min(prec)>70; 


