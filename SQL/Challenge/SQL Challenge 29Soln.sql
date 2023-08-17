use sql_challenge;
create table tvprogram(
program_date datetime,
content_id int,
channel varchar(30),
primary key(program_date, content_id)
);
INSERT INTO tvprogram VALUES ('2020-06-10 08:00', 1, 'LC-Channel'),
('2020-05-11 12:00', 2, 'LC-Channel'),
('2020-05-12 12:00', 3, 'LC-Channel'),
('2020-05-13 14:00', 4, 'Disney Ch'),
('2020-06-18 14:00', 4, 'Disney Ch'),
('2020-07-15 16:00', 5, 'Disney Ch');


create table content(
content_id varchar(30),
title varchar(30),
kids_content enum('Y','N'),
content_type varchar(30),
primary key(content_id)
);
INSERT INTO content VALUES(1, 'Leetcode Movie', 'N', 'Movies'),
(2, 'Alg. for Kids', 'Y', 'Series'),
(3, 'Database Sols', 'N' ,'Series'),
(4, 'Aladdin' ,'Y', 'Movies'),
(5, 'Cinderella', 'Y' ,'Movies');


select * from tvprogram;
select * from content;

-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
-- Return the result table in any order

select c.title
from tvprogram t inner join content c 
on t.content_id=c.content_id
where kids_content='Y' and content_type='Movies' and year(program_date)=2020 and month(program_date)=6;