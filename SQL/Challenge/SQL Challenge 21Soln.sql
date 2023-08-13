/*Q21.*/
CREATE TABLE Employee(
employee_id int primary key,
team_id int);

INSERT INTO Employee VALUES(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

/*Write an SQL query to find the team size of each of the employees.
Return result table in any order.*/

SELECT employee_id, COUNT(team_id) OVER (PARTITION BY team_id) team_size
FROM Employee order by employee_id ASC;
