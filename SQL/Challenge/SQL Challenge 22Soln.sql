/*Q22.
Write an SQL query to find the type of weather in each country for November 2019.
The type of weather is:
● Cold if the average weather_state is less than or equal 15,
● Hot if the average weather_state is greater than or equal to 25, and
● Warm otherwise.*/

CREATE TABLE countries(
country_id int PRIMARY KEY,
country_name varchar(20));

CREATE TABLE weather(
country_id int,
weather_state int,
day date,
FOREIGN KEY (country_id) REFERENCES countries(country_id));


INSERT INTO countries VALUES (2,'USA'),
(3,'Australia'),
(7,'Peru'),
(5,'China'),
(8,'Morocco'),
(9,'Spain');

INSERT INTO weather VALUES(2,15,'2019-11-01'),
(2,12,'2019-10-28'),
(2,12,'2019-10-27'),
(3,-2,'2019-11-10'),
(3,0,'2019-11-11'),
(3,3,'2019-11-12'),
(5,16,'2019-11-07'),
(5,18,'2019-11-09'),
(5,21,'2019-11-23'),
(7,25,'2019-11-28'),
(7,22,'2019-12-01'),
(7,20,'2019-12-02'),
(8,25,'2019-11-05'),
(8,27,'2019-11-15'),
(8,31,'2019-11-25'),
(9,7,'2019-10-23'),
(9,3,'2019-12-23');


select country_name,
 case
 when avg(weather_state) <= 15 then 'Cold'
 when avg(weather_state) >= 25 then 'Hot'
 else 'Warm'
 end as weather_type
from
 Weather as w
 left join
 Countries as c
 on c.country_id = w.country_id
where day between '2019-11-01' and '2019-11-30'
group by w.country_id;