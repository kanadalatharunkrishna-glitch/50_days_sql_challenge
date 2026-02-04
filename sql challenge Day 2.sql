CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, OrderDate, TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

---------------------------------------------------------------------
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Returns (ReturnID, OrderID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);

select * from returns;
select * from orders ;
Challenge -2

---Given the Orders table with columns OrderID, 
OrderDate, and TotalAmount, and the 
Returns table with columns ReturnID and OrderID, 
--
1.write an SQL query to calculate the total 
numbers of returned orders for each month

---** ( we need to find )**---
1.--- Total numbers of retuns
2-----group by Month orders
3----- by using left join 

Answer :-
SELECT 
	EXTRACT(MONTH FROM o.orderdate) || '-' || EXTRACT(YEAR FROM o.orderdate) as month,
	COUNT(r.returnid) as total_return
FROM returns as r
LEFT JOIN
orders as o
ON r.orderid = o.orderid
GROUP BY month
ORDER BY month 

Explnation -2:-
select concat(month (o.OrderDate),'-',year(o.OrderDate)) as Month,
count(r.ReturnID) as Total_return 
from returns as r
left join 
orders as o
on r.OrderID = o.OrderID
group by Month
order by Month ;
-----------------------------------------------------------------------------------------
Explnation :- || it is indicates concat 
by extracting year and month and by using concat function and we use returns with
left join using returns to orders and by group by with month and by order by 