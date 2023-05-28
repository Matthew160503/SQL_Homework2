-- Задание 1
DROP DATABASE IF EXISTS gb_homework2;
CREATE DATABASE IF NOT EXISTS gb_homework2;

USE gb_homework2;

CREATE TABLE IF NOT EXISTS sales(
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT UNSIGNED NOT NULL
);

DESC sales;

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

SELECT * FROM sales;

-- Задание 2
SELECT 
	id AS "id заказа",
    IF (count_product < 100, 'Маленький заказ',
		IF(count_product BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ'))
	As 'Тип заказа'
FROM sales;

-- Задание 3
Drop Table orders;
CREATE TABLE IF NOT EXISTS orders(
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(4) not null,
    amount DOUBLE NOT NULL,
    order_status varchar(10) NOT NULL
);
		
DESC orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03',15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT 
		id AS 'id_order',
		IF(order_status = 'OPEN', 'Order is in open state',
			IF(order_status = 'CLOSED','Order is closed','Order is cancelled'))
        AS 'full_order_status'
FROM orders;