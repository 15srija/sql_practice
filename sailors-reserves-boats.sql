use database_1;
create table sailors(sid integer, sname varchar(30),rating integer,age integer,primary key(sid));
show tables;
create table boats(bid integer,bname varchar(30),color varchar(30),primary key(bid));
create table reservs(sid integer,bid integer , rdate date,primary key(sid,bid),foreign key(sid) references sailors(sid),foreign key(bid) references boats(bid));
insert into sailors values(101,"sai",9,25),(102,"vishnu",10,27),(103,"vardhan",6,26),(104,"srija",8,22),(105,"harsha",6,10),(106,"nithin",10,30);
insert into boats values(1,"boat1","green"),(2,"boat2","blue"),(3,"boat3","red"),(4,"boat4","black");
insert into reservs values(101,1,20220110),(102,1,20220212),(103,4,20220711),(104,3,20210101),(105,2,20220325),(106,4,20231011);
select * from reservs;
# find no. of sailors who reserved boat no:3
 select sname from sailors,reservs where sailors.sid=reservs.sid and bid=3;
# find names of sailors who reserved 'red' boat
 select sname from sailors,reservs,boats where sailors.sid=reservs.sid and boats.bid=reservs.bid and boats.color='black';
# find colors of boat reserved by 'srija'
 select color from boats,reservs,sailors where boats.bid=reservs.bid and sailors.sid=reservs.sid and sname='srija';
# find names of sailors who have atleast one boat
 select sname from sailors,reservs,boats where boats.bid=reservs.bid and sailors.sid=reservs.sid; 
# views
 