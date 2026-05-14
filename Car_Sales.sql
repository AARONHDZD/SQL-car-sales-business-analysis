-- CREATE DATABASE drive_motors;
USE drive_motors;

CREATE TABLE car_sales (
car_name VARCHAR(100),
company VARCHAR(100),
year INT,
selling_price BIGINT,
fuel_type VARCHAR(25),
transmission VARCHAR(50),
mileage INT,
engine_CC INT
);

-- 1. Which brands generate the highest average selling price?
SELECT * from car_sales;

SELECT 
company, 
ROUND(AVG(selling_price),2) AS average_sellprice 
FROM car_sales
GROUP BY company
ORDER BY average_sellprice DESC;

-- 2. Which fuel type dominates the market?
SELECT fuel_type, COUNT(*) AS fueltype_dominance FROM car_sales
GROUP BY fuel_type
ORDER BY fuel_type DESC;

-- PETROL DOMINATES THE MARKET 

-- 3. Are automatic vehicles more expensive?
CREATE VIEW price_diff AS
SELECT transmission, ROUND(AVG(selling_price),2) AS average_price
FROM car_sales
GROUP BY transmission;
SELECT transmission, average_price, average_price - LEAD(average_price) OVER(ORDER BY average_price DESC) AS tsm_price_diff
FROM price_diff;

-- 4. Is there a relationship between engine size and vehicle price?
SELECT 
engine_CC,
ROUND(AVG(selling_price),2) AS AVG_price 
FROM car_sales
GROUP BY engine_CC
ORDER BY AVG_price DESC;

-- 5. Which models offer the best fuel efficiency?
SELECT company, car_name, mileage AS fuel_efficiency
FROM car_sales
ORDER BY mileage DESC
LIMIT 3;

-- Models with the best fuel_efficiency are Suzuki Alto (22mpL), Suzuki Mehran (20mpL) and Suzuki Cultus (19mpL)

-- 6. What is the average vehicle value by year?
SELECT year, ROUND(AVG(selling_price),2) FROM car_sales
GROUP BY year
ORDER BY year;

-- 7. Which brands provide the best average fuel efficiency?

SELECT company, ROUND(AVG(mileage),2) AS avg_fuel_efficiency 
FROM car_sales
GROUP BY company
ORDER BY avg_fuel_efficiency DESC
LIMIT 3;

-- Suzuki (19.75mpL), Honda (14.33mpL) and Toyota (13mpL) offer better average fuel efficiency

-- 8. Price segmentation
SELECT company, car_name, selling_price,
CASE
	WHEN selling_price <= 2500000 THEN 'Budget'
    WHEN selling_price BETWEEN 2500000 AND 5000000 THEN 'Mid Range'
    ELSE 'Premium' 
    END AS car_segment
FROM car_sales
ORDER BY selling_price;

-- 9. Most expensive vehicles
SELECT company, car_name, selling_price, transmission, engine_CC,
RANK() OVER(ORDER BY selling_price DESC) as TOP_5
FROM car_sales
LIMIT 5;

-- 10. Which fuel type and transmission combination is the most common?
SELECT fuel_type, transmission, COUNT(*) AS combination_registered FROM car_sales
GROUP BY fuel_type,transmission;

-- Premium vehicles View
CREATE VIEW premium_vehicles AS
SELECT * FROM car_sales WHERE selling_price > 5000000
ORDER BY selling_price DESC;

SELECT * FROM premium_vehicles;

-- Average company selling price ranking
CREATE VIEW company_prank AS
SELECT company, ROUND(AVG(selling_price),2) AS AVG_PRICE
FROM car_sales
GROUP BY company;
SELECT *, RANK() OVER(ORDER BY AVG_PRICE DESC) AS brand_rank
FROM company_prank; 

