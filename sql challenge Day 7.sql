use newdb;
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);
use newdb;
select * from employees;
/*
How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary
Answer :-

Approach :- 1
select * from
(
select *,
     ROW_NUMBER()  over(partition by name order by name ) as drn
     from employees
     ) as subquery 
     where drn > 1;

  Approach :-2
  
  select emp_id ,name,
  count(1) as cnt
  from employees
  group by emp_id ,name
  having count(1) > 1;
  
Explnation :- Mostly we need to follow the approach -1 
   we used a subquery by  using that we get a list of employees with a dulpicates 
   by selecting all the employees and by using subquery with filtering using alias with > 1 
   we get a proper resolution .
  