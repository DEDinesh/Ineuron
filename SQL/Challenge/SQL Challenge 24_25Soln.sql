/*Q24.Write an SQL query to report the first login date for each player.
Return the result table in any order.*/
CREATE TABLE Activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key (player_id, event_date));
DESC Activity;

INSERT INTO Activity VALUES(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT player_id, min(event_date) as first_login
FROM Activity group by player_id;

/*Q.25 Write an SQL query to report the device that is first logged in for each player.
-- Return the result table in any order */
SELECT player_id,device_id FROM activity a WHERE event_date=(SELECT min(event_date) 
FROM activity GROUP BY player_id HAVING player_id=a.player_id);

SELECT a.player_id, a.device_id
FROM Activity a
INNER JOIN (
    SELECT player_id, MIN(event_date) AS min_event_date
    FROM Activity
    GROUP BY player_id
) b ON a.player_id = b.player_id AND a.event_date = b.min_event_date;

