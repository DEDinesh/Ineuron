use sql_challenge;
create table npv(
id int,
year int,
npv int,
primary key(id,year)
);
INSERT INTO npv VALUES(1, 2018 ,100),
(7 ,2020, 30),
(13 ,2019 ,40),
(1, 2019, 113),
(2 ,2008 ,121),
(3, 2009, 12),
(11, 2020, 99),
(7 ,2019, 0);


create table queries(
id int,
year int,
primary key(id,year)
);
INSERT INTO queries VALUES(1, 2019),
(2 ,2008),
(3 ,2009),
(7, 2018),
(7 ,2019),
(7, 2020),
(13 ,2019);

select * from npv;
select * from queries;

-- Q30. Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

select q.id, q.year,ifnull(n.npv,0) as npv
from queries q left join npv n on q.id=n.id and q.year=n.year;

-- Q31.Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.
-- ABOVE REPEATED QUESTION
