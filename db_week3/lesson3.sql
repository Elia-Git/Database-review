-- Active: 1674514482231@@127.0.0.1@3306@db_week3

use db_week3;
SELECT * FROM meal;

-- Additional queries
-- Get meals that has a price smaller than a specific price fx 90
SELECT*FROM meal
WHERE price <=13.00;

-- Get meals that still has available reservations
SELECT meal.*, sum(reservation.number_of_guests) AS Total_reserved_yet
FROM meal
JOIN reservation ON meal.id = reservation.meal_id
GROUP BY reservation.meal_id
HAVING meal.max_reservations > Total_reserved_yet;

-- Get meals that partially match a title. Rød grød med will match the meal with the title Rød grød med fløde
SELECT *
FROM meal
WHERE title LIKE '%grøde%';
-- Get meals that has been created between two dates
SELECT *
FROM  meal
WHERE  Created_date BETWEEN '2020-02-01' AND '2020-05-01';
-- Get only specific number of meals fx return only 5 meals
SELECT *
FROM meal
LIMIT 3;
-- Get the meals that have good reviews
SELECT meal.id,meal.title,review.stars AS Stars_recieved FROM meal
JOIN review ON meal.id=review.Meal_Id
WHERE review.stars>80;
-- Get reservations for a specific meal sorted by created_date
SELECT meal.description,reservation.created_date AS reservation_Created_date
FROM meal
JOIN reservation ON meal.id = reservation.meal_id 
where meal_id=1
ORDER BY reservation.created_date ASC;
--alternative
SELECT *
FROM reservation
WHERE meal_id = 3
ORDER BY created_date DESC;
-- Sort all meals by average number of stars in the reviews
SELECT review.meal_id,meal.title ,meal.description,Round(AVG(stars),0)
FROM meal
JOIN  review ON meal.id=review.meal_id
GROUP BY meal.id
ORDER BY AVG(review.stars) ASC;
