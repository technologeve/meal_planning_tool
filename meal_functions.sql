
use meal_planning;

-- get the number of ingredients in a recipe --
drop function get_ingredient_count;

delimiter //
create function get_ingredient_count(mealName VARCHAR(100))
returns int deterministic
begin
	declare ingredient_count int;

	select count(r_i.ingredient_id) 
	into ingredient_count
	from recipe_ingredient r_i
	join meals m
	where m.meal_id = r_i.meal_id 
    and m.meal_name = mealName;
    
	return ingredient_count;
end//
delimiter ;

select get_ingredient_count("Chicken fajitas");
select get_ingredient_count("Brioche");



-- Also turn this functionality in to a view --
-- This includes a subquery --
drop view ingredient_count_view;

create view ingredient_count_view as
select m.meal_name, count(r_i.ingredient_id) as ingredient_count
from recipe_ingredient r_i
join meals m
where m.meal_id = r_i.meal_id
group by r_i.meal_id
order by ingredient_count;

select * from ingredient_count_view;

select * from ingredient_count_view icv 
where icv.ingredient_count =
(
	select max(ingredient_count)
	from ingredient_count_view
);

-- aditional example query with subquery --
-- find the nutritional info for chicken --
select * from ingredient_nutrition;
select * from ingredient_nutrition i_n where 
i_n.ingredient_id = (
	select i.ingredient_id
	from ingredients i 
	where i.ingredient_name = "Chicken"	
);
