-- Get recipe: Given a meal name, returns a grid of the ingredients needed for 1 serving.

USE meal_planning;

drop procedure getRecipe;
Delimiter //
/**
 * getRecipe
 * 
 * Given a meal name, returns a grid of the ingredients needed for 1 serving.
 * 
 * Parameters:
 *   mealName, VARCHAR(100): Name of the meal for which you want the
 * 							 recipe, as appears in 'meals' table
 */
create procedure getRecipe (mealName VARCHAR(100))
BEGIN    
    select ri.amount, i.measurement_unit, i.ingredient_name  
	from recipe_ingredient ri 
	join ingredients i 
    -- Join the ingredient measurements with their names
	where i.ingredient_id = ri.ingredient_id and 
    -- filter to only the requested meal
    ri.meal_id = 
	(select m.meal_id from meals m where m.meal_name = mealName);
    
END//
DELIMITER ;

-- example usage --
CALL getRecipe("Chicken fajitas");

