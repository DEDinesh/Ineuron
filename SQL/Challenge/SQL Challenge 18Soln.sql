/*Q18.
There is no primary key for this table, it may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some
date.
Note that equal author_id and viewer_id indicate the same person.
Write an SQL query to find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order.*/
CREATE TABLE views(
article_id int,
author_id int,
viewer_id int,
view_date date);
ALTER TABLE views MODIFY COLUMN view_date VARCHAR(20);
INSERT INTO views VALUES( 1,3,5,"08/01/2019"),
( 1,3,6,"08/02/2019"),
( 2,7,7,"08/01/2019"),
( 2,7,6,"08/02/2019"),
( 4,7,1,"07/22/2019"),
( 3,4,4,"07/21/2019"),
( 3,4,4,"07/21/2019");

SELECT DISTINCT author_id AS id FROM views WHERE author_id=viewer_id ORDER BY author_id ASC;

