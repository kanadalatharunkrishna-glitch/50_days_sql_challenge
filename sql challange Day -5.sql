CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(101, 'John Smith', 'Sales', 60000.00, '2022-01-15'),
(102, 'Jane Doe', 'Marketing', 55000.00, '2022-02-20'),
(103, 'Michael Johnson', 'Finance', 70000.00, '2021-12-10'),
(104, 'Emily Brown', 'Sales', 62000.00, '2022-03-05'),
(106, 'Sam Brown', 'IT', 62000.00, '2022-03-05'),	
(105, 'Chris Wilson', 'Marketing', 58000.00, '2022-01-30');

select * from employees;

Write a SQL query to retrieve the 
third highest salary from the Employee table.
Answers :-

select name,salary as Total_salary from 
(
select *,
dense_rank () over (order by salary desc) as drn
from employees 
) as subquery 
where drn = 3;

Explanation :-
we need to find the top 3rd highest salary in employees table 
solution :- 
select salary from and opening bracket 
with select all (*,) 
we used subquery by using dense rank and over with salary by desc by closing sub query 
and by using where clause with = 3 --- we get a result 
---Note :- dense rank () will it never skips a rank when there are ties)