CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity_sold INT
);

INSERT INTO products (product_id, product_name, category, quantity_sold) VALUES
(1, 'Samsung Galaxy S20', 'Electronics', 100),
(2, 'Apple iPhone 12 Pro', 'Electronics', 150),
(3, 'Sony PlayStation 5', 'Electronics', 80),
(4, 'Nike Air Max 270', 'Clothing', 200),
(5, 'Adidas Ultraboost 20', 'Clothing', 200),
(6, 'Levis Mens 501 Jeans', 'Clothing', 90),
(7, 'Instant Pot Duo 7-in-1', 'Home & Kitchen', 180),
(8, 'Keurig K-Classic Coffee Maker', 'Home & Kitchen', 130),
(9, 'iRobot Roomba 675 Robot Vacuum', 'Home & Kitchen', 130),
(10, 'Breville Compact Smart Oven', 'Home & Kitchen', 90),
(11, 'Dyson V11 Animal Cordless Vacuum', 'Home & Kitchen', 90);

select * from products;

Questions : 
1.Write SQL query to find the top-selling products in each category ??
Answer :-

select * from
(
    select *,
    rank() over (partition by category order by quantity_sold desc)  ranks
    from products 
    order by category , quantity_sold desc
) as subquery 
where ranks = 1;
Explnation :-
Step 1 :- First we use subquery of select *,
    rank() over (partition by category order by quantity_sold desc)  ranks
    from products 
    order by category , quantity_sold desc ----- ( It describes that rank and over parition by
                                             cateogory and quantity_sold desc by closing the syntax 
                                             we use a where clause to filtering the ranks = 1)
-------------------------------------------------------------------------------------------------------
explanation-2 :-
using with cte clause also we can solve the problem 

WITH CTE AS (
         SELECT *, 
         RANK() OVER (PARTITION BY category ORDER BY quantity_sold DESC )as RNK
         FROM products )
         SELECT * FROM CTE
         WHERE RNK = 1 ;
-----------------------------------
	

