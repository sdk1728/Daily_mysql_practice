create database sample2;
use sample2;
create table customer
(
customerid int auto_increment primary key,
customernumber int not null unique check (customernumber >0),
lastname varchar (30) not null,
firstname varchar(30) not null,
areacode int default 71000,
address varchar (50),
country varchar (50) default 'Malaysia'
);
use sample2;
show tables;
select * from customer;

insert into customer values
(1,100,'Kamble','shubham',413411,'sdfgbnb','PUNE'),
(2,200,'Sawant','punawesh',416602,'gcvhbn','KANKAVLI'),
(3,300,'Shaikh','shadab',default,'vbjbn','KATRAJ'),
(4,400,'Khandagle','tushar',413411,'bnmnbkm',default);

alter table customer 
change column country city varchar(30);

alter table customer 
alter column city set default 'PUNE';

insert into customer values
(5,500,'gaikwad','rohit',428459,'bnmnbkm',default);

UPDATE customer
SET city = 'PUNE'
WHERE customerid > 0 AND city = 'Malaysia';

select * from customer;

update customer
set city='OMERGA'
where customerid =5;

alter table customer 
add phone_no int;

update customer 
set phone_no = 7972799088
where customerid=1;

alter table customer 
modify column phone_no varchar(10);

alter table customer 
drop column phone_no;

