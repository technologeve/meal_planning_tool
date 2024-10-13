
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



-- Also turn this functionality in to a view
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

