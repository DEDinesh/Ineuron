# Ineuron SQL Challenge 



##SQL QUESTION


Q1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
The CITY table is described as follows:
ANS:-  Select * from CITY where CountryCode=” USA” and populations>100000;




Q2. Query the NAME ﬁeld for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
The CITY table is described as follows:
Ans:- select NAME from city where CountryCode=”USA” and populations>120000;



 
Q3. Query all columns (attributes) for every row in the CITY table. The CITY table is described as follows:
Ans:- select * from city






Q4. Query all columns for a city in CITY with the ID 1661. The CITY table is described as follows:
Ans:- select * from city where ID=1661.


 
Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
The CITY table is described as follows:
Ans:- select * from city where CountryCode=”JPN”;






Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
The CITY table is described as follows:
Ans:- select NAME from city where CountryCode=”JPN”;





 

station-table:https:/ docs.google.com/spreadsheets/d/1sHPhE7walQD5mL7ppFNqybyoOJY3E51N0 cWYzhp2UH4/edit?usp=sharing


Q7. Query a list of CITY and STATE from the STATION table. The STATION table is described as follows:
Ans: select CITY ,STATE from station.

where LAT_N is the northern latitude and LONG_W is the western longitude.


Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
The STATION table is described as follows:
Ans: select distinct CITY  from station where Id%2==0.



where LAT_N is the northern latitude and LONG_W is the western longitude
 
Q9. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:
Ans: select count(CITY)-count(distinct CITY)  from station.


where LAT_N is the northern latitude and LONG_W is the western longitude.

For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru', there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because total number of records - number of unique city names = 3-2 =1

Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes ﬁrst when ordered alphabetically.
The STATION table is described as follows:
Ans: with A as (select city ,len(city) length from station  order by city)




where LAT_N is the northern latitude and LONG_W is the western longitude. Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY. Sample Output
 
ABC 3
PQRS 4

Hint -
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths and. The longest name is PQRS, but there are options for shortest named city. Choose ABC, because it comes ﬁrst alphabetically.
Note
You can write two separate queries to get the desired output. It need not be a single query.




Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]'
ORDER BY CITY;






where LAT_N is the northern latitude and LONG_W is the western longitude.

Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiouAEIOU]$'
ORDER BY CITY; 

 
where LAT_N is the northern latitude and LONG_W is the western longitude.





Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]'
ORDER BY CITY;


where LAT_N is the northern latitude and LONG_W is the western longitude.




Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
 
Input Format
The STATION table is described as follows:
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '[aeiouAEIOU]$'
ORDER BY CITY;


where LAT_N is the northern latitude and LONG_W is the western longitude.


Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
Input Format
The STATION table is described as follows:
SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
   OR NOT (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U');


where LAT_N is the northern latitude and LONG_W is the western longitude.



Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
  AND NOT (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U');

create table employee_company(
personal_profile_id int,
company_id int);

create table company_pages(
company_id int,
name varchar(50),
followers int);

-- Q100.The LinkedIn Creator team is looking for power creators who use their personal profile as a company
-- or influencer page. This means that if someone's Linkedin page has more followers than all the
-- companies they work for, we can safely assume that person is a Power Creator. Keep in mind that if a
-- person works at multiple companies, we should take into account the company with the most followers.
-- Write a query to return the IDs of these LinkedIn power creators in ascending order.

select * from personal_profiles;
select * from employee_company;
select * from company_pages;

with cte as(
select ec.personal_profile_id,ec.company_id,cp.name,cp.followers as company_followers
from employee_company ec left join company_pages cp
on ec.company_id=cp.company_id)
select profile_id from personal_profiles p
where followers>(select max(company_followers) from cte where personal_profile_id=p.profile_id group by personal_profile_id)
order by profile_id;
use sql_challenge;
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

-- Q101.Write an SQL query to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one activity at the
-- same time. Return the result table in any order

select * from useractivity;

with cte as(
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity
)
select username,activity,startdate,enddate
from cte
where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);

use sql_challenge;
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

-- Q102.Write an SQL query to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one activity at the
-- same time. Return the result table in any order

select * from useractivity;

with cte as(
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity
)
select username,activity,startdate,enddate
from cte
where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);

use sql_challenge;
create table student3(
id int,
name varchar(30),
marks int);
insert into student3 values(1,'Ashley',81);
insert into student3 values(2,'Samantha',75);
insert into student3 values(4,'Julia',76);
insert into student3 values(3,'Belvet',84);
select * from student3;

-- Q103.Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by
-- the last three characters of each name. If two or more students both have names ending in the same
-- last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select name from student3
where marks>75 
order by substring(name,-3,3) ,id;

use sql_challenge;
create table employee6(
employee_Id int,
name varchar(30),
months int,
salary int);
insert into employee6 values(12228,'Rose',15,1968);
insert into employee6 values(33645,'Angela',1,3443);
insert into employee6 values(45692,'Frank',17,1608);
insert into employee6 values(56118,'Patrick',7,1345);
insert into employee6 values(59725,'Lisa',11,2330);
insert into employee6 values(74197,'Kimberly',16,4372);
insert into employee6 values(78454,'Bonnie',8,1771);
insert into employee6 values(83565,'Michael',6,2017);
insert into employee6 values(98607,'Todd',5,3396);
insert into employee6 values(99989,'Joe',9,3573);

select * from employee6;
-- Q104.Write a query that prints a list of employee names (i.e.: the name attribute) for employees in
-- Employee having a salary greater than $2000 per month who have been employees for less than 10
-- months. Sort your result by ascending employee_id

select name from employee6
where salary > 2000 and months <10
order by employee_id;
use sql_challenge;
create table triangle1(
a int,
b int,
c int);
insert into triangle1 values(20,20,23);
insert into triangle1 values(20,20,20);
insert into triangle1 values(20,21,22);
insert into triangle1 values(13,14,30);

-- Q105.Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
-- Output one of the following statements for each record in the table:
-- ● Equilateral: It's a triangle with sides of equal length.
-- ● Isosceles: It's a triangle with sides of equal length.
-- ● Scalene: It's a triangle with sides of differing lengths.
-- ● Not A Triangle: The given values of A, B, and C don't form a triangle

select * from triangle1;

SELECT
    CASE
        WHEN A = B AND A = C AND B = C 
            THEN 'Equilateral'
        WHEN (A = B OR A = C OR B = C) AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Isosceles'
        WHEN A != B AND B != C AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Scalene'
        ELSE 'Not A Triangle'
    END as types_of_triangle
FROM TRIANGLE1;
use sql_challenge;
create table employees1(
id int,
name varchar(30),
salary int);

insert into employees1 values(1,'Kristeen',1420);
insert into employees1 values(2,'Ashley',2006);
insert into employees1 values(3,'Julia',2210);
insert into employees1 values(4,'Maria',3000);


-- Q106.Samantha was tasked with calculating the average monthly salaries for all employees in the
-- EMPLOYEES table, but did not realise her keyboard's 0 key was broken until after completing the
-- calculation. She wants your help finding the difference between her miscalculation (using salaries
-- with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries),and round it up to the next integer

select  ceil(avg(salary)-avg(replace(salary,'0',''))) as avg_salary from employees1;
use sql_challenge;
create table employee9(
employee_id int,
name varchar(30),
months int,
salary int);
-- creating another copy of table from previous table
create table employee9 as select * from employee6;

-- Q.107 Write a query to find the maximum total earnings for all employees as well as the total number of
-- employees who have maximum total earnings. Then print these values as 2 space-separated integers.

select salary*months as earning,count(*) as no_of_employee
from employee9 where salary*months=(select max(salary*months) from employee9);
use sql_challenge;
create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');

-- 108.(1). Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by
-- the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For
-- example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order

-- 1st Query output
select concat(name,'(',substr(occupation,1,1),')') as name
from occupations;

-- 2nd Query Output
with cte as(
select occupation,count(*) as occ_count
from occupations group by occupation)

select concat('There are a total of ',occ_count,' ',occupation,'s') as statement
from cte
order by occ_count;



use sql_challenge;
create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');

-- Q109 . Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and
-- displayed underneath its corresponding Occupation. The output column headers should be Doctor,
-- Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.
select Doctor,Professor,Singer,Actor from(
select
    rn,
    max(case when occupation = 'Doctor' then name end) Doctor,
    max(case when occupation = 'Professor'  then name end) Professor,
    max(case when occupation = 'Singer' then name end) Singer,
    max(case when occupation = 'Actor'  then name end) Actor
from (
    select o.*, row_number() over(partition by occupation order by name) rn
    from occupations o
)a
group by rn)b;
use sql_challenge;
create table bst(
n int,
p int);

insert into bst values(1,2);
insert into bst values(3,2);
insert into bst values(6,8);
insert into bst values(9,8);
insert into bst values(2,5);
insert into bst values(8,5);
insert into bst values(5,null);

-- Q110.Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the
-- following for each node:
-- ● Root: If node is root node.
-- ● Leaf: If node is leaf node.
-- ● Inner: If node is neither root nor leaf node.

select n,
	case when p is null then 'root'
		when n not in(select distinct p from bst where p is not null) then 'leaf'
        else 'inner' end as type
        from bst
        order by n;
        
use sql_challenge;
create table company1(
company_code varchar(30),
founder varchar(30));


create table lead_manager(
lead_manager_code varchar(30),
company_code varchar(30));

