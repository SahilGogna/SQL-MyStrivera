select * from customer;
select * from bike;
select * from rental;
select * from membership_type;
select * from membership;

-- 1

select category, count(1) as number_of_bikes
from bike
group by category
having count(1) > 2;

-- 2.
select c.name, count(m.customer_id) as membership_count
from customer c
left join membership m
on c.id = m.customer_id
group by c.name
order by membership_count desc


--3
select 
	id,
	category,
	price_per_hour as old_price_per_hour,
	case
		when category like 'electric' then round(price_per_hour - (0.1)*price_per_hour,2)
		when category like 'mountain bike' then round(price_per_hour - (0.2)*price_per_hour,2)
		else round(price_per_hour - (0.5)*price_per_hour, 2) 
	end as new_price_per_hour,
	price_per_day as old_price_per_day,
	case
		when category like 'electric' then round(price_per_day - (0.2)*price_per_day,2)
		when category like 'mountain bike' then round(price_per_day - (0.5)*price_per_day,2)
		else round(price_per_day - (0.5)*price_per_day,2) 
	end as new_price_per_day
from bike

-- 4
-- sum

select 
	category,
	sum(case when status = 'available' then 1 else 0 end) as available_bike_count,
	sum(case when status = 'rented' then 1 else 0 end) as rented_bike_count
from bike
group by category


-- count 
select 
	category,
	count(case when status = 'available' then 1 end) as available_bike_count,
	count(case when status = 'rented' then 1 end) as rented_bike_count
from bike
group by category

-- subquery
select 
	category,
	sum(available) as available,
	sum(rented) as rented
from 
	(select 
		category,
		case when status = 'available' then 1 else 0 end as available,
		case when status = 'rented' then 1 else 0 end as rented
	from bike) bike_status
group by category


-- CTE

with 
	bike_status as (select 
		category,
		case when status = 'available' then 1 else 0 end as available,
		case when status = 'rented' then 1 else 0 end as rented
	from bike)
select 
	category,
	sum(available) as available,
	sum(rented) as rented
from bike_status
group by category

-- 5
-- ** to be solved using other methods as well
select * from
(select 
	text(extract(year from start_timestamp)) as year,
	text(extract(month from start_timestamp)) as month,
	sum(total_paid)
from rental
group by year, month

union all

select 
	extract(year from start_timestamp) as year,
	null as month,
	sum(total_paid)
from rental
group by year

union all
 
select 
 null as year,
 null as month,
 sum(total_paid)
from rental
) a
order by year, month

-- 6

select 
	extract(year from start_date) as year, 
	extract(month from start_date) as month,
	mt.name as membership_type_name,
	sum(m.total_paid)
from membership m
left join membership_type mt
on m.membership_type_id = mt.id
group by year, month, mt.name
order by year, month, mt.name;

-- 7 pending

-- 8
with 
	rental_count as (
	select customer_id, count(1) 
	from rental 
	group by customer_id),
	
	rental_category_count as(
	select 
		case when count < 5 then 'fewer than 5'
			 when count >= 5 and count <=10 then 'between 5 and 10'
		     else 'more than 10' 
		end as rental_count_category
	from rental_count)
select rental_count_category, count(*) as customer_count
from rental_category_count
group by rental_count_category
order by customer_count
