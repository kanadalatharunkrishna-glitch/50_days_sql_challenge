use newdb;
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'John'),
(2, 'Emma'),
(3, 'Michael'),
(4, 'Ben'),
(5, 'John')	;

CREATE TABLE Purchases (
    PurchaseID INT,
    CustomerID INT,
    ProductName VARCHAR(50),
    PurchaseDate DATE
);

INSERT INTO Purchases (PurchaseID, CustomerID, ProductName, PurchaseDate) VALUES
(100, 1, 'iPhone', '2024-01-01'),
(101, 1, 'MacBook', '2024-01-20'),	
(102, 1, 'Airpods', '2024-03-10'),
(103, 2, 'iPad', '2024-03-05'),
(104, 2, 'iPhone', '2024-03-15'),
(105, 3, 'MacBook', '2024-03-20'),
(106, 3, 'Airpods', '2024-03-25'),
(107, 4, 'iPhone', '2024-03-22'),	
(108, 4, 'Airpods', '2024-03-29'),
(110, 5, 'Airpods', '2024-02-29'),
(109, 5, 'iPhone', '2024-03-22');

select * from Customers
select * from Purchases

Apple data analyst interview question

Given two tables - Customers and Purchases, 
where Customers contains information about 
customers and Purchases contains information 
about their purchases, 

write a SQL query to find customers who 
bought Airpods after purchasing an iPhone.

SELECT 
	DISTINCT c.* 
    from
    customers as c
JOIN purchases as p1
ON c.customerid = p1.customerid
join purchases p2
on c.customerid = p2.customerid
where p1.ProductName = 'iPhone'
and 
p2.ProductName='Airpods'
and
 p1.PurchaseDate < p2.PurchaseDate;

Explanation :- we need select distinct c*, from customer , so that it will select all distinct value from customers and
 we need to join1 with purchase p1 as a reference from customerId --( so that we get a When you run your query, 
 SQL creates a "virtual" table by matching every row of p1 with every row of p2 for the same customer)
 Then we filter it with prodcutname with 'iphone' and with product name with 'Airpods' and we choose the 
 productdate to know that which date of iphone is having lesser then airpods so that we can easily get a 
  Customer has to buy Airpods after purchasing the iPhone then we use p1.productname < p2.productname we get a proper resolution)


