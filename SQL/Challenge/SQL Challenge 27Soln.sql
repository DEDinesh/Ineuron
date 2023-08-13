Create Table Users(
user_id int  primary key,
name varchar(50),
mail varchar(50));



/*Write an SQL query to find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:
● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
'_', period '.', and/or dash '-'. The prefix name must start with a letter.
● The domain is '@leetcode.com'.
Return the result table in any order.*/

TRUNCATE TABLE Users;
INSERT INTO users
VALUES
    (1, 'Winston', 'winston@leetcode.com'),
    (2, 'Jonathan', 'jonathanisgreat@example.com'), 
    (3, 'Annabelle', 'bella-@leetcode.com'),
    (4, 'Sally', 'sally.come@leetcode.com'),
    (5, 'Marwan', 'marwan2020@example.com'), 
    (6, 'David', 'david69@gmail.com'),
    (7, 'Shapiro', 'shapiro@example.com');

select * from Users
    where mail regexp '^[a-zA-Z]+[a-zA-Z0-9_\\./\\-]{0,}@leetcode.com$'
    order by user_id;