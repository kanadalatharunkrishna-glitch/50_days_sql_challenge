use newdb
create table orders_1(
  	category varchar(20),
	product varchar(20),
	user_id int , 
  	spend int,
  	transaction_date DATE
);

Insert into orders_1 values
('appliance','refrigerator',165,246.00,'2021/12/26'),
('appliance','refrigerator',123,299.99,'2022/03/02'),
('appliance','washingmachine',123,219.80,'2022/03/02'),
('electronics','vacuum',178,152.00,'2022/04/05'),
('electronics','wirelessheadset',156,249.90,'2022/07/08'),
('electronics','TV',145,189.00,'2022/07/15'),
('Television','TV',165,129.00,'2022/07/15'),
('Television','TV',163,129.00,'2022/07/15'),
('Television','TV',141,129.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','yoyo',165,129.00,'2022/07/15'),
('toys','yoyo',163,129.00,'2022/07/15'),
('toys','yoyo',141,129.00,'2022/07/15'),
('toys','yoyo',145,189.00,'2022/07/15'),
('electronics','vacuum',145,189.00,'2022/07/15');

Find the top 2 products in the top 2 categories based on spend amount?
*/

-- top 2 category based on spend 
-- top 2 product in above best 2 category

Answer :-

with cte as (
select category , total_spends_category from 
(
select 
category , sum(spend) as total_spends_category ,
dense rank() over (order by sum(spend)desc)as rnk
from orders
group by category 
)as subquery 
where rnk <= 2
)
select category , product from 
(select category , product, sum(spend) as total_spend_by_product,
desne rank() over (partition by category order by sum(spend)desc)as brnk
from orders 
group by category , product
) as subquery 2
where brnk <= 2
and category in (select category from cte )

explanation :- ( we want to know top 2 products in the top 2 categories based on spend amount?
*/
case 1 :- 
        so by using subquery 1 -- we find the dense rank and by over by using sum of spend using alias 
                                by grouping with category by filtering  where clause with <=2 
		           Result :- we get a result of top 2 by filtering only cateogry by using cte with subquery 
                   This part looks at the total spend per category and identifies the top 2.
                   
			    observation :-  we get a result of category of top 2 (Electronics , furniture)
                 
case 2 :-  
          ( Main-query )
	so by using subquery 2 :- This part calculates the total spend per product and ranks them.
                                inside their category.
                     Result :- so we use subquery 2 by using dense rank with partition with category ,product
                                 and sum (spend) desc by group by category , product 
                                 by filtering with where clause <=2
                                 
				  observation :-   we get a result of products with top 2 ( phone ,Laptop )- electronics
                                                               (Desk ,chair) - furniture .
                                                               
 case :-3   The Final Filter (WHERE brnk <= 2 AND category IN (...))
The final output takes the products ranked 1 or 2, but only
 if their category was in the top 2 categories found in Step 1.                                                              
                  
