-- add initial data --

USE meal_planning;

INSERT INTO meals 
(meal_id, meal_name, meal_type, effort)
VALUES
(1, "Chicken fajitas", "Dinner", 3),
(2, "Tuna, sweetcorn wrap", "Packed Lunch", 1),
(3, "Brioche", "Breakfast", 0);

INSERT INTO ingredients
(ingredient_id, ingredient_name, measurement_unit)
VALUES
(1, "Chicken", "grams"),
(2, "Tortilla", "wraps"),
(3, "Peppers", "unit"),
(4, "Onion", "unit"),
(5, "Tinned Tomatoes", "400g tins"),
(6, "Tuna", "tins"),
(7, "Sweetcorn", "grams"),
(8, "Mayonnaise", "tablespoons"),
(9, "Brioche", "rolls");

INSERT INTO recipe_ingredient 
(recipe_ingredient_id, meal_id, ingredient_id, amount)
VALUES
(1, 1, 1, 200),
(2, 1, 2, 1),
(3, 1, 3, 0.5),
(4, 1, 4, 0.5),
(5, 1, 5, 0.5),
(6, 2, 2, 1),
(7, 2, 6, 0.5),
(8, 2, 7, 50),
(9, 2, 8, 1.5),
(10, 3, 9, 1);

INSERT INTO reference_nutrition 
(nutrition_id, nutrition_name, nutrition_units, daily_nutrition)
VALUES
(1, "Protein", "grams", 50),
(2, "Iron", "mg", 14.8);

INSERT INTO ingredient_nutrition 
(ingredient_nutrition_id, nutrition_id, ingredient_id, amount)
VALUES
-- chicken --
(1, 1, 1, 0.28),
(2, 2, 1, 0.007),
-- tortilla --
(3, 1, 2, 4.7),
(4, 2, 2, 2),
-- brioche --
(5, 1, 9, 2.9),
(6, 2, 9, 2.19),
-- tuna --
(7, 1, 6, 6),
(8, 2, 6, 0.8);