create table senior_manager(
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table manager(
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table employee10(
employee_code varchar(30),
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

insert into company1 values('C1','Monika');
insert into company1 values('C2','Samantha');

insert into lead_manager values('LM1','C1');
insert into lead_manager values('LM2','C2');

insert into senior_manager values('SM1','LM1','C1');
insert into senior_manager values('SM2','LM1','C1');
insert into senior_manager values('SM3','LM2','C2');

insert into manager values('M1','SM1','LM1','C1');
insert into manager values('M2','SM3','LM2','C2');
insert into manager values('M3','SM3','LM2','C2');

insert into employee10 values('E1','M1','SM1','LM1','C1');
insert into employee10 values('E2','M1','SM1','LM1','C1');
insert into employee10 values('E3','M2','SM3','LM2','C2');
insert into employee10 values('E4','M3','SM3','LM2','C2');


-- Q111.Given the table schemas below, write a query to print the company_code, founder name, total number
-- of lead managers, total number of senior managers, total number of managers, and total number of
-- employees. Order your output by ascending company_code.

SELECT C.COMPANY_CODE,
       C.FOUNDER,
  (SELECT COUNT(DISTINCT LEAD_MANAGER_CODE) 
   FROM LEAD_MANAGER L
   WHERE L.COMPANY_CODE = C.COMPANY_CODE) as lead_manager_count,
  (SELECT COUNT(DISTINCT SENIOR_MANAGER_CODE)
   FROM SENIOR_MANAGER S
   WHERE S.COMPANY_CODE = C.COMPANY_CODE) as senior_manager_count,
  (SELECT COUNT(DISTINCT MANAGER_CODE)
   FROM MANAGER M
   WHERE M.COMPANY_CODE = C.COMPANY_CODE) as manager_count,
  (SELECT COUNT(DISTINCT EMPLOYEE_CODE) 
   FROM EMPLOYEE10 E
   WHERE E.COMPANY_CODE = C.COMPANY_CODE)as employee_count
FROM COMPANY1 C
ORDER BY C.COMPANY_CODE ASC;
-- Q112. Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line,
-- and use the ampersand () character as your separator (instead of a space).
-- For example, the output for all prime numbers <=10 would be: 2&3&5&7

SET @range = 1000;

SELECT GROUP_CONCAT(R2.n SEPARATOR '&') as prime_number
FROM (
        SELECT @ctr2:=@ctr2+1 "n"
        FROM information_schema.tables R2IS1,
        information_schema.tables R2IS2,
        (SELECT @ctr2:=1) TI
        WHERE @ctr2<@range
     ) R2
WHERE NOT EXISTS (
                SELECT R1.n
                FROM (
                    SELECT @ctr1:=@ctr1+1 "n"
                    FROM information_schema.tables R1IS1,
                    information_schema.tables R1IS2,
                    (SELECT @ctr1:=1) I1
                    WHERE @ctr1<@range
                ) R1
                WHERE R2.n%R1.n=0 AND R2.n>R1.n
        );
-- Q113.Write a query to print the pattern P(20)
set @row := 0;
select repeat('* ', @row := @row + 1)as pattern from information_schema.tables where @row < 5;
-- Q114.Write a query to print the pattern P(20)
with recursive num(n) as
(
select 10
    union all
    select n - 2
    from num 
    where n - 2 >= 2
)
select lpad('', num.n, '* ') as pattern
from num; 


use sql_challenge;
create table student3(
id int,
name varchar(30),
marks int);
insert into student3 values(1,'Ashley',81);
insert into student3 values(2,'Samantha',75);
insert into student3 values(4,'Julia',76);
insert into student3 values(3,'Belvet',84);
select * from student3;

-- Q115.Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by
-- the last three characters of each name. If two or more students both have names ending in the same
-- last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select name from student3
where marks>75 
order by substring(name,-3,3) ,id;

use sql_challenge;

create table functions(
x int ,
y int);

insert into functions values(20,20);
insert into functions values(20,20);
insert into functions values(20,21);
insert into functions values(23,22);
insert into functions values(22,23);
insert into functions values(21,20);

select * from functions;

-- Q116.Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
select distinct x1,y1 from(
select f1.x as x1,f1.y as y1,f2.x as x2,f2.y as y2
from functions f1 inner join functions f2
on f1.x=f2.y and f1.y=f2.x)a
where x1<=y1
order by x1;


use sql_challenge;
create table employee6(
employee_Id int,
name varchar(30),
months int,
salary int);
insert into employee6 values(12228,'Rose',15,1968);
insert into employee6 values(33645,'Angela',1,3443);
insert into employee6 values(45692,'Frank',17,1608);
insert into employee6 values(56118,'Patrick',7,1345);
insert into employee6 values(59725,'Lisa',11,2330);
insert into employee6 values(74197,'Kimberly',16,4372);
insert into employee6 values(78454,'Bonnie',8,1771);
insert into employee6 values(83565,'Michael',6,2017);
insert into employee6 values(98607,'Todd',5,3396);
insert into employee6 values(99989,'Joe',9,3573);

select * from employee6;

-- Q116.2.Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in
-- alphabetical order.

select name from employee6 order by name;
use sql_challenge;
create table employee6(
employee_Id int,
name varchar(30),
months int,
salary int);
insert into employee6 values(12228,'Rose',15,1968);
insert into employee6 values(33645,'Angela',1,3443);
insert into employee6 values(45692,'Frank',17,1608);
insert into employee6 values(56118,'Patrick',7,1345);
insert into employee6 values(59725,'Lisa',11,2330);
insert into employee6 values(74197,'Kimberly',16,4372);
insert into employee6 values(78454,'Bonnie',8,1771);
insert into employee6 values(83565,'Michael',6,2017);
insert into employee6 values(98607,'Todd',5,3396);
insert into employee6 values(99989,'Joe',9,3573);

-- Q117.Write a query that prints a list of employee names (i.e.: the name attribute) for employees in
-- Employee having a salary greater than $2000 per month who have been employees for less than 10
-- months. Sort your result by ascending employee_id

select name from employee6
where salary > 2000 and months <10
order by employee_id;
use sql_challenge;
create table triangle1(
a int,
b int,
c int);
insert into triangle1 values(20,20,23);
insert into triangle1 values(20,20,20);
insert into triangle1 values(20,21,22);
insert into triangle1 values(13,14,30);

-- Q118.Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
-- Output one of the following statements for each record in the table:
-- ● Equilateral: It's a triangle with sides of equal length.
-- ● Isosceles: It's a triangle with sides of equal length.
-- ● Scalene: It's a triangle with sides of differing lengths.
-- ● Not A Triangle: The given values of A, B, and C don't form a triangle

select * from triangle1;

SELECT
    CASE
        WHEN A = B AND A = C AND B = C 
            THEN 'Equilateral'
        WHEN (A = B OR A = C OR B = C) AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Isosceles'
        WHEN A != B AND B != C AND (A+B>C ) AND(B+C>A) AND(C+A)>B
            THEN 'Scalene'
        ELSE 'Not A Triangle'
    END as types_of_triangle
FROM TRIANGLE1;
use sql_challenge;
create table user_transaction(
transaction_id int,
product_id int,
spend float,
transaction_date datetime);

-- Q119.Assume you are given the table below containing information on user transactions for particular
-- products. Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.
-- Output the year (in ascending order) partitioned by product id, current year's spend, previous year's
-- spend and year-on-year growth rate (percentage rounded to 2 decimal places).

select * from user_transaction;
insert into user_transaction values(1341, 123424, 1500.60, str_to_date('12312019120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1423, 123424, 1000.20, str_to_date('12312020120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1623, 123424, 1246.44, str_to_date('12312021120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1322, 123424, 2145.32, str_to_date('12312022120000','%m%d%Y%h%i%s'));

with cte as(
select extract(year from transaction_date) as year,product_id,spend as curr_year_spend,
round(lag(spend) over(PARTITION BY product_id order by extract(year from transaction_date)),2)
as prev_year_spend
from user_transaction)
select * ,
case when prev_year_spend is not null then round(((curr_year_spend-prev_year_spend)/prev_year_spend*100),2)
else prev_year_spend end as yoy_rate
from cte ;
use sql_challenge;
create table inventory(
item_id int,
item_type varchar(30),
item_category varchar(30),
square_footage float);

select * from inventory;

-- Q120.Write a SQL query to find the number of prime and non-prime items that can be stored in the 500,000
-- square feet warehouse. Output the item type and number of items to be stocked.

SELECT item_type,
    (CASE WHEN item_type = 'prime_eligible' 
          THEN floor(500000/total_square_footage) * total_item_type
          ELSE floor(((500000) - (floor(500000/(SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible'))* 
          (SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible')))/(total_square_footage)
          ) * total_item_type END) AS item_count   

FROM(SELECT item_type,
      COUNT(item_type) AS total_item_type,
      SUM(square_footage) AS total_square_footage
FROM inventory
GROUP BY item_type) AS temp_table1       
ORDER BY item_count DESC;

use sql_challenge;
create table user_actions(
user_id int,
event_id int,
event_type enum("sign-in", "like", "comment"),
event_date datetime);

select * from user_actions;

-- Q121.Assume you have the table below containing information on Facebook user actions. Write a query to
-- obtain the active user retention in July 2022. Output the month (in numerical format 1, 2, 3) and the
-- number of monthly active users (MAUs)
WITH CTE AS
(
SELECT 
user_id,
event_date,
EXTRACT(MONTH FROM event_date) - LAG(EXTRact(MONTH FROM event_date)) OVER(partition by user_id order by event_date) as month_number 
FROM 
user_actions
) 
SELECT
Extract(month FROM event_date) as month,
COUNT(*) as monthly_active_users FROM
CTE
WHERE month_number = 1
GROUP by 1
ORDER BY 2 desc
LIMIT 1;

create table search_frequency(
searches int,
num_users int);

insert into search_frequency values(1,2);
insert into search_frequency values(2,2);
insert into search_frequency values(3,3);
insert into search_frequency values(4,1);

-- Q122.Write a query to report the median of searches made by a user. Round the median to one decimal
-- point.
-- Hint- Write a subquery or common table expression (CTE) to generate a series of data (that's keyword
-- for column) starting at the first search and ending at some point with an optional incremental value.

select * from search_frequency;

with cte as(
select searches
from search_frequency
group by searches,generate_series(1,num_users)
)
select round(percentile_cont(0.5) within group(order by searches)::decimal,1) as median
from search_frequency;
use sql_challenge;
create table advertiser(
user_id varchar(30),
status varchar(30));
create table daily_pay(
user_id varchar(15),
paid float);

insert into daily_pay values('yahoo',45.00);
insert into daily_pay values('alibaba', 100.00);
insert into daily_pay values('target', 13.00);

-- Q123.Write a query to update the Facebook advertiser's status using the daily_pay table. Advertiser is a
-- two-column table containing the user id and their payment status based on the last payment and
-- daily_pay table has current information about their payment. Only advertisers who paid will show up in
-- this table.

select * from advertiser;
select * from daily_pay;

WITH payment_status AS (
SELECT
  advertiser.user_id,
  advertiser.status,
  payment.paid
FROM advertiser
LEFT JOIN daily_pay AS payment
  ON advertiser.user_id = payment.user_id

UNION

SELECT
  payment.user_id,
  advertiser.status,
  payment.paid
FROM daily_pay AS payment
LEFT JOIN advertiser
  ON advertiser.user_id = payment.user_id
)

SELECT
  user_id,
  CASE WHEN paid IS NULL THEN 'CHURN'
  	WHEN status != 'CHURN' AND paid IS NOT NULL THEN 'EXISTING'
  	WHEN status = 'CHURN' AND paid IS NOT NULL THEN 'RESURRECT'
  	WHEN status IS NULL THEN 'NEW'
  END AS new_status
FROM payment_status
ORDER BY user_id;
use sql_challenge;
create table server_utilization(
server_id int,
status_time timestamp,
session_status varchar(30));

-- Q124. Amazon Web Services (AWS) is powered by fleets of servers. Senior management has
-- requested data-driven solutions to optimise server usage.
-- Write a query that calculates the total time that the fleet of servers was running. The output should be
-- in units of full days.
-- Level - Hard
-- Hint1. Calculate individual uptimes


with cte as(
select server_id,status_time,
case when session_status='stop' then  lag(status_time) over(partition by server_id order by status_time) 
 end as prev_time
 from server_utilization
 )
 select round(sum(running_time)/86400) as total_uptime_days from(
 select server_id,sum(timestampdiff(second,prev_time,status_time)) running_time
 from cte
 where prev_time is not null
 group by server_id)a;
use sql_challenge;
create table transactions3(
transaction_id int,
merchant_Id int,
credit_card_id int,
amount int,
transaction_timestamp datetime)

select * from transactions3;

-- Q125.Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or
-- a retry error that causes a credit card to be charged twice.
-- Using the transactions table, identify any payments made at the same merchant with the same credit
-- card for the same amount within 10 minutes of each other. Count such repeated payments


select count(t1.transaction_id) as payment_count
from transactions3 t1 inner join transactions3 t2 
on t1.merchant_id=t2.merchant_id and t1.credit_card_id=t2.credit_card_id and t1.amount=t2.amount
and t2.transaction_timestamp>t1.transaction_timestamp
where timestampdiff(minute,t1.transaction_timestamp,t2.transaction_timestamp)<10;
use sql_challenge;
create table orders6(
order_id int,
customer_id int,
trip_id int,
status enum('completed successfully', 'completed incorrectly', 'never received'),
order_timestamp timestamp);
create table trips(
dasher_id int,
trip_id int,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp);

create table customer5(
customer_id int,
signup_timestamp timestamp);

-- Q26.Write a query to find the bad experience rate in the first 14 days for new users who signed up in June
-- 2022. Output the percentage of bad experience rounded to 2 decimal places.

select * from orders6;
select * from customer5;
select * from trips;
with cte as(
select o.customer_id,o.status,c.signup_timestamp,o.order_timestamp
from orders6 o inner join  trips t on o.trip_id=t.trip_id 
inner join customer5 c on c.customer_id=o.customer_id
where extract(year from c.signup_timestamp)=2022 and month(c.signup_timestamp)=6 and datediff(o.order_timestamp,c.signup_timestamp)<=14
)
select round((100.0*count(case when status in('completed incorrectly','never received') then 1 else null end)/count(customer_id)),2)
as bad_experience_pct
from cte;

use sql_challenge;
create table scores(
player_name varchar(30),
gender varchar(30),
day date,
score_points int,
primary key (gender,day));
select * from scores;

-- Q127.Write an SQL query to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
select gender,day,sum(score_points) over(partition by gender order by day) as total 
from scores
order by gender;

use sql_challenge;
create table person(
id int,
name varchar(30),
phone_number varchar(30),
primary key(id)
);
create table country(
name varchar(30),
country_code varchar(30),
primary key(country_code));

create table calls1(
caller_id int,
callee_id int,
duration int
);
select * from person;
select * from country;
select * from calls1;

-- Q128. Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order
with cte1 as(
select id ,name,phone_number,
case when substring(phone_number,1,1)=0 then substring(phone_number,2,2) 
	 else substring(phone_number,1,3) end as country_code
     from person),
cte2 as(
select cn.name,c.duration
from calls1 c inner join cte1 ct on c.caller_id=ct.id or c.callee_id=ct.id  left join country cn on ct.country_code=cn.country_code
order by caller_id)
select name from cte2
group by name 
having avg(duration)>(select avg(duration) from cte2);
	

create table numbers(
num int,
frequency int);

insert into numbers values(0,7);
insert into numbers values(1,1);
insert into numbers values(2,3);
insert into numbers values(3,1);


-- Q129. The median is the value separating the higher half from the lower half of a data sample.
-- Write an SQL query to report the median of all the numbers in the database after decompressing the
-- Numbers table. Round the median to one decimal point.The query result format is in the following example.The Syntax is in PostgreSql

WITH searches_expanded AS (
  SELECT num
  FROM numbers
  GROUP BY 
    num, 
    GENERATE_SERIES(1, frequency))

SELECT 
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY num)::DECIMAL, 1) AS  median
FROM searches_expanded;

use sql_challenge;
create table salary1(
id int,
employee_Id int,
amount int,
pay_date date,
primary key(id),
foreign key(employee_id) references employee7(employee_id));

create table employee7(
employee_id int,
department_id int,
primary key(employee_id));

-- Q130.Write an SQL query to report the comparison result (higher/lower/same) of the average salary of
-- employees in a department to the company's average salary.
-- Return the result table in any order.
select * from salary1;
select * from employee7;
with cte1 as(
select s.pay_date,round(avg(amount),2) as comp_avg_month
from salary1 s inner join employee7 e
on s.employee_id=e.employee_id
group by month(pay_date)),
					cte2 as (
							select e.department_id,s.pay_date,round(avg(amount),2) as avg_month
						    from salary1 s inner join employee7 e
							on s.employee_id=e.employee_id
                            group by e.department_id,s.pay_date)
                           
                            select date_format(c2.pay_date,'%Y-%m') as pay_month,c2.department_id,
                            case when c2.avg_month>c1.comp_avg_month then 'higher'
								 when c2.avg_month<c1.comp_avg_month then 'lower'
                                 else 'same' end as comparison
                            from
                            cte1 c1 left join cte2 c2 
                            on c1.pay_date=c2.pay_date
                            order by department_id,month(c2.pay_date);
use sql_challenge;
create table activity2(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date));

select * from activity2;

-- Q131.Write an SQL query to report for each install date, the number of players that installed the game on
-- that day, and the day one retention.
-- Return the result table in any order.
with cte as(
select player_id,event_date as curr_date,lead(event_date) over(partition by player_id order by event_date) as next_date
from activity2
),cte1 as(
select distinct(player_id),curr_date,
case when datediff(next_date,curr_date)= 1 then 1 else 0 end as chk
from cte
group by player_id)
select curr_date as install_dt,count(player_id) as installs,round((sum(chk)/count(chk)),1)as retention_rate
from cte1
group by curr_Date;
use sql_challenge;
create table players(
player_id int,
group_id int,
primary key(player_id));

create table matches(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int,
primary key(match_id));

-- Q.132The winner in each group is the player who scored the maximum total points within the group. In the
-- case of a tie, the lowest player_id wins.
-- Write an SQL query to find the winner in each group.
-- Return the result table in any order.

select * from players;
select * from matches;
with cte as(
select m.first_player as player,m.first_score as score,p.group_id
from matches m inner join players p on m.first_player=p.player_id
union all
select m.second_player as player,m.second_score as score,p.group_id
from matches m inner join players p on m.second_player=p.player_id
),
cte2 as(
select group_id,player,sum(score)as total_score
from cte group by group_id,player
)select group_id,player as player_id from(
select group_id,player,rank() over(partition by group_Id order by total_score desc ,player)as rn
from cte2)a
where rn=1;
use sql_challenge;
create table student4(
student_id int,
student_name varchar(30),
primary key(student_id));
create table exam(
exam_id int,
student_id int,
score int,
primary key(exam_id, student_id));

-- Q133.A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not
-- return the student who has never taken any exam.Return the result table ordered by student_id.

select * from student4;
select * from exam;

with cte1 as(
select exam_id,max(score) as max_score,min(score) as min_score
from exam group by exam_id
),cte2 as(
select distinct e.student_id,s.student_name,e.exam_id,e.score,c.min_score ,c.max_score
from exam e left join student4 s
on e.student_id=s.student_id left join cte1 c on c.exam_id=e.exam_id
)
select student_id,student_name
from cte2 c where score <>min_score and score<>max_score
group by student_id having count(student_id)=(select count(student_id) from exam where c.student_id=student_id group by student_id)

use sql_challenge;
create table student4(
student_id int,
student_name varchar(30),
primary key(student_id));
create table exam(
exam_id int,
student_id int,
score int,
primary key(exam_id, student_id));

-- Q134.A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not
-- return the student who has never taken any exam.Return the result table ordered by student_id.

select * from student4;
select * from exam;

with cte1 as(
select exam_id,max(score) as max_score,min(score) as min_score
from exam group by exam_id
),cte2 as(
select distinct e.student_id,s.student_name,e.exam_id,e.score,c.min_score ,c.max_score
from exam e left join student4 s
on e.student_id=s.student_id left join cte1 c on c.exam_id=e.exam_id
)
select student_id,student_name
from cte2 c where score <>min_score and score<>max_score
group by student_id having count(student_id)=(select count(student_id) from exam where c.student_id=student_id group by student_id)

use sql_challenge;
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

-- Q135.Write an SQL query to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one activity at the
-- same time. Return the result table in any order

select * from useractivity;

with cte as(
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity
)
select username,activity,startdate,enddate
from cte
where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);

use sql_challenge;
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

-- Q136.Write an SQL query to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one activity at the
-- same time. Return the result table in any order

select * from useractivity;

with cte as(
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity
)
select username,activity,startdate,enddate
from cte
where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);


use sql_challenge;
create table employees1(
id int,
name varchar(30),
salary int);

insert into employees1 values(1,'Kristeen',1420);
insert into employees1 values(2,'Ashley',2006);
insert into employees1 values(3,'Julia',2210);
insert into employees1 values(4,'Maria',3000);


-- Q137.Samantha was tasked with calculating the average monthly salaries for all employees in the
-- EMPLOYEES table, but did not realise her keyboard's 0 key was broken until after completing the
-- calculation. She wants your help finding the difference between her miscalculation (using salaries
-- with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries),and round it up to the next integer

select  ceil(avg(salary)-avg(replace(salary,'0',''))) as avg_salary from employees1;
use sql_challenge;
create table employee9(
employee_id int,
name varchar(30),
months int,
salary int);
-- creating another copy of table from previous table
create table employee9 as select * from employee6;

-- Q.138 Write a query to find the maximum total earnings for all employees as well as the total number of
-- employees who have maximum total earnings. Then print these values as 2 space-separated integers.

select salary*months as earning,count(*) as no_of_employee
from employee9 where salary*months=(select max(salary*months) from employee9);
use sql_challenge;
create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');

-- 139.(1). Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by
-- the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For
-- example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order

-- 1st Query output
select concat(name,'(',substr(occupation,1,1),')') as name
from occupations;

-- 2nd Query Output
with cte as(
select occupation,count(*) as occ_count
from occupations group by occupation)

select concat('There are a total of ',occ_count,' ',occupation,'s') as statement
from cte
order by occ_count;


use sql_challenge;
create table occupations(
name varchar(30),
occupation varchar(30));

insert into occupations values('Samantha','Doctor');
insert into occupations values('Julia','Actor');
insert into occupations values('Maria','Actor');
insert into occupations values('Meera','Singer');
insert into occupations values('Ashely','Professor');
insert into occupations values('Ketty','Professor');
insert into occupations values('Christeen','Professor');
insert into occupations values('Jane','Actor');
insert into occupations values('Jenny','Doctor');
insert into occupations values('Priya','Singer');
-- Q140 . Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and
-- displayed underneath its corresponding Occupation. The output column headers should be Doctor,
-- Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.
select Doctor,Professor,Singer,Actor from(
select
    rn,
    max(case when occupation = 'Doctor' then name end) Doctor,
    max(case when occupation = 'Professor'  then name end) Professor,
    max(case when occupation = 'Singer' then name end) Singer,
    max(case when occupation = 'Actor'  then name end) Actor
from (
    select o.*, row_number() over(partition by occupation order by name) rn
    from occupations o
)a
group by rn)b;



use sql_challenge;
create table bst(
n int,
p int);

insert into bst values(1,2);
insert into bst values(3,2);
insert into bst values(6,8);
insert into bst values(9,8);
insert into bst values(2,5);
insert into bst values(8,5);
insert into bst values(5,null);

-- Q141.Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the
-- following for each node:
-- ● Root: If node is root node.
-- ● Leaf: If node is leaf node.
-- ● Inner: If node is neither root nor leaf node.

select n,
	case when p is null then 'root'
		when n not in(select distinct p from bst where p is not null) then 'leaf'
        else 'inner' end as type
        from bst
        order by n;
        
use sql_challenge;
create table company1(
company_code varchar(30),
founder varchar(30));


create table lead_manager(
lead_manager_code varchar(30),
company_code varchar(30));

create table senior_manager(
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table manager(
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

create table employee10(
employee_code varchar(30),
manager_code varchar(30),
senior_manager_code varchar(30),
lead_manager_code varchar(30),
company_code varchar(30));

insert into company1 values('C1','Monika');
insert into company1 values('C2','Samantha');

insert into lead_manager values('LM1','C1');
insert into lead_manager values('LM2','C2');

insert into senior_manager values('SM1','LM1','C1');
insert into senior_manager values('SM2','LM1','C1');
insert into senior_manager values('SM3','LM2','C2');

insert into manager values('M1','SM1','LM1','C1');
insert into manager values('M2','SM3','LM2','C2');
insert into manager values('M3','SM3','LM2','C2');

insert into employee10 values('E1','M1','SM1','LM1','C1');
insert into employee10 values('E2','M1','SM1','LM1','C1');
insert into employee10 values('E3','M2','SM3','LM2','C2');
insert into employee10 values('E4','M3','SM3','LM2','C2');


-- Q142.Given the table schemas below, write a query to print the company_code, founder name, total number
-- of lead managers, total number of senior managers, total number of managers, and total number of
-- employees. Order your output by ascending company_code.

SELECT C.COMPANY_CODE,
       C.FOUNDER,
  (SELECT COUNT(DISTINCT LEAD_MANAGER_CODE) 
   FROM LEAD_MANAGER L
   WHERE L.COMPANY_CODE = C.COMPANY_CODE) as lead_manager_count,
  (SELECT COUNT(DISTINCT SENIOR_MANAGER_CODE)
   FROM SENIOR_MANAGER S
   WHERE S.COMPANY_CODE = C.COMPANY_CODE) as senior_manager_count,
  (SELECT COUNT(DISTINCT MANAGER_CODE)
   FROM MANAGER M
   WHERE M.COMPANY_CODE = C.COMPANY_CODE) as manager_count,
  (SELECT COUNT(DISTINCT EMPLOYEE_CODE) 
   FROM EMPLOYEE10 E
   WHERE E.COMPANY_CODE = C.COMPANY_CODE)as employee_count
FROM COMPANY1 C
ORDER BY C.COMPANY_CODE ASC;
use sql_challenge;

create table functions(
x int ,
y int);

insert into functions values(20,20);
insert into functions values(20,20);
insert into functions values(20,21);
insert into functions values(23,22);
insert into functions values(22,23);
insert into functions values(21,20);

select * from functions;

-- Q143.Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
select distinct x1,y1 from(
select f1.x as x1,f1.y as y1,f2.x as x2,f2.y as y2
from functions f1 inner join functions f2
on f1.x=f2.y and f1.y=f2.x)a
where x1<=y1
order by x1;


use sql_challenge;
create table packages(
id int,
salary float);

create table friends(
id int,
friend_id int);

create table students3(
id int,
name varchar(30));

insert into packages values(1,15.20);
insert into packages values(2,10.06);
insert into packages values(3,11.55);
insert into packages values(4,12.12);

insert into friends values(1,2);
insert into friends values(2,3);
insert into friends values(3,4);
insert into friends values(4,1);

insert into students3 values(1,'AShley');
insert into students3 values(2,'Samantha');
insert into students3 values(3,'Julia');
insert into students3 values(4,'Scarlet');

-- Q144. Write a query to output the names of those students whose best friends got offered a higher salary
-- than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed
-- that no two students get the same salary offer.

select * from packages;
select * from friends;
select * from students3;

with cte as(
select s.id,s.name,f.friend_id,p.salary as student_salary,p1.salary as friend_salary
from students3 s left join friends f
on s.id=f.id left join packages p 
on s.id=p.id left join packages p1 
on f.friend_id=p1.id
)
select name from cte
where student_salary <friend_salary
order by friend_salary;


use sql_challenge;
create table hackers(
hacker_id int,
name varchar(30));

create table difficulty(
difficulty_level int,
score int);

create table challenges(
challenge_id int,
hacker_id int,
difficulty_level int);

create table submission(
submission_id int,
hacker_id int,
challenge_id int,
score int);


insert into hackers values(5580,'Rose');
insert into hackers values(8439,'Angela');
insert into hackers values(27205,'Frank');
insert into hackers values(52243,'Patrick');
insert into hackers values(52243,'Lisa');
insert into hackers values(57645,'Kimberly');
insert into hackers values(77726,'Bonnie');
insert into hackers values(83082,'Michael');
insert into hackers values(86870,'Todd');
insert into hackers values(90411,'Joe');


insert into difficulty values(1,20);
insert into difficulty values(2,30);
insert into difficulty values(3,40);
insert into difficulty values(4,60);
insert into difficulty values(5,80);
insert into difficulty values(6,100);
insert into difficulty values(7,120);

insert into challenges values(4810,77726,4);
insert into challenges values(21089,27205,1);
insert into challenges values(36566,5580,7);
insert into challenges values(66730,52243,6);
insert into challenges values(71055,52243,2);


insert into submission values(68628,77726,36566,30);
insert into submission values(65300,77726,21089,10);
insert into submission values(40326,52243,36566,77);
insert into submission values(8941,27205,4810,4);
insert into submission values(83554,77726,66730,30);
insert into submission values(43353,52243,66730,0);
insert into submission values(55385,52348,71055,20);
insert into submission values(39784,27205,71055,23);
insert into submission values(94613,86870,71055,30);
insert into submission values(45788,52348,36566,0);
insert into submission values(93058,86870,36566,30);
insert into submission values(7344,8439,66730,92);
insert into submission values(2721,8439,4810,36);
insert into submission values(523,5580,71055,4);
insert into submission values(49105,52348,66730,0);
insert into submission values(55877,57645,66730,80);
insert into submission values(38355,27205,66730,35);
insert into submission values(3924,8439,36566,80);
insert into submission values(97397,90411,66730,100);
insert into submission values(84162,83028,4810,40);
insert into submission values(97431,90411,71055,30);


-- Q145.Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard!
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more
-- than one challenge. Order your output in descending order by the total number of challenges in which
-- the hacker earned a full score. If more than one hacker received full scores in the same number of
-- challenges, then sort them by ascending hacker_id.

with cte as(
select s.hacker_id,h.name,s.challenge_id,s.score as obtained_score,c.difficulty_level,d.score as max_score
from submission s left join hackers h on s.hacker_id=h.hacker_id
left join challenges c on c.challenge_id=s.challenge_id left join difficulty d on c.difficulty_level=d.difficulty_level
)
select hacker_id,name
from cte
where obtained_score=max_score
group by hacker_id
having count(*)>=1
order by count(*) desc,hacker_id limit 1 ;

use sql_challenge;

create table projects(
task_id int,
start_date date,
end_date date);

insert into projects values(1,'2015-10-01','2015-10-02');
insert into projects values(2,'2015-10-02','2015-10-03');
insert into projects values(3,'2015-10-03','2015-10-04');
insert into projects values(4,'2015-10-13','2015-10-14');
insert into projects values(5,'2015-10-14','2015-10-15');
insert into projects values(6,'2015-10-28','2015-10-29');
insert into projects values(7,'2015-10-30','2015-10-31');

-- Q146.Write a query to output the start and end dates of projects listed by the number of days it took to
-- complete the project in ascending order. If there is more than one project that have the same number
-- of completion days, then order by the start date of the project.

select * from projects;
with cte as(
select *,date_sub(start_date,interval task_id day) as gp_date
from projects
)
select start_date,end_date from(
select gp_date,min(start_date) as start_date,max(end_date) as end_date
from cte 
group by gp_date
order by count(*) 
)a;
use sql_challenge;
create table transactions4(
user_id int,
amount float,
transaction_date timestamp);

-- Q147.In an effort to identify high-value customers, Amazon asked for your help to obtain data about users
-- who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more
-- consecutive days. List the user IDs who have gone on at least 1 shopping spree in ascending order.

select * from transactions4;
with cte as(
select *,
	transaction_date -row_number() over(partition by user_id order by transaction_date) as gp_date
    from transactions4)
    select distinct user_id
    from cte
    group by user_id,date(gp_date) having count(*)>=3;

use sql_challenge;
create table  payments(
payer_id int,
recipient_id int,
amount int);

-- Q148.You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. A
-- two-way unique relationship is established when two people send money back and forth. Write a
-- query to find the number of two-way unique relationships in this data.
-- Assumption:
-- ● A payer can send money to the same recipient multiple times

select count(p1.payer_id) as unique_relationships
from payments p1 inner join payments p2
on p1.payer_id=p2.recipient_id and p1.recipient_id=p2.payer_id and p1.payer_id>p2.payer_id;

use sql_challenge;
create table user_transaction1(
transaction_id int,
user_id int,
spend float,
transaction_Date timestamp);

insert into user_transaction1 values(759274, 111, 49.50, '2022-02-03 00:00:00');
insert into user_transaction1 values(850371 ,111, 51.00, '2022-03-15 00:00:00' );
insert into user_transaction1 values(615348, 145 ,36.30, '2022-03-22 00:00:00');
insert into user_transaction1 values(137424, 156, 151.00 ,'2022-04-04 00:00:00');
insert into user_transaction1 values(248475, 156, 87.00 ,'2022-04-16 00:00:00');

-- Q149. Assume you are given the table below on user transactions. Write a query to obtain the list of
-- customers whose first transaction was valued at $50 or more. Output the number of users.
-- Clarification:
-- ● Use the transaction_date field to determine which transaction should be labeled as the first
-- for each user.
-- ● Use a specific function (we can't give too much away!) to account for scenarios where a user
-- had multiple transactions on the same day, and one of those was the first.

select * from user_transaction1;

select count(user_id) as users from(
select user_id,spend,rank() over(partition by user_id order by transaction_date) as rn
from user_transaction1)a
where rn=1 and spend>=50
use sql_challenge;
create table measurements(
measurement_id int,
measurement_value float,
measurement_time datetime);

-- Q150.Assume you are given the table below containing measurement values obtained from a sensor over
-- several days. Measurements are taken several times within a given day.
-- Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a
-- particular day, in two different columns.

select * from measurements;
with cte as(
select date(measurement_time) as measurement_day,measurement_value,
row_number() over(partition by day(measurement_time) order by measurement_id)as rn
from measurements)
select measurement_day,
round(sum(case when rn%2=1 then measurement_value else 0 end),2) as odd_sum,
round(sum(case when rn%2=0 then measurement_value else 0 end),2) as even_sum
from cte
group by measurement_day;



use sql_challenge;
create table transactions4(
user_id int,
amount float,
transaction_date timestamp);

-- Q151.In an effort to identify high-value customers, Amazon asked for your help to obtain data about users
-- who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more
-- consecutive days. List the user IDs who have gone on at least 1 shopping spree in ascending order.

select * from transactions4;
with cte as(
select *,
	transaction_date -row_number() over(partition by user_id order by transaction_date) as gp_date
    from transactions4)
    select distinct user_id
    from cte
    group by user_id,date(gp_date) having count(*)>=3;

use sql_challenge;
create table rental_amenities(
rental_id int,
amentity varchar(30));

-- Q152.The Airbnb Booking Recommendations team is trying to understand the "substitutability" of two
-- rentals and whether one rental is a good substitute for another. They want you to write a query to find
-- the unique combination of two Airbnb rentals with the same exact amenities offered.
-- Output the count of the unique combination of Airbnb rentals.

select * from rental_amenities;

with cte as(
select rental_id,group_concat(amentity order by amentity) as amentities
from rental_amenities
group by rental_id)
select count(*) as matching_airbnb from(
select amentities,count(distinct amentities) as gp_match
from cte
group by amentities having count(*)>1)a;

use sql_challenge;
create table ad_campaigns(
campaign_id int,
spend  int,
revenue int,
advertiser_id int);

-- Q153.Google marketing managers are analysing the performance of various advertising accounts over the
-- last month. They need your help to gather the relevant data.
-- Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns.
-- Round your answer to 2 decimal places, and order your output by the advertiser_id

select * from ad_campaigns;

select advertiser_id, round(sum(revenue)/sum(spend),2) as ROAS
from ad_campaigns
group by advertiser_id
order by advertiser_id;
use sql_challenge;
create table employee_pay(
employee_id int,
salary int,
title varchar(30));

-- Q154. Write a query that shows the following data for each compensation outlier: employee ID, salary, and
-- whether they are potentially overpaid or potentially underpaid (refer to Example Output below).
with cte as(
select title,round(avg(salary),2) as avg_salary
from employee_pay
group by title
)
select employee_Id ,salary ,status from(
select e.employee_id,e.salary,
		case when e.salary > 2*c.avg_salary then 'Overpaid'
			when e.salary < c.avg_salary/2 then 'Underpaid'
            end as status
            from  employee_pay e inner join cte c 
            on e.title=c.title)a
            where status is not null;
use sql_challenge;
create table  payments(
payer_id int,
recipient_id int,
amount int);

-- Q155.You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. A
-- two-way unique relationship is established when two people send money back and forth. Write a
-- query to find the number of two-way unique relationships in this data.
-- Assumption:
-- ● A payer can send money to the same recipient multiple times

select count(p1.payer_id) as unique_relationships
from payments p1 inner join payments p2
on p1.payer_id=p2.recipient_id and p1.recipient_id=p2.payer_id and p1.payer_id>p2.payer_id;

use sql_challenge;
create table purchases(
user_id int,
product_id int,
quantity int,
purchase_time datetime);

-- Q156.Assume you are given the table below containing information on user purchases. Write a query to
-- obtain the number of users who purchased the same product on two or more different days. Output
-- the number of unique users.
-- PS. On 26 Oct 2022, we expanded the purchases data set, thus the official output may vary from before

select * from purchases;

select count(distinct user_id) as repeated_customers
from purchases 
group by user_id,product_id having count(distinct purchase_time)>=2;
use sql_challenge;
create table transactions5(
transaction_id int,
type  enum('deposit', 'withdrawal'),
amount float,
transaction_date timestamp);

-- Q157.Say you have access to all the transactions for a given merchant account. Write a query to print the
-- cumulative balance of the merchant account at the end of each day, with the total balance reset back
-- to zero at the end of the month. Output the transaction date and cumulative balance.

select * from transactions5;

with cte as(
select transaction_id,type,transaction_date,
	case when type='withdrawal' then  -1*amount
    else amount end as amount 
    from transactions5
    )
 select transaction_date,round(sum(amount),2) as balance
 from cte
 group by day(transaction_date)
 order by date(transaction_date);
    
    
use sql_challenge;
create table product_spend(
category varchar(30),
product varchar(30),
user_id int,
spend float,
transaction_date timestamp);

-- Q158 Assume you are given the table below containing information on Amazon customers and their spend
-- on products belonging to various categories. Identify the top two highest-grossing products within
-- each category in 2022. Output the category, product, and total spend.

select * from product_spend;
with cte as(
select category,product,round(sum(spend),2) as total_spend
from product_spend
where year(transaction_date)=2022
group by category,product)
select category,product,total_spend from(
select category,product,total_spend,dense_rank() over(partition by category order by total_spend desc) as rn
from cte)a
where rn in(1,2)
order by category,product,total_spend;
use sql_challenge;
create table users4(
user_id int,
signup_date datetime,
last_login datetime);

-- Q159.Facebook is analysing its user signup data for June 2022. Write a query to generate the churn rate by
-- week in June 2022. Output the week number (1, 2, 3, 4, ...) and the corresponding churn rate rounded
-- to 2 decimal places.
-- For example, week number 1 represents the dates from 30 May to 5 Jun, and week 2 is from 6 Jun to 12 Jun.

select * from users4;

-- SET SQL_SAFE_UPDATES = 0;
-- insert into users4 values(1001, '2022-06-01 12:00:00' ,'2022-07-05 12:00:00');
-- delete from users4 where user_id=1001;
with cte as(
select user_id,signup_date,last_login,
WEEK(signup_date,6) - WEEK(DATE_SUB(signup_date, INTERVAL DAYOFMONTH(signup_date)-1 DAY),6)+1 as signup_week,
	   case when datediff(last_login,signup_date)<28 then 1
       else 0 end as chk
       from users4)
       select signup_week,round((100.0*sum(chk)/count(chk)),2) as churn_rate
       from cte
       group by signup_week;

use sql_challenge;
create table if not exists product(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_id)
);
create table if not exists sales(
seller_id  int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key (product_id) references product(product_id)
);
select * from sales;
select * from product;

-- Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
-- between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

with cte as(
select s.product_id,p.product_name,s.sale_date
from sales s inner join product p 
on s.product_id=p.product_id
where s.sale_date between '2019-01-01' and '2019-03-31')
select product_id,product_name from cte c
where sale_date =(select max(sale_date) from sales group by product_id having product_id=c.product_id)






use sql_challenge;
create table if not exists views(
article_id int,
author_id int,
viewer_id int,
viewer_date date);

select * from views;
-- Write an SQL query to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

select a.author_id as id from views a inner join views v 
on a.author_id=v.viewer_id and v.author_id=a.viewer_id and a.article_id=v.article_id
order by id;
use sql_challenge;
create table delivery(
delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date,
primary key(delivery_id)
);
select * from delivery;

-- If the customer's preferred delivery date is the same as the order date, then the order is called
-- immediately; otherwise, it is called scheduled.
-- Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
-- places.

select 
	round(100.0*count(case when order_date=customer_pref_delivery_date then 1 else null end)/count(*),2) as immediate_percentage
    from delivery;
create database if not exists sql_challenge;
use sql_challenge;
create table city(
id int,
name varchar(17),
countrycode varchar(3),
district varchar(20),
population int);
alter table city modify countrycode varchar(15);
insert into city values(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321);
insert into city values(3878, 'Scottsdale','USA', 'Arizona' ,202705);
insert into city values(3965, 'Corona', 'USA', 'California', 124966);
insert into city values(3973, 'Concord','USA', 'California', 121780);
insert into city values(3977, 'Cedar', 'Rapids', 'USA Iowa' ,120758);
insert into city values(3982, 'Coral', 'Springs','USA Florida', 117549);
insert into city values(4054, 'Fairfield','USA','California' ,92256);
insert into city values(4058, 'Boulder', 'USA','Colorado' ,91238);
insert into city values(4061, 'Fall', 'River','USA Massachusetts', 90555);
select * from city;

-- Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.
select * from city where countrycode='USA' and population > 100000;

-- Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
select name from city where  countrycode='USA' and population > 120000;

-- Q3. Query all columns (attributes) for every row in the CITY table.
select * from city;

-- Q4. Query all columns for a city in CITY with the ID 1661.
-- select * from city where id =1661;

-- Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select * from city where countrycode='JPN';

-- Q6.Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
select name from city where countrycode='JPN';




use sql_challenge;
create table ads(
ad_id int,
user_id int,
action enum ('Clicked', 'Viewed', 'Ignored'),
primary key(ad_id,user_id)
);
select * from ads;

-- Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.
with cte as(
select ad_id,action,
case when action ='Clicked' then 1 
when action='Viewed' then 0 else null end as chk
from ads 
)
select ad_id, ifnull(round(100*sum(chk)/count(chk),2),0) as ctr
from cte group by ad_id
order by ctr desc ,ad_id asc;


use sql_challenge;
create table employee(
employee_id int,
team_id int,
primary key(employee_id)
);
select * from employee;

-- Write an SQL query to find the team size of each of the employees.
-- Return result table in any order

select e1.employee_id,count(e1.employee_id) as team_size
from employee e1 inner join employee e2
on e1.team_id=e2.team_id
group by e1.employee_id
order by employee_id;

use sql_challenge;
create table Countries(
country_id int,
country_name varchar(30),
primary key(country_id)
);
create table Weather(
country_id int,
weather_state int,
day date,
primary key(country_id,day)
);
select * from countries;
select * from weather;

-- Write an SQL query to find the type of weather in each country for November 2019.
-- The type of weather is:
-- ● Cold if the average weather_state is less than or equal 15,
-- ● Hot if the average weather_state is greater than or equal to 25, and
-- ● Warm otherwise.
-- Return result table in any order
with cte as(
select c.country_name,round(avg(weather_state)) as avg_weather
from countries c inner join weather w
on c.country_id=w.country_id
where year(day)=2019 and month(day)=11
group by country_name)
select country_name,
					case when avg_weather<=15 then 'Cold'
						 when avg_weather>=25 then 'Hot'
                         else 'Warm' end as 'weather_type'
                         from cte;
use sql_challenge;
create table prices(
product_id int,
start_date date,
end_date date,
price int,
primary key(product_id, start_date, end_date)
);
create table unitssold(
product_id int,
purchase_date date,
unit int
);
select * from prices;
select * from unitssold;

-- Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order

select p.product_id,round(sum(unit*price)/sum(unit),2) as average_price from
prices p inner join unitssold u
on p.product_id=u.product_id and u.purchase_date between p.start_date and p.end_date
group by product_id;
use sql_challenge;
create table activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key (player_id, event_date)
);

select * from activity;

-- Q.24 Write an SQL query to report the first login date for each player.
-- Return the result table in any order
select player_id ,min(event_date) as first_login_date
from activity group by player_id;

-- Q.25 Write an SQL query to report the device that is first logged in for each player.
-- Return the result table in any order 
select player_id,device_id from activity a
where event_date=(select min(event_date) from activity group by player_id having player_id=a.player_id);

use sql_challenge;
create table products(
product_id int,
product_name varchar(30),
product_category varchar(30),
primary key(product_id)
);
create table orders(
product_id int,
order_date date,
unit int,
foreign key (product_id) references products(product_id)
);
select * from orders;
select * from products;

-- Q26.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount. Return result table in any order
select p.product_name,sum(o.unit) as unit
from products p inner join orders o
on p.product_id=o.product_id
where year(order_date)=2020 and month(order_date)=2
group by product_name having sum(unit)>=100;
use sql_challenge;
create table users(
user_id int ,
name varchar(30),
mail varchar(30),
primary key(user_id)
);

-- Q27.Write an SQL query to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:
-- ● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
-- '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- ● The domain is '@leetcode.com'.
-- Return the result table in any order

select * from Users
    where mail regexp '^[a-zA-Z]+[a-zA-Z0-9_\\./\\-]{0,}@leetcode.com$'
    order by user_id;

use sql_challenge;
create table customers(
customer_id int,
name varchar(30),
country varchar(30),
primary key(customer_id)
);

create table orders1(
order_id int,
customer_id int,
product_id int,
order_date date,
quantity int,
primary key(order_id)
);

create table product1(
product_id int,
descripion varchar(30),
price int,
primary key(product_id)
);
select * from product1;
select * from orders1;
select * from customers;

-- Write an SQL query to report the customer_id and customer_name of customers who have spent at
-- least $100 in each month of June and July 2020.
-- Return the result table in any order.
with cte as(
select o.customer_id,c.name,sum(price*quantity) as month_spend,month(order_date) as month
from orders1 o inner join product1 p on o.product_id=p.product_id inner join customers c on o.customer_id=c.customer_id
where year(o.order_date)=2020 and month(o.order_date) in(6,7)
group by customer_id,month(order_date)
)
select customer_id,name from cte
where month_spend>=100
group by customer_id
having count(*)=2;


use sql_challenge;
create table tvprogram(
program_date datetime,
content_id int,
channel varchar(30),
primary key(program_date, content_id)
);
create table content(
content_id varchar(30),
title varchar(30),
kids_content enum('Y','N'),
content_type varchar(30),
primary key(content_id)
);

select * from tvprogram;
select * from content;

-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
-- Return the result table in any order

select c.title
from tvprogram t inner join content c 
on t.content_id=c.content_id
where kids_content='Y' and content_type='Movies' and year(program_date)=2020 and month(program_date)=6;
use sql_challenge;
create table npv(
id int,
year int,
npv int,
primary key(id,year)
);
create table queries(
id int,
year int,
primary key(id,year)
);
select * from npv;
select * from queries;

-- Q30. Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

select q.id, q.year,ifnull(n.npv,0) as npv
from queries q left join npv n on q.id=n.id and q.year=n.year;

-- Q31.Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.
-- ABOVE REPEATED QUESTION

use sql_challenge;
create table npv(
id int,
year int,
npv int,
primary key(id,year)
);
create table queries(
id int,
year int,
primary key(id,year)
);
select * from npv;
select * from queries;

-- Q30. Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

select q.id, q.year,ifnull(n.npv,0) as npv
from queries q left join npv n on q.id=n.id and q.year=n.year;

-- Q31.Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.
-- ABOVE REPEATED QUESTION

use sql_challenge;
create table employees(
id int,
name varchar(30),
primary key(id)
);
create table employeeuni(
id int,
unique_id int,
primary key(id,unique_id)
);

select * from employees;
select * from employeeuni;

-- Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
-- show null. Return the result table in any order
select en.unique_id,e.name
from employees e left join employeeuni en on e.id=en.id
order by name;

use sql_challenge;
create table users1(
id int,
name varchar(30),
primary key(id)
);
create table rides(
id int,
user_id int,
distance int,
primary key(id)
);

select * from users1;
select * from rides;

-- Q33.Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order
select u.name,ifnull(sum(r.distance),0) as travelled_distance
from users1 u left join rides r on u.id=r.user_id
group by u.id
order by travelled_distance desc,name;

use sql_challenge;
create table products2(
product_id int,
product_name varchar(30),
product_category varchar(30),
primary key(product_id)
);

create table orders2(
product_id int,
order_date date,
unit int,
foreign key(product_id) references products2(product_id)
);

-- Q34.Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
-- and their amount.
-- Return result table in any order.
-- ORDERS TABLE DATA IS NOT GIVEN IN THIS QUESTIONS
use sql_challenge;
create table movies(
movie_id int,
title varchar(30),
primary key(movie_id)
);
create table users2(
user_id int,
name varchar(30),
primary key(user_id)
);
 create table movierating(
 movie_id int,
 user_id int,
 rating int,
 created_at date,
 primary key(movie_id, user_id)
 );
 select * from movies;
 select * from users2;
 select * from movierating;
 
 -- Q35.Write an SQL query to:
-- ● Find the name of the user who has rated the greatest number of movies. In case of a tie,
-- return the lexicographically smaller user name.
SELECT U.NAME 
FROM USERS2 U LEFT JOIN MOVIERATING MR 
ON U.USER_ID=MR.USER_ID
GROUP BY NAME
ORDER BY COUNT(MR.RATING) DESC ,NAME LIMIT 1;
-- ● Find the movie name with the highest average rating in February 2020. In case of a tie, return
-- the lexicographically smaller movie name.

SELECT M.TITLE
 FROM MOVIES M LEFT JOIN MOVIERATING MR 
 ON M.MOVIE_ID=MR.MOVIE_ID
 GROUP BY TITLE
 ORDER BY AVG(MR.RATING) DESC ,TITLE LIMIT 1;




use sql_challenge;
create table users3(
id int,
name varchar(30),
primary key(id)
);
create table rides1(
id int,
user_id int,
distance int,
primary key(id)
);

-- Q36.Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order

select u.name,ifnull(sum(r.distance),0) as travelled_distance
from users3 u left join rides1 r on u.id=r.user_id
group by u.id
order by travelled_distance desc,name;

-- Q.36 AND Q.33 ARE SAME
-- Q.32 AND Q.37 ARE SAME 
use sql_challenge;
create table employees(
id int,
name varchar(30),
primary key(id)
);
create table employeeuni(
id int,
unique_id int,
primary key(id,unique_id)
);

select * from employees;
select * from employeeuni;

-- Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
-- show null. Return the result table in any order
select en.unique_id,e.name
from employees e left join employeeuni en on e.id=en.id
order by name;

use sql_challenge;
create table departments(
id int ,
name varchar(30),
primary key(id)
);
create table students(
id int,
name varchar(30),
department_id int,
primary key(id)
);

select * from departments;
select * from students;

--  Q38.Write an SQL query to find the id and the name of all students who are enrolled in departments that no
-- longer exist. Return the result table in any order.

select s.id,s.name
from departments d right join students s
on d.id=s.department_id
where d.name is null;



use sql_challenge;
create table calls(
from_id int,
to_id int,
duration int
);
select * from calls;

-- Q.39 Write an SQL query to report the number of calls and the total call duration between each pair of
-- distinct persons (person1, person2) where person1 < person2.
-- Return the result table in any order.
-- person1 person2 call_count total_duration
select from_id as person1 ,to_id as person2,count(*) as call_count,sum(duration) as call_duration from(
select * from calls
union all
select to_id,from_id,duration from calls)s
where from_id<to_id
group by person1 ,person2;

-- Q.40 Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order.
-- Q.40 AND Q.23 ARE BOTH SAME
use sql_challenge;
create table prices(
product_id int,
start_date date,
end_date date,
price int,
primary key(product_id, start_date, end_date)
);
create table unitssold(
product_id int,
purchase_date date,
unit int
);
select * from prices;
select * from unitssold;

-- Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order

select p.product_id,round(sum(unit*price)/sum(unit),2) as average_price from
prices p inner join unitssold u
on p.product_id=u.product_id and u.purchase_date between p.start_date and p.end_date
group by product_id;
use sql_challenge;
create table warehouse(
name varchar(30),
product_id int,
units int,
primary key(name, product_id)
);
create table products3(
product_id int,
product_name varchar(30),
width int,
length int,
height int,
primary key(product_id)
);
select * from warehouse;
select * from products3;

select w.name as warehouse_name,sum(w.units*p.width*p.length*p.height) as volume
from warehouse w left join products3 p
on w.product_id=p.product_id
group by w.name; 
use sql_challenge;
create table sales1(
sale_date date,
fruit varchar(30),
sold_num int,
primary key(sale_date, fruit)
);
select * from sales1;
-- Q42.Write an SQL query to report the difference between the number of apples and oranges sold each day.
-- Return the result table ordered by sale_date
with cte as(
select * ,
		case when fruit='oranges' then -1*sold_num else sold_num end as gp_num
        from sales1
        )
        select sale_date,sum(gp_num) as diff from cte 
        group by sale_date
        order by sale_date;
use sql_challenge;
create table activity1(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date)
);
select * from activity1;

-- Q.43 Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.
with cte as(
select player_id,event_date as curr_date,
lead(event_date) over(partition by player_Id order by event_date) as next_date
from activity1
)
select 
round(100.0*count(distinct case when datediff(next_date,curr_date)=1 then 1 else null end)/count(distinct player_id),2) as fraction
from cte;

use sql_challenge;
create table employee1(
id int ,
name varchar(30),
department varchar(30),
manager_id int,
primary key(id)
);
select * from employee1;

-- Q44. Write an SQL query to report the managers with at least five direct reports.
-- Return the result table in any order
with cte as(
select e.id,e.name ,m.id as manager_id,m.name as manager_name from employee1 e left	
 join employee1 m
on m.id=e.manager_id where e.manager_id is not null
)
select manager_name as name from cte
group by manager_name having count(*)>=5;

use sql_challenge;
create table student1(
student_id int,
student_name varchar(30),
gender varchar(30),
dept_id int,
primary key(student_id)
);
create table department1(
dept_id int,
dept_name varchar(30),
primary key(dept_id)
);
select  * from student1;
select * from department1;

-- Q.45Write an SQL query to report the respective department name and number of students majoring in
-- each department for all departments in the Department table (even ones with no current students).
-- Return the result table ordered by student_number in descending order. In case of a tie, order them by
-- dept_name alphabetically

select d.dept_name,count(student_name) as student_numbers
from department1 d left join student1 s
on d.dept_id=s.dept_id
group by d.dept_name
order by student_numbers desc,dept_name;
use sql_challenge;
create table customer1(
customer_id int,
product_key int,
foreign key (product_key) references product4(product_key)
);
create table product4(
product_key int,
primary key(product_key)
);
select * from customer1;
select * from product4;

-- Q46. Write an SQL query to report the customer ids from the Customer table that bought all the products in
-- the Product table.Return the result table in any order
with cte as(
select c.customer_id,p.product_key,count(p.product_key) as pro_count
from product4 p left join customer1 c 
on p.product_key=c.product_key
group by c.customer_id)
select customer_id from cte where pro_count=(select count(*) from product4);

use sql_challenge;
create table project(
project_id int,
employee_id int,
primary key(project_id,employee_id),
foreign key(employee_id) references employee2(employee_id)
);
create table employee2(
employee_id int,
name varchar(30),
experience_years int,
primary key(employee_id)
);
select * from project;
select * from employee2;

-- Q47.Write an SQL query that reports the most experienced employees in each project. In case of a tie,
-- report all employees with the maximum number of experience years. Return the result table in any order.
with cte as(
select p.project_id,p.employee_id,e.experience_years
from project p left join employee2 e
on p.employee_id=e.employee_id)
select project_id,employee_id from cte c
where experience_years=(select max(experience_years) from cte where project_id=c.project_id group by project_id)
order by project_Id;
use sql_challenge;
create table books(
book_id int,
name varchar(30),
available_from date,
primary key(book_id)
);
create table orders3(
order_id int,
book_id int,
quantity int,
dispatch_date date,
primary key(order_id),
foreign key(book_id) references books(book_id)
);
select * from books;
-- Q48. Write an SQL query that reports the books that have sold less than 10 copies in the last year,
-- excluding books that have been available for less than one month from today. Assume today is
-- 2019-06-23.

-- INSUFFICIENT DATA ORDERS TABLE DATA IS NOT GIVEN
use sql_challenge;
create table enrollments(
student_id int,
course_id int,
grade int,
primary key(student_id,course_id)
);

select * from enrollments;

--  Q49.Write a SQL query to find the highest grade with its corresponding course for each student. In case of
-- a tie, you should find the course with the smallest course_id.
-- Return the result table ordered by student_id in ascending order.
select student_id,course_id,grade from(
select *,rank() over(partition by student_id order by grade desc,course_id) rn 
from enrollments)a
where rn=1
order by student_id;
use sql_challenge;

-- Q50.Write an SQL query to find the winner in each group.
-- Return the result table in any order.

-- DATA IS NOT MATCHING FROM ACTUTAL GIVEN DATA ACCORDING TO QUESTIONS
use sql_challenge;
create table world(
name varchar(30),
continent varchar(30),
area int,
population bigint,
gdp bigint,
primary key(name)
);
select * from world;
 -- Q51.Write an SQL query to report the name, population, and area of the big countries.
-- Return the result table in any order.

SELECT NAME ,POPULATION,AREA FROM WORLD
WHERE AREA>=3000000 OR POPULATION>=25000000;
use sql_challenge;
create table customer2(
id int,
name varchar(30),
refree_id int,
primary key(id));

select * from customer2;

-- Q52.Write an SQL query to report the names of the customer that are not referred by the customer with id
-- = 2.Return the result table in any order.

select name from customer2 
where refree_id <>2 or refree_id is null;

use sql_challenge;
create table customer3(
id int ,
name varchar(30),
primary key(id)
);
create table order4(
id int,
customerid int,
primary key(id),
foreign key(customerid) references customer3(id)
);
select * from customer3;
select * from order4;

-- Q53.Write an SQL query to report all customers who never order anything.
-- Return the result table in any order.

select c.name as customers
from customer3 c left join order4 o
on c.id=o.customerid
where o.id is null;

use sql_challenge;
create table employee3(
employee_id int,
team_id int,
primary key(employee_id));

select * from employee3;

-- Q54.Write an SQL query to find the team size of each of the employees.
-- Return result table in any order.

select e1.employee_id,count(e1.team_id) as team_size
from employee3 e1 inner join employee3 e2
on e1.team_id=e2.team_id
group  by e1.employee_Id
order by employee_id ;
use sql_challenge;
create table person(
id int,
name varchar(30),
phone_number varchar(30),
primary key(id)
);
create table country(
name varchar(30),
country_code varchar(30),
primary key(country_code));

create table calls1(
caller_id int,
callee_id int,
duration int
);
select * from person;
select * from country;
select * from calls1;

-- Q55. Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order
with cte1 as(
select id ,name,phone_number,
case when substring(phone_number,1,1)=0 then substring(phone_number,2,2) 
	 else substring(phone_number,1,3) end as country_code
     from person),
cte2 as(
select cn.name,c.duration
from calls1 c inner join cte1 ct on c.caller_id=ct.id or c.callee_id=ct.id  left join country cn on ct.country_code=cn.country_code
order by caller_id)
select name from cte2
group by name 
having avg(duration)>(select avg(duration) from cte2);
	
use sql_challenge;
create table activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key (player_id, event_date)
);

select * from activity;
-- Q.56 Write an SQL query to report the device that is first logged in for each player.
-- Return the result table in any order 
select player_id,device_id from activity a
where event_date=(select min(event_date) from activity group by player_id having player_id=a.player_id);

use sql_challenge;
create table orders4(
order_number int,
customer_number int,
primary key(order_number));

-- Q57.Write an SQL query to find the customer_number for the customer who has placed the largest
-- number of orders.The test cases are generated so that exactly one customer will have placed more orders than any other customer.
select * from orders4;

select customer_number 
from orders4 group by customer_number
order by count(customer_number) desc limit 1;

-- Follow up: What if more than one customer has the largest number of orders, can you find all the
-- customer_number in this case?
with cte as(
select customer_number,count(customer_number) as total_order
from orders4 
group by customer_number order by total_order desc limit 1)
select customer_number from orders4
group by customer_number
having count(customer_number) in (select total_order from cte);


use sql_challenge;
create table cinema(
seat_id int auto_increment primary key,
free bool);
select * from cinema;

-- Q58.Write an SQL query to report all the consecutive available seats in the cinema.
-- Return the result table ordered by seat_id in ascending order.
-- The test cases are generated so that more than two seats are consecutively available.
with cte as(
select seat_id,free as curr_seat,
						lead(free) over(order by seat_id) as next_seat,
                        lead(free,2)over(order by seat_id) as next_two_seat,
                        lag(free) over(order by seat_id) as prev_seat,
                        lag(free,2) over(order by seat_id) as  prev_two_seat
                        from cinema)
                        select seat_id
							from cte 
                            where (curr_seat=1 and next_seat=1 and next_two_seat=1) or
								  (curr_seat=1 and prev_seat=1 and next_seat=1) or
                                  (curr_seat=1 and prev_seat=1 and prev_two_seat=1)
                                  order by seat_id;

use sql_challenge;
create table salesperson(
sales_id int,
name varchar(30),
salary bigint,
commision_rate int,
hire_date date,
primary key(sales_id));


create table company(
com_id int,
name varchar(30),
city varchar(30),
primary key(com_id));

create table orders5(
order_id int,
order_date date,
com_id int,
sales_id int,
amount bigint,
primary key(order_id),
foreign key(com_id) references company(com_id),
foreign key(sales_id)references salesperson(sales_id));

select * from salesperson;
select * from company;
select * from orders5;

-- Q59.Write an SQL query to report the names of all the salespersons who did not have any orders related to
-- the company with the name "RED". Return the result table in any order
with cte as(
select s.sales_id,s.name as seller_name,c.name as company_name
from salesperson s left join orders5 o on s.sales_id=o.sales_id left join company c on o.com_id=c.com_id
)
select seller_name 
from cte where seller_name not in (select distinct seller_name from cte where company_name='RED');
use sql_challenge;
create table triangle(
x int,
y int,
z int,
primary key(x,y,z)
);
select * from triangle;

-- Q60. Write an SQL query to report for every three line segments whether they can form a triangle.
-- Return the result table in any order

SELECT X,Y,Z,
CASE WHEN (X+Y)>Z  AND (Y+Z)>X AND (X+Z)>Y THEN 'YES' ELSE 'NO' END AS TRIANGLE
FROM triangle;
use sql_challenge;
create table point(
x int,
primary key(x));
insert into point values(-1);
insert into point values(0);
insert into point values(2);
select * from point;

-- Q61.Write an SQL query to report the shortest distance between any two points from the Point table
with cte as(
select p1.x,p2.x as x1 ,abs(p1.x-p2.x) as diff from 
point p1 inner join point p2 
on p1.x>p2.x or p1.x<p2.x
)
select min(diff) as shortest from cte;
use sql_challenge;
create table actiondirector(
actor_Id int,
director_id int,
timestamp int,
primary key(timestamp));

-- Q62.Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has
-- cooperated with the director at least three times.
-- Return the result table in any order.

select actor_id,director_Id
from actiondirector
group by actor_id,director_id
having count(*)>=3;
use sql_challenge;
create table sales2(
sale_id int,
product_id int,
year int,
quantity int,
price int,
primary key(sale_id,year),
foreign key(product_id) references product5(product_id));
create table product5(
product_id int,
product_name varchar(30),
primary key(product_id));
select * from sales2;
select * from product5;

-- Q63.Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.
-- Return the resulting table in any order.
select p.product_name,s.year,s.price
from sales2 s left join product5 p
on s.product_id=p.product_id;

use sql_challenge;
create table project1(
project_id int,
employee_Id int,
primary key(project_id ,employee_id),
foreign key(employee_id) references employee4(employee_Id));
create table employee4(
employee_Id int,
name varchar(30),
exp_year int,
primary key(employee_id));

select * from project1;
select * from employee4;

-- Q64.Write an SQL query that reports the average experience years of all the employees for each project,
-- rounded to 2 digits.Return the result table in any order.
select p.project_id,round(avg(e.exp_year),1) as average_years
from project1 p left join employee4 e
on p.employee_id=e.employee_Id
group by project_id;

use sql_challenge;
create table product6(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_Id));
create table sales3(
seller_id int,
product_Id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key(product_id) references product6(product_id));

select * from product6;
select * from sales3;

--  Q65.Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.
-- Return the result table in any order.
with cte as(
select seller_id,sum(price) as total_salesprice
from sales3
group by seller_id
)
select seller_id from cte where total_salesprice=(select max(total_salesprice) from cte) order by seller_id;



use sql_challenge;
create table product7(
product_id int,
product_name varchar(30),
unit_price int,
primary key(product_Id));
create table sales4(
seller_id int,
product_Id int,
buyer_id int,
sale_date date,
quantity int,
price int,
foreign key(product_id) references product7(product_id));
select * from product7;
select * from sales4;
-- Q66.Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and
-- iPhone are products present in the Product table. Return the result table in any order
with cte as(
select s.buyer_id, group_concat(p.product_name) as products
from product7 p left join sales4 s
on p.product_Id=s.product_Id
group by buyer_id
order by buyer_id
)
select buyer_id from cte
where 'S8' in(products) and 'iphone' not in(products);
use sql_challenge;
create table customer4(
customer_id int,
name varchar(30),
visited_on date,
amount int ,
primary key (customer_id, visited_on));
select  * from customer4;

-- Q.67Write an SQL query to compute the moving average of how much the customer paid in a seven days
-- window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
-- Return result table ordered by visited_on in ascending order.
with cte as(
select visited_on,sum(amount) amount
from customer4
group by visited_on)
select visited_on,amount,average_amount from(
select visited_on,sum(amount) over(order by visited_on rows between 6 preceding  and current row) as amount,
round(sum(amount) over(order by visited_on rows between 6 preceding  and current row)/7,2) as average_amount,
lag(visited_on,6) over(order by visited_on) as prev_6
from cte)a
where prev_6 is not null
order by visited_on;
use sql_challenge;
create table scores(
player_name varchar(30),
gender varchar(30),
day date,
score_points int,
primary key (gender,day));
select * from scores;

-- Q68.Write an SQL query to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
select gender,day,sum(score_points) over(partition by gender order by day) as total 
from scores
order by gender;

use sql_challenge;
create table logs(
log_id int,
primary key(log_id));
insert into logs values(1);
insert into logs values(2);
insert into logs values(3);
insert into logs values(7);
insert into logs values(8);
insert into logs values(10);
select * from logs;

-- Q69.Write an SQL query to find the start and end number of continuous ranges in the table Logs.
-- Return the result table ordered by start_id.
with cte as(
select log_Id,log_id-row_number() over(order by log_id) as gp
from logs
)
select distinct first_value(log_id) over(partition by gp order by log_Id) as start,
		first_value(log_id) over(partition by gp order by log_id desc) as end
        from cte;
use sql_challenge;
create table students2(
student_id int,
student_name varchar(30),
primary key(student_id));

create table subjects(
subject_name varchar(30),
primary key(subject_name));

create table examinations(
student_id int,
subject_name varchar(30)
);
select * from students2;
select * from subjects;
select * from examinations;

-- Q70.Write an SQL query to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

with student_subject as (
SELECT
    student_id,
    student_name,
    subject_name
FROM Students2, Subjects
ORDER BY 1
), student_exam as (
SELECT
    student_id,
    subject_name,
    COUNT(*) as attended_exams
FROM Examinations
GROUP BY 1, 2 
ORDER BY 1
) 
SELECT
    ss.student_id,
    ss.student_name,
    ss.subject_name,
    IFNULL(se.attended_exams,0) as attended_exams
FROM student_subject as ss LEFT JOIN student_exam as se
ON ss.student_id = se.student_id
AND ss.subject_name = se.subject_name
ORDER BY 1, 3;



use sql_challenge;
create table employee5(
employee_id int,
employee_name varchar(30),
manager_id int,
primary key(employee_id));

select * from employee5;

-- Q.71 Write an SQL query to find employee_id of all employees that directly or indirectly report their work to
-- the head of the company.The indirect relation between managers will not exceed three managers as the company is small.
-- Return the result table in any order
with cte as(
select e.employee_Id as employee_id ,e.manager_Id as manager_id,m.manager_id as senior_manager,sm.manager_id as head_manager
from employee5 e inner join employee5 m
on e.manager_id=m.employee_id inner join employee5 sm
on m.manager_id=sm.employee_id inner join employee5 ssm 
on sm.manager_id=ssm.employee_id
)
select employee_Id from cte
where employee_id <> manager_id and (manager_id=1 or senior_manager=1 or head_manager=1);
use sql_challenge;
create table transactions(
id int,
country varchar(30),
state enum ("approved", "declined"),
amount int,
trans_date date,
primary key(id));

select * from transactions;

-- Q72.Write an SQL query to find for each month and country, the number of transactions and their total
-- amount, the number of approved transactions and their total amount. Return the result table in any order.
select date_format(trans_date,'%Y-%m') as date from transactions;
with cte as(
select date_format(trans_date,'%Y-%m') as date,country,state,amount,
case when state='declined' then 0 else amount end amount_val,
case when state='declined' then 0 else 1 end approved_count
from transactions)
				select date as month,country,count(*) as trans_count,sum(approved_count) as approved_count,
                sum(amount) as trans_total_amount,sum(amount_val) as approved_total_amount
                from cte
                group by date,country;
use sql_challenge;
create table actions(
user_id int,
post_id int,
action_date date,
action enum('view', 'like', 'reaction', 'comment', 'report', 'share'),
extra varchar(30)
);
create table removals(
post_id int,
remove_date date,
primary key(post_id));

-- Q73.Write an SQL query to find the average daily percentage of posts that got removed after being
-- reported as spam, rounded to 2 decimal places.

select * from actions;
select * from removals;

with cte as(
select a.post_Id,a.action_date,
count(case when action='report' and extra='spam' then 1 else null end) as spam_count,
count(case when action='report' and extra='spam' and remove_date is not null then 1 else null end) as del_count 
from actions a left join removals r
on a.post_id=r.post_id
group by date(action_date)
)
select round(avg(daily_del_avg)) as average_daily_percent from(
select action_date,round((100.0*del_count/spam_count),2) as daily_del_avg
from cte)a
where daily_del_avg is not null;

-- Q74.Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.

-- Q74. and Q75. are same and also repeated previously

use sql_challenge;
create table activity1(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date)
);
select * from activity1;

-- Q.43 Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.
with cte as(
select player_id,event_date as curr_date,
lead(event_date) over(partition by player_Id order by event_date) as next_date
from activity1
)
select 
round(100.0*count(distinct case when datediff(next_date,curr_date)=1 then 1 else null end)/count(distinct player_id),2) as fraction
from cte;

use sql_challenge;
create table activity1(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date)
);
select * from activity1;

-- Q.43 Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.
with cte as(
select player_id,event_date as curr_date,
lead(event_date) over(partition by player_Id order by event_date) as next_date
from activity1
)
select 
round(100.0*count(distinct case when datediff(next_date,curr_date)=1 then 1 else null end)/count(distinct player_id),2) as fraction
from cte;

use sql_challenge;
create table salaries(
company_id int,
employee_id int,
employee_name varchar(30),
salary int,
primary key(company_id, employee_id));

-- Q76.Write an SQL query to find the salaries of the employees after applying taxes. Round the salary to the
-- nearest integer.
-- The tax rate is calculated for each company based on the following criteria:
-- ● 0% If the max salary of any employee in the company is less than $1000.
-- ● 24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
-- ● 49% If the max salary of any employee in the company is greater than $10000.
-- Return the result table in any order.

select * from salaries;

with cte as(
select company_id,max(salary) as max_salary from 
salaries group by company_id
)
select c.company_id,employee_id,employee_name,
		case when max_salary < 1000 then salary
        when max_salary between 1000 and 10000 then round(salary-(salary*0.24))
        when max_salary> 10000 then round(salary-(salary*0.49))
        else null end as salary
        from salaries s inner join cte c on s.company_id=c.company_id;
        
        
use sql_challenge;
create table variables(
name varchar(30),
value int,
primary key(name));

create table expressions(
left_operand varchar(15),
operator enum('<', '>', '='),
right_operand varchar(30),
primary key(left_operand, operator, right_operand) );
insert into variables values('x',66);
insert into variables values('y',77);

-- Q77.Write an SQL query to evaluate the boolean expressions in Expressions table.
-- Return the result table in any order
select * from variables;
select * from expressions;
with cte as(
select name,
		case when name like'x%' then value end as 'x_val',
        case when name like 'y%' then value end as 'y_val'
        from variables),
        cte2 as(
		select left_operand,operator,right_operand,max(x_val) as x_val,max(y_val) as y_val
		from cte v inner join expressions e
		on v.name=e.left_operand or v.name=e.right_operand
		group by left_operand,operator,right_operand)
												select left_operand,operator,right_operand,
                                                case when left_operand='x' and right_operand='y' and operator='<' and x_val<y_val then 'true'
													 when left_operand='x' and right_operand='y' and operator='>' and x_val>y_val then 'true'
													 when left_operand='x' and right_operand='x' and operator='='  and x_val=x_val then 'true' 
                                                     when left_operand='x' and right_operand='y' and operator='='  and x_val=y_val then 'true' 
                                                     when left_operand='y' and right_operand='x' and operator='<' and y_val<x_val then 'true'
													 when left_operand='y' and right_operand='x' and operator='>' and y_val>x_val then 'true'
													 when left_operand='y' and right_operand='y' and operator='='  and y_val=y_val then 'true' 
                                                     when left_operand='y' and right_operand='x' and operator='='  and x_val=y_val then 'true'
                                                     else 'false' end as value
                                                     from cte2;
                                                     

use sql_challenge;
create table person(
id int,
name varchar(30),
phone_number varchar(30),
primary key(id)
);
create table country(
name varchar(30),
country_code varchar(30),
primary key(country_code));

create table calls1(
caller_id int,
callee_id int,
duration int
);
select * from person;
select * from country;
select * from calls1;

-- Q78. Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order
with cte1 as(
select id ,name,phone_number,
case when substring(phone_number,1,1)=0 then substring(phone_number,2,2) 
	 else substring(phone_number,1,3) end as country_code
     from person),
cte2 as(
select cn.name,c.duration
from calls1 c inner join cte1 ct on c.caller_id=ct.id or c.callee_id=ct.id  left join country cn on ct.country_code=cn.country_code
order by caller_id)
select name from cte2
group by name 
having avg(duration)>(select avg(duration) from cte2);
	
                                        

use sql_challenge;
create table employee6(
employee_Id int,
name varchar(30),
months int,
salary int);
insert into employee6 values(12228,'Rose',15,1968);
insert into employee6 values(33645,'Angela',1,3443);
insert into employee6 values(45692,'Frank',17,1608);
insert into employee6 values(56118,'Patrick',7,1345);
insert into employee6 values(59725,'Lisa',11,2330);
insert into employee6 values(74197,'Kimberly',16,4372);
insert into employee6 values(78454,'Bonnie',8,1771);
insert into employee6 values(83565,'Michael',6,2017);
insert into employee6 values(98607,'Todd',5,3396);
insert into employee6 values(99989,'Joe',9,3573);


-- Q79.Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in
-- alphabetical order.

select name from employee6 order by name;


use ineuron_sql_practise;
create table if not exists station(
id int,
city varchar(21),
state varchar(30),
lat_n int,
long_w int);
insert into station values(794, 'Kissee Mills', 'MO', 139, 73);
insert into station values(824, 'Loma Mar' ,'CA', 48, 130);
insert into station values(603, 'Sandy Hook', 'CT', 72, 148);
insert into station values(478, 'Tipton' ,'IN', 33, 97);
insert into station values(619, 'Arlington', 'CO' ,75, 92);
insert into station values(711, 'Turner', 'AR' ,50, 101);
insert into station values(839, 'Slidell', 'LA' ,85, 151);
insert into station values(411, 'Negreet', 'LA', 98 ,105);
insert into station values(588, 'Glencoe', 'KY' ,46 ,136);
insert into station values(665, 'Chelsea', 'IA' ,98, 59);
insert into station values(342, 'Chignik Lagoon', 'AK' ,103, 153 );
insert into station values(733, 'Pelahatchie' ,'MS' ,38, 28);
insert into station values(441, 'Hanna City','IL' ,50, 136);
insert into station values(811, 'Dorrance', 'KS', 102, 121);
insert into station values(698, 'Albany' ,'CA' ,49, 80);
insert into station values(325, 'Monument','KS', 70, 141);
insert into station values(414, 'Manchester', 'MD' ,73, 37);
insert into station values(113, 'Prescott', 'IA' ,39 ,65);
insert into station values(971, 'Graettinger', 'IA', 94, 150);
insert into station values(266, 'Cahone', 'CO',116 ,127);

select * from station;

-- Q7. Query a list of CITY and STATE from the STATION table.
select city ,state from station;

-- Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results
-- in any order, but exclude duplicates from the answer.
select distinct city from station where id%2=0;

-- Q9. Find the difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table
select (count(city)-count(distinct city)) as diff from station;

-- Q10.Query the two cities in STATION with the shortest and longest CITY names, as well as their
-- respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
-- largest city, choose the one that comes first when ordered alphabetically

select city,char_length(city) as length from station where char_length(city)=(select max(char_length(city)) from station) order by city limit 1;
select city,char_length(city) as length from station where char_length(city)=(select min(char_length(city)) from station ) order by city limit 1;

-- Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct city from station where lower(substr(city,1,1)) in ('a','e','i','o','u');

 -- Q12.Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
 select distinct city from station where lower(substr(city,-1,1)) in ('a','e','i','o','u');
 
 -- Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where lower(substr(city,1,1)) not in ('a','e','i','o','u');

-- Q14.Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where lower(substr(city,-1,1)) NOT in ('a','e','i','o','u');

-- Q15.Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where lower(substr(city,1,1)) not in ('a','e','i','o','u') or lower(substr(city,-1,1)) NOT in ('a','e','i','o','u');

-- Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where lower(substr(city,1,1)) not in ('a','e','i','o','u') and lower(substr(city,-1,1)) NOT in ('a','e','i','o','u');



select * from station;

use sql_challenge;
create table user_transaction(
transaction_id int,
product_id int,
spend float,
transaction_date datetime);

-- Q80.Assume you are given the table below containing information on user transactions for particular
-- products. Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.
-- Output the year (in ascending order) partitioned by product id, current year's spend, previous year's
-- spend and year-on-year growth rate (percentage rounded to 2 decimal places).

select * from user_transaction;
insert into user_transaction values(1341, 123424, 1500.60, str_to_date('12312019120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1423, 123424, 1000.20, str_to_date('12312020120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1623, 123424, 1246.44, str_to_date('12312021120000','%m%d%Y%h%i%s'));
insert into user_transaction values(1322, 123424, 2145.32, str_to_date('12312022120000','%m%d%Y%h%i%s'));

with cte as(
select extract(year from transaction_date) as year,product_id,spend as curr_year_spend,
round(lag(spend) over(PARTITION BY product_id order by extract(year from transaction_date)),2)
as prev_year_spend
from user_transaction)
select * ,
case when prev_year_spend is not null then round(((curr_year_spend-prev_year_spend)/prev_year_spend*100),2)
else prev_year_spend end as yoy_rate
from cte ;
use sql_challenge;
create table inventory(
item_id int,
item_type varchar(30),
item_category varchar(30),
square_footage float);

select * from inventory;

-- Q81.Write a SQL query to find the number of prime and non-prime items that can be stored in the 500,000
-- square feet warehouse. Output the item type and number of items to be stocked.

SELECT item_type,
    (CASE WHEN item_type = 'prime_eligible' 
          THEN floor(500000/total_square_footage) * total_item_type
          ELSE floor(((500000) - (floor(500000/(SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible'))* 
          (SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible')))/(total_square_footage)
          ) * total_item_type END) AS item_count   

FROM(SELECT item_type,
      COUNT(item_type) AS total_item_type,
      SUM(square_footage) AS total_square_footage
FROM inventory
GROUP BY item_type) AS temp_table1       
ORDER BY item_count DESC;

use sql_challenge;
create table user_actions(
user_id int,
event_id int,
event_type enum("sign-in", "like", "comment"),
event_date datetime);

select * from user_actions;

-- Q82.Assume you have the table below containing information on Facebook user actions. Write a query to
-- obtain the active user retention in July 2022. Output the month (in numerical format 1, 2, 3) and the
-- number of monthly active users (MAUs)
WITH CTE AS
(
SELECT 
user_id,
event_date,
EXTRACT(MONTH FROM event_date) - LAG(EXTRact(MONTH FROM event_date)) OVER(partition by user_id order by event_date) as month_number 
FROM 
user_actions
) 
SELECT
Extract(month FROM event_date) as month,
COUNT(*) as monthly_active_users FROM
CTE
WHERE month_number = 1
GROUP by 1
ORDER BY 2 desc
LIMIT 1;

create table search_frequency(
searches int,
num_users int);

insert into search_frequency values(1,2);
insert into search_frequency values(2,2);
insert into search_frequency values(3,3);
insert into search_frequency values(4,1);

-- Q83.Write a query to report the median of searches made by a user. Round the median to one decimal
-- point.
-- Hint- Write a subquery or common table expression (CTE) to generate a series of data (that's keyword
-- for column) starting at the first search and ending at some point with an optional incremental value.

select * from search_frequency;

with cte as(
select searches
from search_frequency
group by searches,generate_series(1,num_users)
)
select round(percentile_cont(0.5) within group(order by searches)::decimal,1) as median
from search_frequency;
use sql_challenge;
create table advertiser(
user_id varchar(30),
status varchar(30));
create table daily_pay(
user_id varchar(15),
paid float);

insert into daily_pay values('yahoo',45.00);
insert into daily_pay values('alibaba', 100.00);
insert into daily_pay values('target', 13.00);

-- Q84.Write a query to update the Facebook advertiser's status using the daily_pay table. Advertiser is a
-- two-column table containing the user id and their payment status based on the last payment and
-- daily_pay table has current information about their payment. Only advertisers who paid will show up in
-- this table.

select * from advertiser;
select * from daily_pay;

WITH payment_status AS (
SELECT
  advertiser.user_id,
  advertiser.status,
  payment.paid
FROM advertiser
LEFT JOIN daily_pay AS payment
  ON advertiser.user_id = payment.user_id

UNION

SELECT
  payment.user_id,
  advertiser.status,
  payment.paid
FROM daily_pay AS payment
LEFT JOIN advertiser
  ON advertiser.user_id = payment.user_id
)

SELECT
  user_id,
  CASE WHEN paid IS NULL THEN 'CHURN'
  	WHEN status != 'CHURN' AND paid IS NOT NULL THEN 'EXISTING'
  	WHEN status = 'CHURN' AND paid IS NOT NULL THEN 'RESURRECT'
  	WHEN status IS NULL THEN 'NEW'
  END AS new_status
FROM payment_status
ORDER BY user_id;
use sql_challenge;
create table server_utilization1(
server_id int,
status_time timestamp,
session_status varchar(30));

-- Q85. Amazon Web Services (AWS) is powered by fleets of servers. Senior management has
-- requested data-driven solutions to optimise server usage.
-- Write a query that calculates the total time that the fleet of servers was running. The output should be
-- in units of full days.
-- Level - Hard
-- Hint1. Calculate individual uptimes


with cte as(
select server_id,status_time,
case when session_status='stop' then  lag(status_time) over(partition by server_id order by status_time) 
 end as prev_time
 from server_utilization1
 )
 select round(sum(running_time)/86400) as total_uptime_days from(
 select server_id,sum(timestampdiff(second,prev_time,status_time)) running_time
 from cte
 where prev_time is not null
 group by server_id)a;
use sql_challenge;
create table transactions3(
transaction_id int,
merchant_Id int,
credit_card_id int,
amount int,
transaction_timestamp datetime)

select * from transactions3;

-- Q86.Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or
-- a retry error that causes a credit card to be charged twice.
-- Using the transactions table, identify any payments made at the same merchant with the same credit
-- card for the same amount within 10 minutes of each other. Count such repeated payments


select count(t1.transaction_id) as payment_count
from transactions3 t1 inner join transactions3 t2 
on t1.merchant_id=t2.merchant_id and t1.credit_card_id=t2.credit_card_id and t1.amount=t2.amount
and t2.transaction_timestamp>t1.transaction_timestamp
where timestampdiff(minute,t1.transaction_timestamp,t2.transaction_timestamp)<10;
use sql_challenge;
create table orders6(
order_id int,
customer_id int,
trip_id int,
status enum('completed successfully', 'completed incorrectly', 'never received'),
order_timestamp timestamp);
create table trips(
dasher_id int,
trip_id int,
estimated_delivery_timestamp timestamp,
actual_delivery_timestamp timestamp);

create table customer5(
customer_id int,
signup_timestamp timestamp);

-- Q87.Write a query to find the bad experience rate in the first 14 days for new users who signed up in June
-- 2022. Output the percentage of bad experience rounded to 2 decimal places.

select * from orders6;
select * from customer5;
select * from trips;
with cte as(
select o.customer_id,o.status,c.signup_timestamp,o.order_timestamp
from orders6 o inner join  trips t on o.trip_id=t.trip_id 
inner join customer5 c on c.customer_id=o.customer_id
where extract(year from c.signup_timestamp)=2022 and month(c.signup_timestamp)=6 and datediff(o.order_timestamp,c.signup_timestamp)<=14
)
select round((100.0*count(case when status in('completed incorrectly','never received') then 1 else null end)/count(customer_id)),2)
as bad_experience_pct
from cte;


use sql_challenge;
create table scores(
player_name varchar(30),
gender varchar(30),
day date,
score_points int,
primary key (gender,day));
select * from scores;

-- Q88.Write an SQL query to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
select gender,day,sum(score_points) over(partition by gender order by day) as total 
from scores
order by gender;

use sql_challenge;
create table person(
id int,
name varchar(30),
phone_number varchar(30),
primary key(id)
);
create table country(
name varchar(30),
country_code varchar(30),
primary key(country_code));

create table calls1(
caller_id int,
callee_id int,
duration int
);
select * from person;
select * from country;
select * from calls1;

-- Q89. Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order
with cte1 as(
select id ,name,phone_number,
case when substring(phone_number,1,1)=0 then substring(phone_number,2,2) 
	 else substring(phone_number,1,3) end as country_code
     from person),
cte2 as(
select cn.name,c.duration
from calls1 c inner join cte1 ct on c.caller_id=ct.id or c.callee_id=ct.id  left join country cn on ct.country_code=cn.country_code
order by caller_id)
select name from cte2
group by name 
having avg(duration)>(select avg(duration) from cte2);
	

create table numbers(
num int,
frequency int);

insert into numbers values(0,7);
insert into numbers values(1,1);
insert into numbers values(2,3);
insert into numbers values(3,1);


-- Q90. The median is the value separating the higher half from the lower half of a data sample.
-- Write an SQL query to report the median of all the numbers in the database after decompressing the
-- Numbers table. Round the median to one decimal point.The query result format is in the following example.The Syntax is in PostgreSql

WITH searches_expanded AS (
  SELECT num
  FROM numbers
  GROUP BY 
    num, 
    GENERATE_SERIES(1, frequency))

SELECT 
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY num)::DECIMAL, 1) AS  median
FROM searches_expanded;

use sql_challenge;
create table salary1(
id int,
employee_Id int,
amount int,
pay_date date,
primary key(id),
foreign key(employee_id) references employee7(employee_id));

create table employee7(
employee_id int,
department_id int,
primary key(employee_id));

-- Q91.Write an SQL query to report the comparison result (higher/lower/same) of the average salary of
-- employees in a department to the company's average salary.
-- Return the result table in any order.
select * from salary1;
select * from employee7;
with cte1 as(
select s.pay_date,round(avg(amount),2) as comp_avg_month
from salary1 s inner join employee7 e
on s.employee_id=e.employee_id
group by month(pay_date)),
					cte2 as (
							select e.department_id,s.pay_date,round(avg(amount),2) as avg_month
						    from salary1 s inner join employee7 e
							on s.employee_id=e.employee_id
                            group by e.department_id,s.pay_date)
                           
                            select date_format(c2.pay_date,'%Y-%m') as pay_month,c2.department_id,
                            case when c2.avg_month>c1.comp_avg_month then 'higher'
								 when c2.avg_month<c1.comp_avg_month then 'lower'
                                 else 'same' end as comparison
                            from
                            cte1 c1 left join cte2 c2 
                            on c1.pay_date=c2.pay_date
                            order by department_id,month(c2.pay_date);
use sql_challenge;
create table activity2(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date));

select * from activity2;

-- Q92.Write an SQL query to report for each install date, the number of players that installed the game on
-- that day, and the day one retention.
-- Return the result table in any order.
with cte as(
select player_id,event_date as curr_date,lead(event_date) over(partition by player_id order by event_date) as next_date
from activity2
),cte1 as(
select distinct(player_id),curr_date,
case when datediff(next_date,curr_date)= 1 then 1 else 0 end as chk
from cte
group by player_id)
select curr_date as install_dt,count(player_id) as installs,round((sum(chk)/count(chk)),1)as retention_rate
from cte1
group by curr_Date;
use sql_challenge;
create table players(
player_id int,
group_id int,
primary key(player_id));

create table matches(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int,
primary key(match_id));

-- Q.93The winner in each group is the player who scored the maximum total points within the group. In the
-- case of a tie, the lowest player_id wins.
-- Write an SQL query to find the winner in each group.
-- Return the result table in any order.

select * from players;
select * from matches;
with cte as(
select m.first_player as player,m.first_score as score,p.group_id
from matches m inner join players p on m.first_player=p.player_id
union all
select m.second_player as player,m.second_score as score,p.group_id
from matches m inner join players p on m.second_player=p.player_id
),
cte2 as(
select group_id,player,sum(score)as total_score
from cte group by group_id,player
)select group_id,player as player_id from(
select group_id,player,rank() over(partition by group_Id order by total_score desc ,player)as rn
from cte2)a
where rn=1;
use sql_challenge;
create table student4(
student_id int,
student_name varchar(30),
primary key(student_id));
create table exam(
exam_id int,
student_id int,
score int,
primary key(exam_id, student_id));

-- Q94.A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not
-- return the student who has never taken any exam.Return the result table ordered by student_id.

select * from student4;
select * from exam;

with cte1 as(
select exam_id,max(score) as max_score,min(score) as min_score
from exam group by exam_id
),cte2 as(
select distinct e.student_id,s.student_name,e.exam_id,e.score,c.min_score ,c.max_score
from exam e left join student4 s
on e.student_id=s.student_id left join cte1 c on c.exam_id=e.exam_id
)
select student_id,student_name
from cte2 c where score <>min_score and score<>max_score
group by student_id having count(student_id)=(select count(student_id) from exam where c.student_id=student_id group by student_id)

use sql_challenge;
create table student4(
student_id int,
student_name varchar(30),
primary key(student_id));
create table exam(
exam_id int,
student_id int,
score int,
primary key(exam_id, student_id));

-- Q95.A quiet student is the one who took at least one exam and did not score the high or the low score.
-- Write an SQL query to report the students (student_id, student_name) being quiet in all exams. Do not
-- return the student who has never taken any exam.Return the result table ordered by student_id.

select * from student4;
select * from exam;

with cte1 as(
select exam_id,max(score) as max_score,min(score) as min_score
from exam group by exam_id
),cte2 as(
select distinct e.student_id,s.student_name,e.exam_id,e.score,c.min_score ,c.max_score
from exam e left join student4 s
on e.student_id=s.student_id left join cte1 c on c.exam_id=e.exam_id
)
select student_id,student_name
from cte2 c where score <>min_score and score<>max_score
group by student_id having count(student_id)=(select count(student_id) from exam where c.student_id=student_id group by student_id)

use sql_challenge;
create table song_history(
history_id int,
user_id int,
song_id int,
song_plays int);

create table songs_weekly(
user_id int,
song_id int,
listen_time datetime);

-- Q96.You're given two tables on Spotify users' streaming data. songs_history table contains the historical
-- streaming data and songs_weekly table contains the current week's streaming data.
-- Write a query to output the user id, song id, and cumulative count of song plays as of 4 August 2022 sorted in descending order.

select user_id,song_id,sum(song_plays) as song_plays from(
select user_id,song_id,song_plays from 
song_history union all
select user_id,song_id,count(song_id) as song_plays
from songs_weekly
where listen_time<='2022-08-04 23:59:59'
GROUP BY user_id,song_id)report
group by user_id,song_id
order by song_plays desc;

use sql_challenge;
create table emails(
email_id int,
user_id int,
signup_date datetime);

create table texts(
text_id int,
email_id int,
signup_action varchar(30));

-- Q97.New TikTok users sign up with their emails, so each signup requires a text confirmation to activate the
-- new user's account.
-- Write a query to find the confirmation rate of users who confirmed their signups with text messages.
-- Round the result to 2 decimal places

select * from texts;
select * from emails;

with cte as(
select e.email_id,t.text_id,e.signup_date,t.signup_action
from emails e left join texts t
on e.email_id=t.email_id
group by email_id having text_id=max(text_id) or text_id is null)
select 
	round((count(case when signup_action='Confirmed' then 1 else null end)/count(email_id)),2) as confirm_rate
    from cte;

use sql_challenge;
create table tweets(
tweet_id int,
user_id int,
tweet_date timestamp);

-- Q98. The table below contains information about tweets over a given period of time. Calculate the 3-day
-- rolling average of tweets published by each user for each date that a tweet was posted. Output the
-- user id, tweet date, and rolling averages rounded to 2 decimal places.
-- Hint- Use Count and group by

select * from tweets;

with cte as(
select user_id,tweet_date,count(user_id) as tweet_count
from tweets
group by user_id,date(tweet_date)
)
select user_id,tweet_date,
round(sum(tweet_count) over(partition by user_id order by tweet_date rows between 2 preceding and current row) /
count(user_id) over(partition by user_id order by tweet_date rows between 2 preceding and current row),2) as rolling_avg_3_days
from cte 
order by user_id;

use sql_challenge;
create table activities(
activity_id int,
user_id int,
activity_type enum ('send', 'open', 'chat'),
time_spent float,
activity_date datetime);

create table age_breakdown(
user_id int,
age_bucket enum('21-25', '26-30', '31-35')
);

-- Q99.Assume you are given the tables below containing information on Snapchat users, their ages, and
-- their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent
-- sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

select * from activities;
select * from age_breakdown;

select * from(
select ab.age_bucket,
round(100.0*sum(case when activity_type='send' then time_spent else 0 end)/sum(time_spent),2) as 'send_perc',
round(100.0*sum(case when activity_type='open' then time_spent else 0 end)/sum(time_spent),2) as 'open_perc'
from activities a left join age_breakdown ab
on a.user_id=ab.user_id
group by age_bucket
order by age_bucket)a
where send_perc <> 0 and open_perc <>0;
