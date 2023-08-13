/*Q19*/
CREATE table delivery(
delivery_id int PRIMARY KEY,
customer_id int,
order_date date,
customer_pref_delivery_date date);

/*The table holds information about food delivery to customers that make orders at some date and
specify a preferred delivery date (on the same order date or after it).
If the customer's preferred delivery date is the same as the order date, then the order is called
immediately; otherwise, it is called scheduled.
Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
places.*/

INSERT INTO delivery VALUES(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

SELECT ROUND(100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM delivery;

/*Output:
immediate_percentage
33.33
Explanation: The orders with delivery id 2 and 3 are immediate while the others are scheduled.*/