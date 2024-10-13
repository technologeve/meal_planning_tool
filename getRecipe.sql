-- Get recipe: Given a meal name, returns a grid of the ingredients needed for 1 serving.

USE meal_planning;

drop procedure get_recipe;
Delimiter //
/**
 * get_recipe
 * 
 * Given a meal name, returns a grid of the ingredients needed for 1 serving.
 * 
 * Parameters:
 *   mealName, VARCHAR(100): Name of the meal for which you want the
 * 							 recipe, as appears in 'meals' table
 */
create procedure get_recipe (mealName VARCHAR(100))
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
CALL get_recipe("Chicken fajitas");


-- get the nutritional values for a meal
drop procedure get_recipe;
Delimiter //
/**
 * get_nutrition_for_meal
 * 
 * Given a meal name, returns the nutritional info for 1 serving.
 * 
 * Parameters:
 *   mealName, VARCHAR(100): Name of the meal for which you want the
 * 							 nutritional info, as appears in 'meals' table
 */
create procedure get_nutrition_for_meal(mealName VARCHAR(100))
BEGIN
	-- filter to just nutrition info
	select 
		   -- calculate total nutrition for meal
           sum(nutrition_measurements.nutrition_for_recipe) as nutrition_amt, 
		   rn.nutrition_units,
		   rn.nutrition_name,
           -- compare total meal nutrition to daily reference values
		   round(100 *sum(nutrition_measurements.nutrition_for_recipe) / rn.daily_nutrition, 2) as percentage_of_daily_ref
		   
	-- join nutrition info and recipe
    from reference_nutrition rn 
	join 
		(select joined_table.ingredient_name, joined_table.ingredient_id, i_n.nutrition_id, round(i_n.amount * joined_table.amount, 2) as nutrition_for_recipe
		from ingredient_nutrition i_n
		join (select ri.amount, i.measurement_unit, i.ingredient_name, i.ingredient_id  
			from recipe_ingredient ri 
			join ingredients i 
			-- Join the ingredient measurements with their names
			where i.ingredient_id = ri.ingredient_id and 
			-- filter to only the requested meal
			ri.meal_id = 
			(select m.meal_id from meals m where m.meal_name = mealName)) joined_table
		where joined_table.ingredient_id = i_n.ingredient_id) 
	nutrition_measurements
	where rn.nutrition_id = nutrition_measurements.nutrition_id
    
    -- tally all the ingredients in a meal together by nutrition count
	group by rn.nutrition_name, rn.daily_nutrition, rn.nutrition_units;
END//
DELIMITER ;

-- example usage --
CALL get_nutrition_for_meal("Chicken fajitas");