-- setup database --

CREATE DATABASE meal_planning;
USE meal_planning;

CREATE TABLE meals
(
	meal_id INT PRIMARY KEY NOT NULL,
    meal_name VARCHAR(50) NOT NULL,
    meal_type ENUM("Breakfast", "Packed Lunch", "Hot Lunch", "Dinner"),
    effort INT CHECK (effort BETWEEN 0 AND 5)
);

CREATE TABLE ingredients
(
	ingredient_id INT PRIMARY KEY NOT NULL,
    ingredient_name VARCHAR(50) NOT NULL,
    measurement_unit VARCHAR(50) NOT NULL
);

CREATE TABLE recipe_ingredient
(
	recipe_ingredient_id INT PRIMARY KEY NOT NULL,
    meal_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount FLOAT,
    FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

CREATE TABLE reference_nutrition
(
	nutrition_id INT PRIMARY KEY NOT NULL,
    nutrition_name VARCHAR(50) NOT NULL,
    nutrition_units VARCHAR(50) NOT NULL,
    daily_nutrition FLOAT
);

CREATE TABLE ingredient_nutrition
(
	ingredient_nutrition_id INT PRIMARY KEY NOT NULL,
    nutrition_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount FLOAT,
    FOREIGN KEY (nutrition_id) REFERENCES reference_nutrition(nutrition_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);
