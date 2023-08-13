/*Q.26Write an SQL query to get the names of products that have at least 100 units ordered 
in February 2020 and their amount. Return result table in any order.*/

CREATE TABLE Products(
product_id int,
product_name varchar(25),
product_category varchar(25),
primary key(product_id));

INSERT INTO PRODUCTS VALUES(1,'Leetcode Solutions','Book'),
(2,'Jewels of Stringology','Book'),
(3,'HP','Laptop'),
(4,'Lenovo','Laptop'),
(5,'Leetcode Kit','T-shirt');


CREATE TABLE Orders (
    product_id INT,
    order_date VARCHAR(20),
    unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id));

INSERT INTO Orders VALUES (1,'02/05/2020',60),
(1,'02/10/2020',70),
(2,'01/18/2020',30),
(2,'02/11/2020',80),
(3,'02/17/2020',2),
(3,'02/24/2020',3),
(4,'03/01/2020',20),
(4,'03/04/2020',30),
(4,'03/04/2020',60),
(5,'02/25/2020',50),
(5,'02/27/2020',50),
(5,'03/01/2020',50);
SELECT * FROM Orders;


select p.product_name,sum(o.unit) as unit
from products p inner join orders o
on p.product_id=o.product_id
where year(order_date)=2020 and month(order_date)=2
group by product_name having sum(unit)>=100;
