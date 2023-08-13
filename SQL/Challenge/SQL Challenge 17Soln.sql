/*Q17.Write an SQL query that reports the products that were only sold in the first quarter of 
2019. That is,between 2019-01-01 and 2019-03-31 inclusive.
Return the result table in any order.*/

CREATE TABLE product(
product_id int primary key,
product_name varchar(20),
unit_price int);
INSERT INTO product VALUES(1,"S8", 1000);
INSERT INTO product VALUES(2, "G4", 800);
INSERT INTO product VALUES(3, "iPhone", 1400);
select * from product;

CREATE TABLE sales(
seller_id int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key (product_id) references product(product_id));
INSERT INTO sales VALUES(1,1,1, '2019-01-21',2, 2000);
INSERT INTO sales VALUES(1,2,2, '2019-02-17',1, 800);
INSERT INTO sales VALUES(2,2,3, '2019-06-02',1, 800);
INSERT INTO sales VALUES(3,3,4, '2019-05-13',2, 2800);

select * from sales;

SELECT p.product_id, p.product_name
FROM product p
LEFT JOIN sales s ON p.product_id = s.product_id AND 
(s.sale_date >= '2019-01-01' AND s.sale_date <= '2019-03-31')
WHERE s.product_id IS NOT NULL
GROUP BY p.product_id, p.product_name
HAVING MAX(s.sale_date) <= '2019-03-31';

with cte as(
select s.product_id,p.product_name,s.sale_date
from sales s inner join product p 
on s.product_id=p.product_id
where s.sale_date between '2019-01-01' and '2019-03-31')
select product_id,product_name from cte c
where sale_date =(select max(sale_date) from sales 
group by product_id having product_id=c.product_id);


