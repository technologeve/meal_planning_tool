
use meal_planning;

-- Create a view --
drop view dinners;

create view dinners as 
select * from meals m
where m.meal_type = "Dinner";

select * from dinners;

-- Create a view which uses a join --
drop view no_tinned_tomatoes;

create view no_tinned_tomatoes as
select m.meal_name, sum(r_i.ingredient_id = 5) as has_tomatoes from meals m
join recipe_ingredient r_i
where m.meal_id = r_i.meal_id
group by m.meal_name
having has_tomatoes = 0;

select * from no_tinned_tomatoes;
