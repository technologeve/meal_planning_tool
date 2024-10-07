-- add more data
USE meal_planning;

INSERT INTO meals 
(meal_id, meal_name, meal_type, effort)
VALUES
(4, "Italian Penicillin Soup", "Dinner", 1),
(5, "Tomato pasta", "Dinner", 1),
(6, "Jani me fasule (white bean soup)", "Dinner", 1);

INSERT INTO ingredients
(ingredient_id, ingredient_name, measurement_unit)
VALUES
(10, "Ginger", "inches"),
(11, "Vegetable Stock", "cubes"),
(12, "Carrots", "unit"),
(13, "Celery", "sticks"),
(14, "Garlic", "cloves"),
(15, "Pasta", "grams"),
(16, "Cheddar", "grams"),
(17, "White beans", "tins"),
(18, "Butter", "grams"),
(19, "Tomato purée", "tablespoons"),
(20, "Paprika", "teaspoons"),
(21, "Chili powder", "teaspoons");

INSERT INTO recipe_ingredient 
(recipe_ingredient_id, meal_id, ingredient_id, amount)
VALUES
(11, 4, 11, 1),
(12, 4, 4, 2),
(13, 4, 10, 0.25),
(14, 4, 12, 2),
(15, 4, 13, 4),
(16, 4, 14, 6),
(17, 4, 15, 50),
(18, 5, 15, 75),
(19, 5, 5, 1),
(20, 5, 4, 1),
(21, 5, 11, 1),
(22, 5, 16, 50),
(23, 5, 20, 1),
(24, 5, 18, 5),
(25, 6, 17, 1),
(26, 6, 4, 1),
(27, 6, 18, 100),
(28, 6, 19, 3),
(29, 6, 20, 1),
(30, 6, 21, 0.25);

INSERT INTO ingredient_nutrition 
(ingredient_nutrition_id, nutrition_id, ingredient_id, amount)
VALUES
-- onion --
-- protein, iron --
(9, 1, 4, 1.2),
(10, 2, 4, 0.2),
-- pasta --
(11, 1, 15, 0.81),
(12, 2, 15, 0.005),
-- carrots --
(13, 1, 12, 0.5),
(14, 2, 12, 0.2);
