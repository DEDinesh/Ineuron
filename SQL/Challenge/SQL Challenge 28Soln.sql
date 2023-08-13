/*
Write an SQL query to report the customer_id and customer_name of customers who have spent at 
least $100 in each month of June and July 2020.
Return the result table in any order.
*/

use sql_challenge;
create table customers28(
customer_id int,
name varchar(30),
country varchar(30),
primary key(customer_id)
);

create table orders28(
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key(order_id)
);

create table product28(
product_id int,
descripion varchar(30),
price int,
primary key(product_id)
);

INSERT INTO Customers28 VALUES (1, 'Winston', 'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa' ,'Egypt');

INSERT INTO Product28 VALUES (10, 'LC Phone', 300),
(20, 'LC T-Shirt', 10),
(30, 'LC Book', 45),
(40, 'LC Keychain', 2);

INSERT INTO Orders28 VALUES(1,1,10,'2020/06/10',1),
(2,1,20,'2020/07/01',1),
(3,1,30,'2020/07/08',2),
(4,2,10,'2020/06/15',2),
(5,2,40,'2020/07/01',10),
(6,3,20,'2020/06/24',2),
(7,3,30,'2020/06/25',2),
(9,3,30,'2020/05/08',3);


with cte as(
select o.customer_id,c.name,sum(price*quantity) as month_spend,month(order_date) as month
from orders28 o inner join product28 p on o.product_id=p.product_id inner join customers28 c on o.customer_id=c.customer_id
where year(o.order_date)=2020 and month(o.order_date) in(6,7)
group by customer_id,month(order_date)
)
select customer_id,name from cte
where month_spend>=100
group by customer_id
having count(*)=2;

