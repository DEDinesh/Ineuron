/*Q20.*/

/*Each row of this table contains the ID of an Ad, the ID of a user, and the action taken by this user
regarding this Ad.The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').
A company is running Ads and wants to calculate the performance of each Ad.
Performance of the Ad is measured using Click-Through Rate (CTR) where:
Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a
tie.*/

CREATE TABLE IF NOT EXISTS ADS (
    ad_id INT,
    user_id INT,
    action ENUM('Clicked', 'Viewed', 'Ignored'),
    PRIMARY KEY (ad_id , user_id)
);
TRUNCATE TABLE ADS;
INSERT INTO ADS VALUES ('1', '1', 'Clicked'),
('2', '2', 'Clicked'),
('3', '3', 'Viewed') ,
('2', '7', 'Viewed') ,
('5', '5', 'Ignored') ,
('7', '7', 'Ignored') ,
('3', '5', 'Clicked') , 
('1', '4', 'Viewed') ,
('2', '11', 'Viewed') ,
('1', '2', 'Clicked');

SELECT*FROM ADS;


SELECT AD_ID,
IFNULL(ROUND(SUM(action = 'Clicked') / SUM(action != 'Ignored')* 100,2), 0) CTR
FROM ADS
GROUP BY AD_ID
ORDER BY CTR DESC , AD_ID;


select 
ifnull(
    round(
        avg(
            case
                when action = "Clicked" then 1
                when action = "Viewed" then 0
                else null
            end
        ) * 100,
    2),
0)
as ctr
from Ads
group by ad_id
order by ctr desc, ad_id asc;

