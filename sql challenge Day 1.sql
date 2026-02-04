use newdb;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

select * from employees;
1.Write the SQL query to find the second highest salary ??
ANswer :-
use newdb;
select * from employees
order by salary desc 
limit  1 offset  1;   ----- This is alternative most of the time we didn't use this 

explanation 2:-
use hr
select * from (select *, dense_rank () over(order  by salary desc )as drn
from employees
)as subquery
where drn = 2   ----dense rank (hat assigns a consecutive rank to each row within a result set, 
with no gaps in the ranking values even when there are ties. ) 

explanation :-3
select max(salary) from employees
where salary <(select max(salary) from employees);

explanation :3    (best example)
with cte as (
         select *, dense_rank() over (order by salary desc) as H_salary 
         from employees 
         ) 
         select * from cte
         where H_salary = 2;

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

INSERT INTO employees
VALUES
(11, 'zara', 'it', 63000)



select * from (select * ,dense_rank() over (partition by department order by salary desc) 
AS rnk  from employees) A
where rnk=2


