create database new_company;
use new_company;
create table employee
(emp_id int, 
firstname varchar(20), 
lastname varchar(20), 
salary int,
joining_date date,
department varchar(20));

create table bonus_table
(emp_id int,
bonus_date date,
bonus_amount int);

#check scema 
desc bonus_table;

create table employee_designation
(emp_id int,
 designation varchar(20), 
 designantion_date date,
 foreign key (emp_id) references employee(emp_id));
 
 ALTER TABLE employee
ADD CONSTRAINT  PRIMARY KEY (emp_id);

alter table bonus_table 
add constraint foreign key (emp_id) references employee(emp_id);

ALTER TABLE bonus_table
ADD CONSTRAINT 
FOREIGN KEY (emp_id) REFERENCES employee (emp_id)
ON DELETE CASCADE;

alter table employee_designation
add constraint 
foreign key (emp_id) references employee(emp_id)
on delete cascade;

INSERT INTO employee
VALUES
    (001, 'John', 'Doe', 50000, '2022-01-01', 'IT'),
    (002, 'Jane', 'Smith', 60000, '2022-02-01', 'HR'),
    (003, 'Michael', 'Johnson', 70000, '2022-03-01', 'Finance'),
    (004, 'Emily', 'Williams', 55000, '2022-04-01', 'Marketing'),
    (005, 'David', 'Brown', 48000, '2022-05-01', 'IT'),
    (006, 'Olivia', 'Taylor', 65000, '2022-06-01', 'HR'),
    (007, 'Daniel', 'Anderson', 52000, '2022-07-01', 'Finance');

select * from employee;

INSERT INTO bonus_table
VALUES
    (001, '2022-02-01', 1000),
    (002, '2022-03-01', 1500),
    (003, '2022-04-01', 2000),
    (004, '2022-05-01', 1200),
    (005, '2022-06-01', 900),
    (004, '2022-08-01', 1200),
     (002, '2022-05-01', 1500),
     (001, '2022-04-01', 1000);

INSERT INTO employee_designation
VALUES
    (001, 'Manager', '2022-03-01'),
    (002, 'Supervisor', '2022-05-01'),
    (003, 'Analyst', '2022-03-01');

##q1) write a query to retrieve all the details where firstname starts with J

select * from employee 
where firstname like 'J%';

select concat(firstname,' ',lastname) as name from employee 
where firstname like 'J%';

##Q2) write a query tp fetch all details where salary is between 30K & 50k

select  * from employee
where salary between 30000 and 50000 ;

#Q3) employees who have joined in the month of feb

select * from employee 
where month(joining_date)=2;

#Q4) to fetch count of employee in each department

select count(emp_id) as employee_count,department from employee
group by department;

select * from employee_designation;

#Q5) Query to print details od emplyee who is also analyst
select employee.firstname ,employee_designation. designation from employee
inner join employee_designation
on employee.emp_id=employee_designation.emp_id
and employee_designation. designation='Analyst';

#Q6) write a query to clone a new table 
create table clone_emp
select * from employee;
select * from clone_emp;

#Q7) query to show top 3 salry from empl
select * from employee 
order by salary desc
limit 3;

#q8) query to determine 5th highest salary 
select * from employee 
order by salary desc
limit 4,1;
#q10) timesatmpdiff command
select concat
(
timestampdiff(year,'1998-06-28',joining_date),'year',
timestampdiff(month,'1998-06-28',joining_date)%12,'month'
) as age from employee;

# q11)INNER JOIN:
#Question: Retrieve the details of employees along with their corresponding bonus amounts, if any.

select * from employee 
inner join bonus_table
on employee.emp_id=bonus_table.emp_id;

#Q12) LEFT JOIN:
#Question: List all employees along with their respective bonuses (if any). Include employees who do not have any bonus.
SELECT employee. emp_id,employee.firstname,employee.salary,bonus_table.bonus_amount FROM employee
left join bonus_table
on employee.emp_id=bonus_table.emp_id;

# q13) Question: Retrieve the details of employees along with their respective designations.

select employee. emp_id,employee.firstname,employee_designation.designation  from employee 
inner join employee_designation
on employee.emp_id=employee_designation.emp_id
